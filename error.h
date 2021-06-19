#define NO_SEMI_ERROR Myyyerror("B","expect ';' at the end.");yyclearin;line_number++;
#define MISSING_LB Myyyerror("B","Missing ''.");yyclearin;line_number++;
#define MISSING_RB Myyyerror("B","Missing ']'.");yyclearin;line_number++;
#define MISSING_RP Myyyerror("B","Missing '('.");yyclearin;line_number++;
#define MISSING_LP Myyyerror("B","Missing ')'.");yyclearin;line_number++;
#define MISSING_RC Myyyerror("B","Missing '{'.");yyclearin;line_number++;
#define MISSING_LC Myyyerror("B","Missing '}'.");yyclearin;line_number++;
#define SYNTAX_ERROR Myyyerror("B","syntax error.");yyclearin;line_number++;