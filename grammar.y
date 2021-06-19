
%{
#include <stdio.h>
#include "lex.yy.c"
void yyerror(const char*);

%}

%token T_NUM

%token TYPE LP RP LB RB LC RC STRUCT RETURN IF ELSE WHILE INT FLOAT ID SEMI COMMA ASSIGNOP RELOP PLUS MINUS STAR DIV AND OR DOT NOT

%right ASSIGNOP
%left OR
%left AND
%left RELOP
%left PLUS MINUS
%left STAR DIV
%right NOT NEG
%left LP RP LB RB LC RC DOT
%%
Program: ExtDefList {AddNode2("Program"); Insert1(node_number, $1);$$ = node_number++;}
;
ExtDefList: ExtDef ExtDefList {Insert1($2,$1);$$=$2;}
| {AddNode2("ExtDefList");$$ = node_number++;}
;
ExtDef: Specifier ExtDecList SEMI {AddNode2("ExtDef"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
| Specifier ExtDecList error {NO_SEMI_ERROR}
| Specifier SEMI {AddNode2("ExtDef"); Insert2(node_number, $1, $2);$$ = node_number++;}
| Specifier FunDec CompSt {AddNode2("ExtDef"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
;
ExtDecList: VarDec {AddNode2("ExtDecList"); Insert1(node_number, $1);$$ = node_number++;}
| VarDec COMMA ExtDecList {AddNode2("ExtDecList"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
;
Specifier: TYPE {AddNode2("Specifier"); Insert1(node_number, $1);$$ = node_number++;}
| StructSpecifier {AddNode2("Specifier"); Insert1(node_number, $1);$$ = node_number++;}
;
StructSpecifier: STRUCT OptTag LC DefList RC {AddNode2("StructSpecifier"); Insert5(node_number, $1, $2, $3, $4, $5);$$ = node_number++;}
| STRUCT Tag {AddNode2("StructSpecifier"); Insert2(node_number, $1, $2);$$ = node_number++;}
;
OptTag: ID {AddNode2("OptTag"); Insert1(node_number, $1);$$ = node_number++;}
|
;
Tag: ID {AddNode2("Tag"); Insert1(node_number, $1);$$ = node_number++;}
;
VarDec: ID {AddNode2("VarDec"); Insert1(node_number, $1);$$ = node_number++;}
| VarDec LB INT RB {AddNode2("VarDec"); Insert4(node_number, $1, $2, $3, $4);$$ = node_number++;}
| VarDec LB INT error {MISSING_RB}
;
FunDec: ID LP VarList RP {AddNode2("FunDec"); Insert4(node_number, $1, $2, $3, $4);$$ = node_number++;}
| ID LP RP {AddNode2("FunDec"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
| ID LP VarList error{MISSING_RP}
;
VarList: ParamDec COMMA VarList {AddNode2("VarList"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
| ParamDec {AddNode2("VarList"); Insert1(node_number, $1);$$ = node_number++;}
;
ParamDec: Specifier VarDec {AddNode2("ParamDec"); Insert2(node_number, $1, $2);$$ = node_number++;}
;
CompSt: LC DefList StmtList RC {AddNode2("CompSt"); Insert4(node_number, $1, $2, $3, $4);$$ = node_number++;}
;
StmtList: Stmt StmtList {Insert1($2, $1);$$ = $2;}
| {AddNode2("StmtList");$$ = node_number++;}
;
Stmt: Exp SEMI {AddNode2("Stmt"); Insert2(node_number, $1, $2);$$ = node_number++;}
| Exp error {NO_SEMI_ERROR}
| CompSt {AddNode2("Stmt"); Insert1(node_number, $1);$$ = node_number++;}
| RETURN Exp SEMI {AddNode2("Stmt"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
| RETURN Exp error {NO_SEMI_ERROR}
| IF LP Exp RP Stmt {AddNode2("Stmt"); Insert5(node_number, $1, $2, $3, $4, $5);$$ = node_number++;}
| IF LP Exp RP Stmt ELSE Stmt {AddNode2("Stmt"); Insert7(node_number, $1, $2, $3, $4, $5, $6, $7);$$ = node_number++;}
| WHILE LP Exp RP Stmt {AddNode2("Stmt"); Insert5(node_number, $1, $2, $3, $4, $5);$$ = node_number++;}
;
DefList: Def DefList {Insert1($2, $1);$$ = $2;}
| {AddNode2("DefList");$$ = node_number++;}
;
Def: Specifier DecList SEMI {AddNode2("Def"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
| Specifier DecList error {NO_SEMI_ERROR}
;
DecList: Dec {AddNode2("DecList"); Insert1(node_number, $1);$$ = node_number++;}
| Dec COMMA DecList {AddNode2("DecList"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
;
Dec: VarDec {AddNode2("Dec"); Insert1(node_number, $1);$$ = node_number++;}
| VarDec ASSIGNOP Exp {AddNode2("Dec"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
;
Exp: Exp ASSIGNOP Exp {AddNode2("Exp"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
| Exp AND Exp {AddNode2("Exp"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
| Exp OR Exp {AddNode2("Exp"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
| Exp RELOP Exp {AddNode2("Exp"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
| Exp PLUS Exp {AddNode2("Exp"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
| Exp MINUS Exp {AddNode2("Exp"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
| Exp STAR Exp {AddNode2("Exp"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
| Exp DIV Exp {AddNode2("Exp"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
| LP Exp RP {AddNode2("Exp"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
| MINUS Exp %prec NEG {AddNode2("Exp"); Insert2(node_number, $1, $2);$$ = node_number++;}
| NOT Exp {AddNode2("Exp"); Insert2(node_number, $1, $2);$$ = node_number++;}
| ID LP Args RP {AddNode2("Exp"); Insert4(node_number, $1, $2, $3, $4);$$ = node_number++;}
| ID LP RP {AddNode2("Exp"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
| Exp LB Exp RB {AddNode2("Exp"); Insert4(node_number, $1, $2, $3, $4);$$ = node_number++;}
| Exp LB Exp error {MISSING_RB}
| Exp DOT ID {AddNode2("Exp"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
| ID {AddNode2("Exp"); Insert1(node_number, $1);$$ = node_number++;}
| INT {AddNode2("Exp"); Insert1(node_number, $1);$$ = node_number++;}
| FLOAT {AddNode2("Exp"); Insert1(node_number, $1);$$ = node_number++;}
;
Args: Exp COMMA Args {AddNode2("Args"); Insert3(node_number, $1, $2, $3);$$ = node_number++;}
| Exp {AddNode2("Args"); Insert1(node_number, $1);$$ = node_number++;}
;

%%


int main() {
    yyparse();
    if(FAIL)return 0;
    //printf("Successfully Build!\n");
    outputTree();
    return 0;
}