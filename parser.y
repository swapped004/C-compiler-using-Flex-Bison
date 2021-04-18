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
vector<string> decl_list;

//function param_list
vector<pair<string,string>> param_list;

void enterScope_parser()
{
	cout<<"entered scope"<<endl;
	st.enter_scope();
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

void add_function_param()
{
	for(auto x:param_list)
	{
		cout<<"("<<x.first<<", "<<x.second<<")"<<endl;
		fp2<<"("<<x.first<<", "<<x.second<<")"<<endl;
		scope_var.push_back(x.first);
		mapper[x.first]++;
		declare_mapper[x.first]++;
		type_mapper[x.first] = x.second;
		global_type_mapper[x.first] = x.second;
	}

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
			SymbolInfo* func_id = st.Look_up($2->getName());
			func_id->set_func((int)param_list.size(), $1->getName(), param_list);

			//clear the parameter list
			param_list.clear();
		}
		| type_specifier id LPAREN RPAREN SEMICOLON
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"func_declaration : type_specifier ID LPAREN RPAREN SEMICOLON\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;

			//insert into symbol table
			SymbolInfo* func_id = st.Look_up($2->getName());
			func_id->set_func((int)param_list.size(), $1->getName(), param_list);

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
			SymbolInfo* func_id = st.Look_up($2->getName());
			func_id->set_func((int)param_list.size(), $1->getName(), param_list);



		}
		| type_specifier id LPAREN RPAREN compound_statement
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"func_definition : type_specifier ID LPAREN RPAREN compound_statement\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;

			//insert into symbol table
			SymbolInfo* func_id = st.Look_up($2->getName());
			func_id->set_func((int)param_list.size(), $1->getName(), param_list);
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
					 add_function_param();
					 enterScope_parser();

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
			for(string x:decl_list)
			{
				cout<<x<<endl;
				if(mapper[x] == 0)
				{
					scope_var.push_back(x);
					mapper[x]++;
					declare_mapper[x]++;
					type_mapper[x] = $1->getName();
					global_type_mapper[x] = $1->getName();
				}
				else
				{
					error_cnt++;
					error_print_line();
					fp3<<"multiple declaration of variable "<<x<<endl<<endl;
				}
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

				decl_list.push_back($3->getName());
			}
 		  | declaration_list COMMA id LTHIRD CONST_INT RTHIRD
 		  	{
				$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName()+" "+$6->getName(), "NON_TERMINAL");
				print_line();
				fp2<<"declaration_list : declaration_list COMMA ID LTHIRD CONST_INT RTHIRD\n"<<endl;
				fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName()+" "+$6->getName()<<endl<<endl;

				decl_list.push_back($3->getName());
			}
 		  | id
 		  {
 		  		$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
 		  		print_line();
				fp2<<"declaration_list : id\n"<<endl;
				fp2<<$1->getName()<<endl<<endl;

				decl_list.clear();
				decl_list.push_back($1->getName());
 		  }
 		  | id LTHIRD CONST_INT RTHIRD
 		  {
			    $$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName(), "NON_TERMINAL");
 		  		print_line();
				fp2<<"declaration_list: ID LTHIRD CONST_INT RTHIRD\n"<<endl;
				fp2<<$1->getName()+$2->getName()+" "+$3->getName()+$4->getName()<<endl<<endl;

				decl_list.clear();
				decl_list.push_back($1->getName());
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
			if(declare_mapper[$1->getName()] == 0)
			{
				error_cnt++;
				error_print_line();
				fp3<<"variable "<<$1->getName()<<" not declared"<<endl;
			}
			
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
			print_line();
			fp2<<"variable : ID\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;

 		}		
	 	| id LTHIRD expression RTHIRD
	 	{
			//check if ID is declared or not
			if(declare_mapper[$1->getName()] == 0)
			{
				error_cnt++;
				error_print_line();
				fp3<<"variable "<<$1->getName()<<" not declared"<<endl;
			}
			
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"variable : ID LTHIRD expression RTHIRD\n"<<endl;
			fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()<<endl<<endl;
 		} 
	 ;
	 
 expression: logic_expression	
 		{
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
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


			//find error if operands of assignment operations are not compatible
			string var_name = $1->getName();
			vector<string> vec;
			vec = spiltWord(var_name);
			var_name = vec[0];

			string var_type = type_mapper[var_name];

			if(var_type == "")
				var_type = global_type_mapper[var_name];
			
			cout<<"var_name: " << var_name<<" -> var_type: "<<var_type<<endl;

			//find right_type

 		} 	
	   ;
			
logic_expression: rel_expression 	
 		{
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"logic_expression : rel_expression\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;

 		} 	
		 | rel_expression LOGICOP rel_expression 
		 {
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"logic_expression : rel_expression LOGICOP rel_expression\n"<<endl;
			fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()<<endl<<endl;

 		} 		
		 ;
			
rel_expression: simple_expression 
		{
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"rel_expression	: simple_expression\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;
 		} 	
		| simple_expression RELOP simple_expression	
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"rel_expression	: simple_expression RELOP simple_expression\n"<<endl;
			fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()<<endl<<endl;
 		} 
		;
				
simple_expression: term 
		{
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"simple_expression : term\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;
 		} 
		  | simple_expression ADDOP term 
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"simple_expression ADDOP term\n"<<endl;
			fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()<<endl<<endl;
 		} 
		  
		  ;
					
term:	unary_expression
		{
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"term :unary_expression\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;
 		}
     |  term MULOP unary_expression
     	{
		 	$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"term :term MULOP unary_expression\n"<<endl;
			fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()<<endl<<endl;
 		}
     ;

unary_expression: ADDOP unary_expression
 		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"unary_expression : ADDOP unary_expression\n"<<endl;
			fp2<<$1->getName()+" "+$2->getName()<<endl<<endl;

 		}  
		 | NOT unary_expression
		 {
			$$ = new SymbolInfo($1->getName()+" "+$2->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"unary_expression : NOT unary_expression\n"<<endl;
			fp2<<$1->getName()+" "+$2->getName()<<endl<<endl;

 		}   
		 | factor 
		 {
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"unary_expression : factor\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;

 		}  
		 ;
	
factor: variable 
 		{
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
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
 		print_line();
		fp2<<"factor: CONST_INT\n"<<endl;
		fp2<<$1->getName()<<endl<<endl;
	} 
	| CONST_FLOAT
	{
		$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
	  	print_line();
		fp2<<"factor: CONST_FLOAT\n"<<endl;
		fp2<<$1->getName()<<endl<<endl;
 	} 
	| variable INCOP
	{

		$$ = new SymbolInfo($1->getName()+" "+$2->getName(),"NON_TERMINAL");
 	  	print_line();
		fp2<<"factor: variable INCOP\n"<<endl;
		fp2<<$1->getName()+" "+$2->getName()<<endl<<endl;
 	}  
	| variable DECOP
	{
		$$ = new SymbolInfo($1->getName()+" "+$2->getName(),"NON_TERMINAL");
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
		SymbolInfo* si = st.Look_up($1->getName());	

		//if not found in the SymbolTable insert it
		if(si == NULL)
		{
			st.Insert($1->getName(),$1->getType());
		}
			
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

