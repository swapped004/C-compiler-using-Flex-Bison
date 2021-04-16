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


void yyerror(char *s)
{
	//write your code
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
		}
		| type_specifier id LPAREN RPAREN SEMICOLON
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"func_declaration : type_specifier ID LPAREN RPAREN SEMICOLON\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;
		}
		;
		 
func_definition: type_specifier id LPAREN parameter_list RPAREN compound_statement
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName()+" "+$6->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"func_definition : type_specifier ID LPAREN parameter_list RPAREN compound_statement\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;

		}
		| type_specifier id LPAREN RPAREN compound_statement
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"func_definition : type_specifier ID LPAREN RPAREN compound_statement\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;
		}
 		;				


parameter_list: parameter_list COMMA type_specifier id
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"parameter_list: parameter_list COMMA type_specifier id\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;
		}
		| parameter_list COMMA type_specifier
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"parameter_list: parameter_list COMMA type_specifier\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;
		}
 		| type_specifier id
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"parameter_list: type_specifier id\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;
		}
		| type_specifier
		{
			$$ = new SymbolInfo($1->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"parameter_list: type_specifier\n"<<endl;
			fp2<<$$->getName()<<endl<<endl;
		}
 		;

 		
compound_statement: LCURL statements RCURL
			{
				$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(), "NON_TERMINAL");
				print_line();
				fp2<<"compound_statement: LCURL statements RCURL\n"<<endl;
				fp2<<$$->getName()<<endl<<endl;
			}
 		    | LCURL RCURL
			{
				$$ = new SymbolInfo($1->getName()+" "+$2->getName(), "NON_TERMINAL");
				print_line();
				fp2<<"compound_statement: LCURL RCURL\n"<<endl;
				fp2<<$$->getName()<<endl<<endl;
			}
 		    ;
 		    
var_declaration: type_specifier declaration_list SEMICOLON
		{
			$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"var_declaration: type_specifier declaration_list SEMICOLON\n"<<endl;
			fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()<<endl<<endl;
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
			}
 		  | declaration_list COMMA id LTHIRD CONST_INT RTHIRD
 		  	{
				$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName()+" "+$6->getName(), "NON_TERMINAL");
				print_line();
				fp2<<"declaration_list : declaration_list COMMA ID LTHIRD CONST_INT RTHIRD\n"<<endl;
				fp2<<$1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName()+" "+$5->getName()+" "+$6->getName()<<endl<<endl;
			}
 		  | id
 		  {
 		  		$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
 		  		print_line();
				fp2<<"declaration_list : id\n"<<endl;
				fp2<<$1->getName()<<endl<<endl;
 		  }
 		  | id LTHIRD CONST_INT RTHIRD
 		  {
			    $$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName(), "NON_TERMINAL");
 		  		print_line();
				fp2<<"declaration_list: ID LTHIRD CONST_INT RTHIRD\n"<<endl;
				fp2<<$1->getName()+$2->getName()+" "+$3->getName()+$4->getName()<<endl<<endl;
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
			$$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"variable : ID\n"<<endl;
			fp2<<$1->getName()<<endl<<endl;
 		}		
	 	| id LTHIRD expression RTHIRD
	 	{
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

