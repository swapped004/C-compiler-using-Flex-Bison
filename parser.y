%{
#include<bits/stdc++.h>
#include<iostream>
#include<cstdlib>
#include<cstring>
#include<cmath>
#include<fstream>
#include "symbol_table.h"


using namespace std;


int yyparse(void);
int yylex(void);


extern FILE *yyin;
extern long long int yylineno;
extern ofstream tok;
extern long long int error_cnt;


SymbolTable st(30);
ofstream fp2,fp3;


void print_line()
{
	fp2<<"At Line No: "<<yylineno<<" ";
}

void error_print_line()
{
	fp3<<"Error At Line No: "<<yylineno<<" ";
}

vector<string> spiltWord(string str)
{
	vector<string> res;
    string word = "";
    for (auto x : str) 
    {
        if (x == ' ')
        {
            //cout << word << endl;
			res.push_back(word);
            word = "";
        }
        else {
            word = word + x;
        }
    }
	//cout << word << endl;
	res.push_back(word);

	return res;
}


void yyerror(char *s)
{
	//write your code
}

//mapping of variable and types for a specific scope

map<string,string> global_type_mapper;
map<string,int> declare_mapper;

map<string,string> prev_global_type_mapper;
map<string,int> prev_declare_mapper;

//local mappers
map<string,int> mapper;
map<string,string> type_mapper;


vector<string> scope_var;

//declaration_list vector
vector<pair<string,int>> decl_list;

//function param_list
vector<pair<string,string>> param_list;


bool insert_ID(string name, string data_type, int is_array)
{
	SymbolInfo* s = st.Look_up_current(name);

	if(s == NULL)
	{
		st.Insert(name,"ID");
		SymbolInfo* temp = st.Look_up_current(name);
		temp->set_data_type(data_type);
		if(is_array == 1)
			temp->set_array(true);
		return true;
	}

	return false;
}

bool insert_function(string name, string return_type,int flag)
{
	SymbolInfo* s = st.Look_up(name);

	if(s == NULL)
	{
		st.Insert(name,"func");
		SymbolInfo* temp = st.Look_up_current(name);
		temp->set_func((int)param_list.size(),return_type,param_list,flag);

		return true;
	}

	return false;

}

bool check_var_declared(string name)
{
	SymbolInfo *s = st.Look_up(name);

	if(s != NULL)
		return true;
	else
		return false;

}

bool check_func_declared(string name)
{
	SymbolInfo* s = st.Look_up(name);
	func_param* f = s->get_func();

	if(f->get_flag() == 0)
	{
		//make it defined
		f->set_flag(1);
		return true;
	}

	else
		return false;
}

void set_data_type(SymbolInfo* s1, SymbolInfo* s2)
{
	s1->set_data_type(s2->get_data_type());
}

void enterScope_parser()
{
	cout<<"entered scope"<<endl;
	st.enter_scope();

	//add func parameters int the new scope
	for(auto x:param_list)
	{
		cout<<"("<<x.first<<", "<<x.second<<")"<<endl;
		fp2<<"("<<x.first<<", "<<x.second<<")"<<endl;
		
		st.Insert(x.first, "ID");
		SymbolInfo* si = st.Look_up(x.first);
		si->set_data_type(x.second);
	}

	prev_global_type_mapper = global_type_mapper;
	prev_declare_mapper = declare_mapper;
}

void exitScope_parser()
{
	cout<<"exited scope"<<endl;
	//remove scope variables from declare_mapper
	//remove scope variable from global_type_mapper

	global_type_mapper = prev_global_type_mapper;
	declare_mapper = prev_declare_mapper;

	//clear scope mappers
	mapper.clear();
	type_mapper.clear();
	scope_var.clear();
	st.exit_scope();
}






%}

%union{int ival;SymbolInfo* si;}

%token <si> CONST_INT CONST_FLOAT CONST_CHAR ID
%token <si> INT FLOAT VOID CHAR DOUBLE IF ELSE FOR WHILE RETURN PRINTLN CONTINUE DO
%token <si> ASSIGNOP NOT INCOP DECOP LOGICOP RELOP ADDOP MULOP
%token <si> LPAREN RPAREN LCURL RCURL LTHIRD RTHIRD COMMA SEMICOLON 

%type <si> type_specifier declaration_list var_declaration variable
%type <si> id
%type <si> factor unary_expression term simple_expression rel_expression logic_expression expression expression_statement
%type <si> arguments argument_list
%type <si> statement statements compound_statement
%type <si> parameter_list func_definition func_declaration
%type <si> start program unit
%type <si> dummy_token_begin dummy_token_end

%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE


%%

start: program
	{
		$$ = new SymbolInfo($1->getName(), "NON_TERMINAL");
		print_line();
		fp2<<"start : program\n"<<endl;
		fp2<<$$->getName()<<endl<<endl;
	}
	;

program: program unit 
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"program : program unit\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;
		}
	| unit
		{
			$$ = new SymbolInfo($1->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"program : unit\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;
		}
	;
	
unit: var_declaration
		{
			$$ = new SymbolInfo($1->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"unit : var_declaration\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;
		}
     | func_declaration
     	{	
			$$ = new SymbolInfo($1->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"unit : func_declaration\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;
		}
     | func_definition
     	{
			$$ = new SymbolInfo($1->getName(), "NON_TERMINAL");
		 	print_line();
			fp2<<"unit : func_definition\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;
		}
     ;
     
func_declaration: type_specifier id LPAREN parameter_list RPAREN SEMICOLON
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName()+" "+$6->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"func_declaration : type_specifier ID LPAREN parameter_list RPAREN SEMICOLON\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;

			//insert into symbol table
			bool ok = insert_function($2->getName(),$1->getName(),0);

			if(!ok)
			{
				error_cnt++;
				error_print_line();
				fp3<<"function already declared:" <<$2->getName()<<endl<<endl;
			}
			
			//clear the parameter list
			param_list.clear();
		}
		| type_specifier id LPAREN RPAREN SEMICOLON
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"func_declaration : type_specifier ID LPAREN RPAREN SEMICOLON\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;

			///insert into symbol table
			bool ok = insert_function($2->getName(),$1->getName(),0);

			if(!ok)
			{
				error_cnt++;
				error_print_line();
				fp3<<"function already declared:" <<$2->getName()<<endl<<endl;
			}
			
			//clear the parameter list
			param_list.clear();
		}
		;
		 
func_definition: type_specifier id LPAREN parameter_list RPAREN compound_statement
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName()+" "+$6->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"func_definition : type_specifier ID LPAREN parameter_list RPAREN compound_statement\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;

			//insert into symbol table
			bool ok = insert_function($2->getName(),$1->getName(),1);

			if(!ok)
			{
				//check if declared before
				bool declared = check_func_declared($2->getName());

				if(!declared)
				{
					error_cnt++;
					error_print_line();
					fp3<<"function already declared:" <<$2->getName()<<endl<<endl;
				}
			}

		}
		| type_specifier id LPAREN RPAREN compound_statement
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"func_definition : type_specifier ID LPAREN RPAREN compound_statement\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;

			//insert into symbol table
			bool ok = insert_function($2->getName(),$1->getName(),1);

			if(!ok)
			{
				//check if declared before
				bool declared = check_func_declared($2->getName());

				if(!declared)
				{
					error_cnt++;
					error_print_line();
					fp3<<"function already declared:" <<$2->getName()<<endl<<endl;
				}
			}

		}
 		;				


parameter_list: parameter_list COMMA type_specifier id
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"parameter_list: parameter_list COMMA type_specifier id\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;

			//add to param list
			param_list.push_back(make_pair($4->getName(),$3->getName()));

			
		}
		| parameter_list COMMA type_specifier
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"parameter_list: parameter_list COMMA type_specifier\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;

			//add to param list
			param_list.push_back(make_pair("",$3->getName()));
		}
 		| type_specifier id
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"parameter_list: type_specifier id\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;

			//add to param_list
			param_list.push_back(make_pair($2->getName(),$1->getName()));
		}
		| type_specifier
		{
			$$ = new SymbolInfo($1->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"parameter_list: type_specifier\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;

			//add to param list
			param_list.push_back(make_pair("",$1->getName()));
		}
 		;

 		
compound_statement: LCURL dummy_token_begin statements RCURL dummy_token_end
			{
				$$ = new SymbolInfo($1->getName()+" "+$3->getName()+" "+$4->getName(), "NON_TERMINAL");
				print_line();
				fp2<<"compound_statement: LCURL dum statements RCURL dum\n"<<endl;
				fp2<<$$->getName()<<endl<<endl;
			}
 		    | LCURL dummy_token_begin RCURL dummy_token_end
			{
				$$ = new SymbolInfo($1->getName()+" "+$3->getName(), "NON_TERMINAL");
				print_line();
				fp2<<"compound_statement: LCURL RCURL\n"<<endl;
				fp2<<$$->getName()<<endl<<endl;
			}
 		    ;

dummy_token_begin:
				 {
					 fp2<<"here in dummy token begin"<<endl;
					 enterScope_parser();
					 //add_function_param();

				 }
				 ;

dummy_token_end:
				 {
					 fp2<<"here in dummy token end"<<endl;
					 param_list.clear();
					 exitScope_parser();
				 }
				 ;
 		    
var_declaration: type_specifier declaration_list SEMICOLON
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"var_declaration: type_specifier declaration_list SEMICOLON\n"<<endl;
			fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()<<endl<<endl;


			//mapping the types of all variables in declaration list
			for(auto x:decl_list)
			{
				cout<<x.first<<" : "<<x.second<<endl;
				
				bool val = insert_ID(x.first,$1->getName(),x.second);

				if(!val)
				{
					error_cnt++;
					error_print_line();
					fp3<<"multiple declaration of variable "<<x.first<<endl<<endl;
				}
				
				// if(mapper[x] == 0)
				// {
				// 	scope_var.push_back(x);
				// 	mapper[x]++;
				// 	declare_mapper[x]++;
				// 	type_mapper[x] = $1->getName();
				// 	global_type_mapper[x] = $1->getName();
				// }
				// else
				// {
				// 	error_cnt++;
				// 	error_print_line();
				// 	fp3<<"multiple declaration of variable "<<x<<endl<<endl;
				// }
			}
			decl_list.clear();
		}
 		;
 		 
type_specifier: INT
			{
				$$ = new SymbolInfo("int","NON_TERMINAL");
				print_line();
				fp2<<"type_specifier: "<<"INT\n"<<endl;
				fp2<<"int\n"<<endl;
			}
 		| FLOAT
 		{
			$$ = new SymbolInfo("float","NON_TERMINAL");
			print_line();
			fp2<<"type_specifier: "<<"FLOAT\n"<<endl;
			fp2<<"float\n"<<endl;
		}
 		| VOID
 		{
			$$ = new SymbolInfo("void","NON_TERMINAL");
			print_line();
			fp2<<"type_specifier: "<<"VOID\n"<<endl;
			fp2<<"void\n"<<endl;
		}
 		;
 		
declaration_list: declaration_list COMMA id
			{
				$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(), "NON_TERMINAL");
				print_line();
				fp2<<"declaration_list : declaration_list COMMA ID\n"<<endl;
				fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()<<endl<<endl;

				decl_list.push_back(make_pair($3->getName(),0));
			}
 		  | declaration_list COMMA id LTHIRD CONST_INT RTHIRD
 		  	{
				$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName()+" "+$6->getName(), "NON_TERMINAL");
				print_line();
				fp2<<"declaration_list : declaration_list COMMA ID LTHIRD CONST_INT RTHIRD\n"<<endl;
				fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName()+" "+$6->getName()<<endl<<endl;

				decl_list.push_back(make_pair($3->getName(),1));
			}
 		  | id
 		  {
 		  		$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
 		  		print_line();
				fp2<<"declaration_list : ID\n"<<endl;
				fp2<<$1->getName()<<endl<<endl;

				//decl_list.clear();
				decl_list.push_back(make_pair($1->getName(),0));
 		  }
 		  | id LTHIRD CONST_INT RTHIRD
 		  {
			    $$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName(), "NON_TERMINAL");
 		  		print_line();
				fp2<<"declaration_list: ID LTHIRD CONST_INT RTHIRD\n"<<endl;
				fp2<<$1->getName()+$2->getName()+" "+$3->getName()+$4->getName()<<endl<<endl;

				//decl_list.clear();
				decl_list.push_back(make_pair($1->getName(),1));
 		  }
 		  ;
 		  
statements: statement
			{
				$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
 		  		print_line();
				fp2<<"statements : statement\n"<<endl;
				fp2<<$1->getName()<<endl<<endl;
 		  	}
		
	   | statements statement
	   {
		   	$$ = new SymbolInfo($1->getName()+" "+$2->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"statements : statements statement\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;

 		}
	   ;
	   
statement: var_declaration
		{
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"statement : var_declaration\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;

 		}
		
	  | expression_statement
	   {
		   	$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"statement : expression_statement\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;
 		}
	  | compound_statement
	  {
		  	$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"statement : compound_statement\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;

 		}
	  | FOR LPAREN expression_statement expression_statement expression RPAREN statement
	  {
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName()+" "+$6->getName()+" "+$7->getName(), "NON_TERMINAL");
 		  	print_line();
			fp2<<"statement: FOR LPAREN expression_statement expression_statement expression RPAREN statement\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;

 		}
	  | IF LPAREN expression RPAREN statement %prec LOWER_THAN_ELSE
	   {
		   	$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName(), "NON_TERMINAL");
 		  	print_line();
			fp2<<"statement: IF LPAREN expression RPAREN statement\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;

 		}
	  | IF LPAREN expression RPAREN statement ELSE statement
	  {
		  	$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName()+" "+$6->getName()+" "+$7->getName(), "NON_TERMINAL");
 		  	print_line();
			fp2<<"statement: IF LPAREN expression RPAREN statement ELSE statement\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;

 		}
	  | WHILE LPAREN expression RPAREN statement
	  {
		  	$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName(), "NON_TERMINAL");
 		  	print_line();
			fp2<<"statement: WHILE LPAREN expression RPAREN statement\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;

 		}
	  | PRINTLN LPAREN id RPAREN SEMICOLON
	   {
		   	$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName(), "NON_TERMINAL");
 		  	print_line();
			fp2<<"statement: PRINTLN LPAREN id RPAREN SEMICOLON\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;

 		}
	  | RETURN expression SEMICOLON
	  	{
			fp2<<"RETURN symbol->name: "<<$1->getName()<<endl<<endl;
		  	$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(), "NON_TERMINAL");
 		  	print_line();
			fp2<<"statement: RETURN expression SEMICOLON"<<endl;
			fp2<<$$->getName()<<endl<<endl;

 		}
	  ;
	  
expression_statement: SEMICOLON	
		{
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"expression_statement: SEMICOLON\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;

 		}		
			| expression SEMICOLON 
			{
				$$ = new SymbolInfo($1->getName()+" "+$2->getName(),"NON_TERMINAL");
	 		  	print_line();
				fp2<<"expression SEMICOLON\n"<<endl;
				fp2<<$1->getName()+$2->getName()<<endl<<endl;

 			}
			;
	  
variable: id
		{
			//check if ID is declared or not
			if(!check_var_declared($1->getName()))
			{
				error_cnt++;
				error_print_line();
				fp3<<"variable "<<$1->getName()<<" not declared"<<endl;
			}
			
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
			//set variable data type according to id's data type
			SymbolInfo* s = st.Look_up($1->getName());
			if(s != NULL)
				set_data_type($$,s);
			print_line();
			fp2<<"variable : ID\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;

 		}		
	 	| id LTHIRD expression RTHIRD
	 	{
			//check if ID is declared or not
			if(!check_var_declared($1->getName()))
			{
				error_cnt++;
				error_print_line();
				fp3<<"variable "<<$1->getName()<<" not declared"<<endl;
			}

			else
			{	
				//check is the id actually declared as an array
				SymbolInfo *s = st.Look_up($1->getName());
				if(!s->get_array())
				{
					error_cnt++;
					error_print_line();
					fp3<<$1->getName()+" not an array"<<endl<<endl;

				}		
			}

			//check array's index is integer type
			fp2<<$3->get_data_type()<<endl<<endl;
			if($3->get_data_type() != "int")
			{
				error_cnt++;
				error_print_line();
				fp3<<"array index not integer"<<endl<<endl;
			}
			
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName(), "NON_TERMINAL");
			//set variable data type according to id's data type
			SymbolInfo* s = st.Look_up($1->getName());
			if(s != NULL)
				set_data_type($$,s);
			print_line();
			fp2<<"variable : ID LTHIRD expression RTHIRD\n"<<endl;
			fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()<<endl<<endl;
 		} 
	 ;
	 
 expression: logic_expression	
 		{
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
			//set data type of expression
			set_data_type($$,$1);
 		  	print_line();
			fp2<<"expression : logic_expression\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;


 		} 
	   | variable ASSIGNOP logic_expression 
	   {
		   	$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"expression : variable ASSIGNOP logic_expression\n"<<endl;
			fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()<<endl<<endl;

			//set data type of logic expression
			set_data_type($$,$1);


			//find error if operands of assignment operations are not compatible
			if($1->get_data_type() != $3->get_data_type())
			{
				error_cnt++;
				error_print_line();
				fp3<<"operands of assignment operations are not compatible"<<endl<<endl;
			}

 		} 	
	   ;
			
logic_expression: rel_expression 	
 		{
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
			//set data type of logic expression
			set_data_type($$,$1);
 		  	print_line();
			fp2<<"logic_expression : rel_expression\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;

 		} 	
		 | rel_expression LOGICOP rel_expression 
		 {
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(),"NON_TERMINAL");
			//set data type of logic expression
			set_data_type($$,$1);
 		  	print_line();
			fp2<<"logic_expression : rel_expression LOGICOP rel_expression\n"<<endl;
			fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()<<endl<<endl;

 		} 		
		 ;
			
rel_expression: simple_expression 
		{
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
			//set data type of rel expression
			set_data_type($$,$1);
 		  	print_line();
			fp2<<"rel_expression	: simple_expression\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;
 		} 	
		| simple_expression RELOP simple_expression	
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(),"NON_TERMINAL");
			//set data type of rel expression
			set_data_type($$,$1);
 		  	print_line();
			fp2<<"rel_expression	: simple_expression RELOP simple_expression\n"<<endl;
			fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()<<endl<<endl;
 		} 
		;
				
simple_expression: term 
		{
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
			//set data type of simple expression
			set_data_type($$,$1);
 		  	print_line();
			fp2<<"simple_expression : term\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;
 		} 
		  | simple_expression ADDOP term 
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(),"NON_TERMINAL");
			//set data type of simple expression
			set_data_type($$,$1);

 		  	print_line();
			fp2<<"simple_expression ADDOP term\n"<<endl;
			fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()<<endl<<endl;
 		} 
		  
		  ;
					
term:	unary_expression
		{
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
			//set data type of term
			set_data_type($$,$1);
 		  	print_line();
			fp2<<"term :unary_expression\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;
 		}
     |  term MULOP unary_expression
     	{
		 	$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(),"NON_TERMINAL");
			//set data type of term
			set_data_type($$,$2);

			//check operands of modulus operator
			if($2->getName() == "%")
			{
				if($1->get_data_type() != "int" | $3->get_data_type() != "int")
				{
					error_cnt++;
					error_print_line();
					fp3<<"operands of the modulus operation have to be integer"<<endl<<endl;
				}

			}


 		  	print_line();
			fp2<<"term :term MULOP unary_expression\n"<<endl;
			fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()<<endl<<endl;
 		}
     ;

unary_expression: ADDOP unary_expression
 		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName(),"NON_TERMINAL");
			//set data type of unary expression
			set_data_type($$,$2);
 		  	print_line();
			fp2<<"unary_expression : ADDOP unary_expression\n"<<endl;
			fp2<<$1->getName()+" "+$2->getName()<<endl<<endl;

 		}  
		 | NOT unary_expression
		 {
			$$ = new SymbolInfo($1->getName()+" "+$2->getName(),"NON_TERMINAL");
			//set data type of unary expression
			set_data_type($$,$2);
 		  	print_line();
			fp2<<"unary_expression : NOT unary_expression\n"<<endl;
			fp2<<$1->getName()+" "+$2->getName()<<endl<<endl;

 		}   
		 | factor 
		 {
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
			//set data type of unary expression
			set_data_type($$,$1);
 		  	print_line();
			fp2<<"unary_expression : factor\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;

 		}  
		 ;
	
factor: variable 
 		{
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
			//set data type of factor
			set_data_type($$,$1);
 		  	print_line();
			fp2<<"factor: variable\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;
 		} 
	| id LPAREN argument_list RPAREN
	{
		$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName(), "NON_TERMINAL");
 	  	print_line();
		fp2<<"factor: id LPAREN argument_list RPAREN\n"<<endl;
		fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()<<endl;
 	} 
	| LPAREN expression RPAREN
	{
		$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(), "NON_TERMINAL");
 		print_line();
		fp2<<"factor: LPAREN expression RPAREN\n"<<endl;
		fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()<<endl<<endl;

	} 
	| CONST_INT 
	{
		$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
		$$->set_data_type("int");
 		print_line();
		fp2<<"factor: CONST_INT\n"<<endl;
		fp2<<$1->getName()<<endl<<endl;
	} 
	| CONST_FLOAT
	{
		$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
		$$->set_data_type("float");
	  	print_line();
		fp2<<"factor: CONST_FLOAT\n"<<endl;
		fp2<<$1->getName()<<endl<<endl;
 	} 
	| variable INCOP
	{
		$$ = new SymbolInfo($1->getName()+" "+$2->getName(),"NON_TERMINAL");
		//set data type of factor
		set_data_type($$,$1);
 	  	print_line();
		fp2<<"factor: variable INCOP\n"<<endl;
		fp2<<$1->getName()+" "+$2->getName()<<endl<<endl;
 	}  
	| variable DECOP
	{
		$$ = new SymbolInfo($1->getName()+" "+$2->getName(),"NON_TERMINAL");
		//set data type of factor
		set_data_type($$,$1);
 	  	print_line();
		fp2<<"factor: variable INCOP\n"<<endl;
		fp2<<$1->getName()+" "+$2->getName()<<endl<<endl;
 	} 
	;
	
argument_list: arguments
		{
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"argument_list : arguments\n"<<endl;
			fp2<<$1->getName()<<endl;
 		} 
		|
		{
			$$ = new SymbolInfo("", "NON_TERMINAL");
 		  	print_line();
			fp2<<"argument_list : \n"<<endl;
			fp2<<""<<endl<<endl;

 		} 
			  ;
	
arguments: arguments COMMA logic_expression
			{
				$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(), "NON_TERMINAL");
				print_line();
				fp2<<"arguments : arguments COMMA logic_expression\n"<<endl;
				fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()<<endl<<endl;

 			} 
	      | logic_expression
	     	{
				$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
				print_line();
				fp2<<"arguments : logic_expression\n"<<endl;
				fp2<<$1->getName()<<endl;
 			} 
	      ;
	      
id: ID
	{		
		//st.Insert($1->getName(),$1->getType());
		$$ = new SymbolInfo($1->getName(),$1->getType());		
		//print_line();
		//fp2<<"id: ID"<<endl;
	}
;
 


%%
int main(int argc,char *argv[])
{
	FILE *fp;

	if((fp=fopen(argv[1],"r"))==NULL)
	{
		printf("Cannot Open Input File.\n");
		exit(1);
	}

	/*fp2= fopen(argv[2],"w");//log file
	fclose(fp2);
	fp3= fopen(argv[3],"w");//error_file
	fclose(fp3);
	
	fp2= fopen(argv[2],"a");
	fp3= fopen(argv[3],"a");
	*/
	

	yyin=fp;
	
	fp2.open(argv[2]);
	fp3.open(argv[3]);
	
	yyparse();	

	tok.open("1705025_token.txt");
	//yylineno = 1;


	st.Print_all();
	//out<<"Total lines: "<<yylineno-1<<endl;
	//out<<"Total errors: "<<error_cnt<<endl;
	fclose(yyin);
	
	return 0;
}

