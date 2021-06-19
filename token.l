%{
#include "y.tab.h"
#include "grammarTree.h"
#include "error.h"
void yyerror(const char *msg);
void tokenError(char c);
%}
SINGLE_COMMENT  "//".*
BLOCK_COMMENT \/\*[^*]*\*+([^/*][^*]*\*+)*\/
TYPE ((int)|(float))
LP \(
RP \)
LB \[
RB \]
LC \{
RC \}
STRUCT (struct)
RETURN (return)
IF (if)
ELSE (else)
WHILE (while)
INT (([0])|([1-9]([0-9]*))|(0x[0-9a-fA-F]+)|(0[0-7]+))
FLOAT ((([0])|([1-9]([0-9]*)))\.[0-9]+)
ID ([A-Za-z_][A-Za-z_0-9]*)
SEMI ;
COMMA ,
ASSIGNOP =
RELOP (>)|(<)|(>=)|(<=)|(==)|(!=)
PLUS \+
MINUS \-
STAR \*
DIV \/
AND &&
OR \|\|
DOT \.
NOT !
%%
{BLOCK_COMMENT} {}
{SINGLE_COMMENT} {}
{STRUCT}	{/*printf("STRUCT\n");*/__UPDATEVAL AddNode("STRUCT"); return STRUCT;}
{RETURN}	{/*printf("RETURN\n");*/__UPDATEVAL AddNode("RETURN"); return RETURN;}
{TYPE}	{/*printf("TYPE\n");*/__UPDATEVAL AddNode("TYPE: "+string(yytext)); return TYPE;}
{IF}	{/*printf("IF\n");*/__UPDATEVAL AddNode("IF"); return IF;}
{ELSE}	{/*printf("ELSE\n");*/__UPDATEVAL AddNode("ELSE"); return ELSE;}
{WHILE}	{/*printf("WHILE\n");*/__UPDATEVAL AddNode("WHILE"); return WHILE;}
{INT}	{/*printf("INT\n");*/__UPDATEVAL AddNode("INT: "+string(yytext)); return INT;}
{FLOAT}	{/*printf("FLOAT\n");*/__UPDATEVAL AddNode("FLOAT: "+string(yytext)); return FLOAT;}
{ID}	{/*printf("ID\n");*/__UPDATEVAL AddNode("ID: "+string(yytext)); return ID;}
{SEMI}	{/*printf("SEMI\n");*/__UPDATEVAL AddNode("SEMI"); return SEMI;}
{COMMA}	{/*printf("COMMA\n");*/__UPDATEVAL AddNode("COMMA"); return COMMA;}
{ASSIGNOP}	{/*printf("ASSIGNOP\n");*/__UPDATEVAL AddNode("ASSIGNOP"); return ASSIGNOP;}
{RELOP}	{/*printf("RELOP\n");*/__UPDATEVAL AddNode("RELOP"); return RELOP;}
{PLUS}	{/*printf("PLUS\n");*/__UPDATEVAL AddNode("PLUS"); return PLUS;}
{MINUS}	{/*printf("MINUS\n");*/__UPDATEVAL AddNode("MINUS"); return MINUS;}
{STAR}	{/*printf("STAR\n");*/__UPDATEVAL AddNode("STAR"); return STAR;}
{DIV}	{/*printf("DIV\n");*/__UPDATEVAL AddNode("DIV"); return DIV;}
{AND}	{/*printf("AND\n");*/__UPDATEVAL AddNode("AND"); return AND;}
{OR}	{/*printf("OR\n");*/__UPDATEVAL AddNode("OR"); return OR;}
{DOT}	{/*printf("DOT\n");*/__UPDATEVAL AddNode("DOT"); return DOT;}
{NOT}	{/*printf("NOT\n");*/__UPDATEVAL AddNode("NOT"); return NOT;}
{LP}	{/*printf("LP\n");*/__UPDATEVAL AddNode("LP"); return LP;}
{RP}	{/*printf("RP\n");*/__UPDATEVAL AddNode("RP"); return RP;}
{LB}	{/*printf("LB\n");*/__UPDATEVAL AddNode("LB"); return LB;}
{RB}	{/*printf("RB\n");*/__UPDATEVAL AddNode("RB"); return RB;}
{LC}	{/*printf("LC\n");*/__UPDATEVAL AddNode("LC"); return LC;}
{RC}	{/*printf("RC\n");*/__UPDATEVAL AddNode("RC"); return RC;}
\n			{line_number++;}
\t		{}
" "		{}
<<EOF>>		{return 0;}
.		{tokenError(yytext[0]);}
%%


int yywrap(){
    return 1;
}

void tokenError(char c){
	char msg[] = "Undefined Character :$";
	msg[21]=c;
	Myyyerror("A",msg);
	exit(0);
}


void yyerror(const char *msg){
	FAIL=true;
	//printf("%s ",msg);
}