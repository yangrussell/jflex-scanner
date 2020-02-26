package scanner;

/**
* This file defines a simple lexer for the compilers course 2017-2018.
* It parses contact information for the following fields:
* Email address (i.e. '22johnd@students.harker.org')
* Phone number (i.e. '408-123-4567')
* Name (i.e. 'John B Doe')
* Zip code (i.e. '95129')
* State (i.e. 'CA')
* Street address (i.e. '500 Saratoga Avenue')
* Github URL (i.e. 'https://github.com/johndoe')
* Instagram handle (i.e. '@johndoe7')
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
%column
%public
%function nextToken
/*  return String objects - the actual lexemes */
/*  returns the String "END: at end of file */
%type String
%eofval{
return "END";
%eofval}
LineTerminator = \r|\n|\r\n
WhiteSpace = {LineTerminator} | [ \t\f]
 
 
%%
/**
 * lexical rules
 */
^\w+@\w+\.\w+{LineTerminator}               {return "EMAIL ADDRESS: " + yytext();}
^\d{5}{LineTerminator}					    {return "ZIP CODE: " + yytext();}
^[A-Z]{2}{LineTerminator}					{return "STATE: " + yytext();}
^\d{3}-\d{3}-\d{4}{LineTerminator}  		{return "PHONE NUMBER: " + yytext();}
\d+[ ]([A-Z][a-z]*[ ]?)+{LineTerminator}	{return "STREET ADDRESS: " + yytext();}
^([A-Z][a-z]*[ ]?){2}{LineTerminator}	    {return "NAME: " + yytext();}
^https:\/\/github.com\/\w+{LineTerminator}	{return "GITHUB: " + yytext();}
^@[\w_.]+{LineTerminator}					{return "INSTAGRAM HANDLE: " + yytext();}
{WhiteSpace}		                        { /* Do nothing */ }
.			                                { /* Do nothing */ }
