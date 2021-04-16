%option noyywrap yylineno


%{

#include<cstdlib>
#include<iostream>
#include<fstream>

#include "symbol_table.h"


#include "y.tab.h"


using namespace std;

void yyerror(char*);  // yyerror() function for generating error message
extern YYSTYPE yylval;  
extern SymbolTable st;   // NOTICE

//output to token file
ofstream tok;
//number of errors
long long int error_cnt = 0;
//tracking string and comments
string temp = "";
long long int line_begin = 0;



%}

AlphaNumeric [a-zA-Z0-9]
digit [0-9]
letter [A-Za-z]
ws [ \t\n\f\v\r]
others [^A-Za-z0-9]
all ([^A-Z]|[A-Z])

%%
{ws}+	{}
(\n)+ 	{}

if		{return IF;}
else	{return ELSE;}
for		{return FOR;}
while	{return WHILE;}
do		{return DO;}
int		{
			
			return INT;
		}
char	{return CHAR;}
float	{
			
			return FLOAT;
		}
double	{return DOUBLE;}
void	{
			
			return VOID;
		}
return	{return RETURN;}
continue {return CONTINUE;}
println {return PRINTLN;}


{digit}+	 {
			 SymbolInfo* si = new SymbolInfo(yytext,"CONST_INT");
			 yylval.si = si; 
			 return CONST_INT;
			 }
{digit}+(.{digit}+)?([Ee][+-]?{digit}+)?	 {
  											 SymbolInfo* si = new SymbolInfo(yytext,"CONST_FLOAT");
			 								 yylval.si = si; 
			 								 return CONST_FLOAT;
			 								 }
([\'][\\][tnafrbv0\'\"\\][\'])|([\'][^\'\"\\\n][\']) 	 {
														 SymbolInfo* si = new SymbolInfo(yytext,"CONST_CHAR");
			 											 yylval.si = si; 
														 return CONST_CHAR;
														 }


[+-]	 {
		 SymbolInfo* si = new SymbolInfo(yytext,"ADDOP");
		 yylval.si = si; 
    	 return ADDOP;
    	 }
    	 
[*/%]	 {
		 SymbolInfo* si = new SymbolInfo(yytext,"MULOP");
		 yylval.si = si; 
    	 return MULOP;
    	 }
    	 
"++"	    {
			SymbolInfo* si = new SymbolInfo(yytext,"INCOP");
		 	yylval.si = si; 
    	 	return INCOP;
    	 	}
    	 	
"--" 		{
			SymbolInfo* si = new SymbolInfo(yytext,"DECOP");
		 	yylval.si = si; 
    	 	return DECOP;
    	 	}
([<>](=)?)|([=!](=))	{
						SymbolInfo* si = new SymbolInfo(yytext,"RELOP");
					 	yylval.si = si;
					 	return RELOP;
					 	}
"="			{
			SymbolInfo* si = new SymbolInfo(yytext,"ASSIGNOP");
		 	yylval.si = si;
    	 	return ASSIGNOP;
    	 	}
("&&"|"||")	{
			SymbolInfo* si = new SymbolInfo(yytext,"LOGICOP");
		 	yylval.si = si;
    	 	return LOGICOP;
    	 	}
"!"			{
			SymbolInfo* si = new SymbolInfo(yytext,"NOT");
		 	yylval.si = si;
    	 	return NOT;
    	 	}
"(" 		{
			SymbolInfo* si = new SymbolInfo(yytext,"LPAREN");
		 	yylval.si = si;
    	 	return LPAREN;
    	 	}
")" 		{
			SymbolInfo* si = new SymbolInfo(yytext,"RPAREN");
		 	yylval.si = si; 
    	 	return RPAREN;
    	 	}
"{"			{
			SymbolInfo* si = new SymbolInfo(yytext,"LCURL");
		 	yylval.si = si;
		 	//st.enter_scope();	
    	 	return LCURL;
    	 	}
	 
"}"         {
			SymbolInfo* si = new SymbolInfo(yytext,"LCURL");
		 	yylval.si = si;
		 	//st.exit_scope();
    	 	return LCURL;
		    } 
"[" 		{
			SymbolInfo* si = new SymbolInfo(yytext,"LTHIRD");
		 	yylval.si = si;
    	 	return LTHIRD;
    	 	}
"]" 		{
			SymbolInfo* si = new SymbolInfo(yytext,"RTHIRD");
		 	yylval.si = si;
    	 	return RTHIRD;
    	 	}
","			{
			SymbolInfo* si = new SymbolInfo(yytext,"COMMA");
		 	yylval.si = si;
    	 	return COMMA;
    	 	}
";"			{
			SymbolInfo* si = new SymbolInfo(yytext,"SEMICOLON");
		 	yylval.si = si;
    	 	return SEMICOLON;
    	 	}



({letter}|(_))({AlphaNumeric}|(_))*	{
									cout<<"here in lex ID"<<endl;
									SymbolInfo* si = new SymbolInfo(yytext,"ID");
		 							yylval.si = si; 
    	 							return ID;
    	 							}
									 


%%

