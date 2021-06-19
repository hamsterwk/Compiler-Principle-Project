/* A Bison parser, made by GNU Bison 3.4.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2019 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    T_NUM = 258,
    TYPE = 259,
    LP = 260,
    RP = 261,
    LB = 262,
    RB = 263,
    LC = 264,
    RC = 265,
    STRUCT = 266,
    RETURN = 267,
    IF = 268,
    ELSE = 269,
    WHILE = 270,
    INT = 271,
    FLOAT = 272,
    ID = 273,
    SEMI = 274,
    COMMA = 275,
    ASSIGNOP = 276,
    RELOP = 277,
    PLUS = 278,
    MINUS = 279,
    STAR = 280,
    DIV = 281,
    AND = 282,
    OR = 283,
    DOT = 284,
    NOT = 285,
    NEG = 286
  };
#endif
/* Tokens.  */
#define T_NUM 258
#define TYPE 259
#define LP 260
#define RP 261
#define LB 262
#define RB 263
#define LC 264
#define RC 265
#define STRUCT 266
#define RETURN 267
#define IF 268
#define ELSE 269
#define WHILE 270
#define INT 271
#define FLOAT 272
#define ID 273
#define SEMI 274
#define COMMA 275
#define ASSIGNOP 276
#define RELOP 277
#define PLUS 278
#define MINUS 279
#define STAR 280
#define DIV 281
#define AND 282
#define OR 283
#define DOT 284
#define NOT 285
#define NEG 286

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
