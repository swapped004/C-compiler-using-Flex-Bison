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

%type <si> type_specifier declaration_list var_declaration statement variable
%type <si> id
%type <si> factor expression


%%

start: program
	{
		print_line();
		fp2<<"start : program\n"<<endl;
	}
	;

program: program unit 
		{
			print_line();
			fp2<<"program : program unit\n"<<endl;
		}
	| unit
		{
			print_line();
			fp2<<"program : unit\n"<<endl;
		}
	;
	
unit: var_declaration
		{
			print_line();
			fp2<<"unit : var_declaration\n"<<endl;
		}
     | func_declaration
     	{	
			 print_line();
			fp2<<"unit : func_declaration\n"<<endl;
		}
     | func_definition
     	{
			 print_line();
			fp2<<"unit : func_definition\n"<<endl;
		}
     ;
     
func_declaration: type_specifier id LPAREN parameter_list RPAREN SEMICOLON
		{
			fp2<<"func_declaration : type_specifier ID LPAREN parameter_list RPAREN SEMICOLON"<<endl;
		}
		| type_specifier id LPAREN RPAREN SEMICOLON
		{
			fp2<<"func_declaration : type_specifier ID LPAREN RPAREN SEMICOLON"<<endl;
		}
		;
		 
func_definition: type_specifier id LPAREN parameter_list RPAREN compound_statement
		{
			fp2<<"func_definition : type_specifier ID LPAREN parameter_list RPAREN compound_statement"<<endl;
		}
		| type_specifier id LPAREN RPAREN compound_statement
		{
			fp2<<"func_definition : type_specifier ID LPAREN RPAREN compound_statement"<<endl;
		}
 		;				


parameter_list: parameter_list COMMA type_specifier id
		{
			fp2<<"parameter_list: parameter_list COMMA type_specifier id"<<endl;
		}
		| parameter_list COMMA type_specifier
		{
			fp2<<"parameter_list: parameter_list COMMA type_specifier"<<endl;
		}
 		| type_specifier id
		{
			fp2<<"parameter_list: type_specifier id"<<endl;
		}
		| type_specifier
		{
			fp2<<"parameter_list: type_specifier"<<endl;
		}
 		;

 		
compound_statement: LCURL statements RCURL
			{
				fp2<<"compound_statement: LCURL statements RCURL"<<endl;
			}
 		    | LCURL RCURL
			{
				fp2<<"compound_statement: LCURL RCURL"<<endl;
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
 		  	
 		  		print_line();
				fp2<<"statements : statement"<<endl;

 		  	}
		
	   | statements statement
	   {
 		  	print_line();
			fp2<<"statements : statements statement"<<endl;

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
 		  	print_line();
			fp2<<"statement : expression_statement"<<endl;

 		}
	  | compound_statement
	  {
 		  	print_line();
			fp2<<"statement : compound_statement"<<endl;

 		}
	  | FOR LPAREN expression_statement expression_statement expression RPAREN statement
	  {
 		  	print_line();
			fp2<<"FOR LPAREN expression_statement expression_statement expression RPAREN statement"<<endl;

 		}
	  | IF LPAREN expression RPAREN statement
	   {
 		  	print_line();
			fp2<<"IF LPAREN expression RPAREN statement"<<endl;

 		}
	  | IF LPAREN expression RPAREN statement ELSE statement
	  {
 		  	print_line();
			fp2<<"IF LPAREN expression RPAREN statement ELSE statement"<<endl;

 		}
	  | WHILE LPAREN expression RPAREN statement
	  {
 		  	print_line();
			fp2<<"WHILE LPAREN expression RPAREN statement"<<endl;

 		}
	  | PRINTLN LPAREN id RPAREN SEMICOLON
	   {
 		  	print_line();
			fp2<<"PRINTLN LPAREN id RPAREN SEMICOLON"<<endl;

 		}
	  | RETURN expression SEMICOLON
	  {
 		  	print_line();
			fp2<<"RETURN expression SEMICOLON"<<endl;

 		}
	  ;
	  
expression_statement: SEMICOLON	
		{
 		  	print_line();
			fp2<<"expression_statement 	: SEMICOLON	"<<endl;

 		}		
			| expression SEMICOLON 
			{
	 		  	print_line();
				fp2<<"expression SEMICOLON 	"<<endl;

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
 		  	print_line();
			fp2<<"expression : logic_expression	"<<endl;

 		} 
	   | variable ASSIGNOP logic_expression 
	   {
 		  	print_line();
			fp2<<"expression : variable ASSIGNOP logic_expression "<<endl;

 		} 	
	   ;
			
logic_expression: rel_expression 	
 		{
 		  	print_line();
			fp2<<"logic_expression : rel_expression "<<endl;

 		} 	
		 | rel_expression LOGICOP rel_expression 
		 {
 		  	print_line();
			fp2<<"logic_expression : rel_expression LOGICOP rel_expression "<<endl;

 		} 		
		 ;
			
rel_expression: simple_expression 
		{
			$ = new SymbolInfo($1->getName(),"NON_TERMINAL");
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
		//$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName(), "NON_TERMINAL");
 	  	print_line();
		fp2<<"factor: id LPAREN argument_list RPAREN\n"<<endl;
 	} 
	| LPAREN expression RPAREN
	{
		//$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(), "NON_TERMINAL");
 		print_line();
		fp2<<"factor: LPAREN expression RPAREN\n"<<endl;

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
 		  	print_line();
			fp2<<"argument_list : arguments"<<endl;

 		} 
			  |
			  {
 		  	print_line();
			fp2<<"argument_list : "<<endl;

 		} 
			  ;
	
arguments: arguments COMMA logic_expression
			{
				print_line();
				fp2<<"arguments : arguments COMMA logic_expression"<<endl;

 			} 
	      | logic_expression
	     	{
				print_line();
				fp2<<"arguments : logic_expression"<<endl;

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

