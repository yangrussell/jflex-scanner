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

"abb"			{return "Found " + yytext() + " at line " + yyline + " and column " + yycolumn; } 
[a-z A-Z][0-9 a-z A-Z]*	{return "ID: " + yytext();}
[0-9]+			{return "NUM:" + yytext();}
{WhiteSpace}		{}
.			{ /* do nothing */ }