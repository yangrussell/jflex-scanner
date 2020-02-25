package scanner;

/**
* This file defines a simple lexer for the compilers course 2017-2018
* Comment this file
*/
import java.io.*;


%%
/* lexical functions */
/* specify that the class will be called Scanner and the function to get the next
 * token is called nextToken.  
 */
%class Scanner
%unicode
%line
%public
%function nextToken
/*  return String objects - the actual lexemes */
/*  returns the String "END: at end of file */
%type String
%eofval{
return "END";
%eofval}
/* use switch statement to encode DFA */
%switch

/**
 * Pattern definitions
 */
 
 

%%
/**
 * lexical rules
 */
[\w][\w(\.\w)]*@[a-zA-Z]*.[a-zA-Z]* {return "EMAIL ADDRESS: " + yytext()}
\d\d\d-\d\d\d-\d\d\d\d				{return "PHONE NUMBER: " + yytext()}
[a-zA-Z._-]* [a-zA-Z._-]*			{return "NAME: " + yytext()}
[\d]* [\w-]* [A-Z][a-z].			{return "STREET ADDRESS: " + yytext()}
\d\d\d\d\d							{return "ZIP CODE: " + yytext()}
[a-zA-Z- ]*							{return "CITY: " + yytext()}
\w\w								{return "STATE: " + yytext()}
@[\w_.]*							{return "INSTAGRAM HANDLE: " + yytext()}
.			                        { /* do nothing */ }
