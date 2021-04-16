/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.5.1"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "./parser.y"

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



#line 111 "y.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    CONST_INT = 258,
    CONST_FLOAT = 259,
    CONST_CHAR = 260,
    ID = 261,
    INT = 262,
    FLOAT = 263,
    VOID = 264,
    CHAR = 265,
    DOUBLE = 266,
    IF = 267,
    ELSE = 268,
    FOR = 269,
    WHILE = 270,
    RETURN = 271,
    PRINTLN = 272,
    CONTINUE = 273,
    DO = 274,
    ASSIGNOP = 275,
    NOT = 276,
    INCOP = 277,
    DECOP = 278,
    LOGICOP = 279,
    RELOP = 280,
    ADDOP = 281,
    MULOP = 282,
    LPAREN = 283,
    RPAREN = 284,
    LCURL = 285,
    RCURL = 286,
    LTHIRD = 287,
    RTHIRD = 288,
    COMMA = 289,
    SEMICOLON = 290
  };
#endif
/* Tokens.  */
#define CONST_INT 258
#define CONST_FLOAT 259
#define CONST_CHAR 260
#define ID 261
#define INT 262
#define FLOAT 263
#define VOID 264
#define CHAR 265
#define DOUBLE 266
#define IF 267
#define ELSE 268
#define FOR 269
#define WHILE 270
#define RETURN 271
#define PRINTLN 272
#define CONTINUE 273
#define DO 274
#define ASSIGNOP 275
#define NOT 276
#define INCOP 277
#define DECOP 278
#define LOGICOP 279
#define RELOP 280
#define ADDOP 281
#define MULOP 282
#define LPAREN 283
#define RPAREN 284
#define LCURL 285
#define RCURL 286
#define LTHIRD 287
#define RTHIRD 288
#define COMMA 289
#define SEMICOLON 290

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 42 "./parser.y"
int ival;SymbolInfo* si;

#line 236 "y.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */



#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))

/* Stored state numbers (used for stacks). */
typedef yytype_int8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && ! defined __ICC && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                            \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  11
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   184

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  36
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  25
/* YYNRULES -- Number of rules.  */
#define YYNRULES  65
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  119

#define YYUNDEFTOK  2
#define YYMAXUTOK   290


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    57,    57,    64,    69,    76,    81,    86,    93,    97,
     103,   107,   114,   118,   122,   126,   133,   137,   143,   152,
     159,   166,   175,   182,   189,   196,   205,   213,   221,   230,
     236,   242,   248,   254,   260,   266,   272,   280,   286,   294,
     301,   311,   317,   325,   331,   339,   345,   353,   359,   368,
     374,   382,   388,   394,   402,   409,   415,   422,   429,   436,
     444,   453,   460,   467,   473,   481
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "CONST_INT", "CONST_FLOAT", "CONST_CHAR",
  "ID", "INT", "FLOAT", "VOID", "CHAR", "DOUBLE", "IF", "ELSE", "FOR",
  "WHILE", "RETURN", "PRINTLN", "CONTINUE", "DO", "ASSIGNOP", "NOT",
  "INCOP", "DECOP", "LOGICOP", "RELOP", "ADDOP", "MULOP", "LPAREN",
  "RPAREN", "LCURL", "RCURL", "LTHIRD", "RTHIRD", "COMMA", "SEMICOLON",
  "$accept", "start", "program", "unit", "func_declaration",
  "func_definition", "parameter_list", "compound_statement",
  "var_declaration", "type_specifier", "declaration_list", "statements",
  "statement", "expression_statement", "variable", "expression",
  "logic_expression", "rel_expression", "simple_expression", "term",
  "unary_expression", "factor", "argument_list", "arguments", "id", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_int16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290
};
# endif

#define YYPACT_NINF (-72)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      56,   -72,   -72,   -72,    12,    56,   -72,   -72,   -72,   -72,
      13,   -72,   -72,   -72,     4,    21,    13,   -72,    19,    18,
       0,   -20,   -11,    13,    24,    48,    68,   -72,   -72,    -6,
      56,   -72,   -72,    40,   -72,   -72,    27,    60,    62,   156,
      63,   156,   156,   156,   -72,   -72,   -72,   -72,    13,    98,
     -72,   -72,    39,    46,   -72,    69,    53,    65,   -72,   -72,
      22,   -72,   -72,    13,   -72,   156,   144,   156,    73,    13,
      64,   -72,   -72,    66,    77,   -72,   -72,   156,   -72,   -72,
     -72,   156,   156,   156,   156,   156,   156,   -72,    71,   144,
      82,   -72,    87,   -72,   -72,   -72,    91,    65,   -72,   -72,
      89,    86,    88,   128,   156,   128,    90,   -72,   156,   -72,
      84,    93,   -72,   -72,   -72,   128,   128,   -72,   -72
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,    19,    20,    21,     0,     2,     4,     6,     7,     5,
       0,     1,     3,    65,     0,    24,     0,    18,     0,     0,
      22,     0,     0,    15,     0,     0,     0,     9,    11,     0,
       0,    14,    25,     0,    57,    58,     0,     0,     0,     0,
       0,     0,     0,     0,    17,    37,    30,    28,     0,     0,
      26,    29,    54,     0,    41,    43,    45,    47,    49,    53,
      39,     8,    10,    13,    23,     0,     0,     0,     0,     0,
      54,    52,    51,     0,    24,    16,    27,     0,    59,    60,
      38,     0,     0,     0,     0,    62,     0,    12,     0,     0,
       0,    36,     0,    56,    42,    44,    46,    48,    50,    64,
       0,    61,     0,     0,     0,     0,     0,    55,     0,    40,
      32,     0,    34,    35,    63,     0,     0,    33,    31
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -72,   -72,   -72,   118,   -72,   -72,   -72,   -13,    25,    17,
     -72,   -72,   -47,   -55,   -41,   -34,   -71,    49,    45,    55,
     -38,   -72,   -72,   -72,    -3
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     4,     5,     6,     7,     8,    22,    46,    47,    48,
      14,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,   100,   101,    60
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int8 yytable[] =
{
      70,    70,    76,    71,    72,    68,    94,    15,    28,    73,
      26,    89,    11,    20,    99,    27,    62,    10,    29,    13,
      31,    24,    10,    30,    26,     9,     1,     2,     3,    61,
       9,    88,    25,    90,   104,    23,    70,   114,    16,    17,
      70,    70,    70,    70,    70,    74,    98,    63,    21,    18,
      85,    33,   102,    19,    86,    65,   110,    32,   112,    77,
      87,    78,    79,     1,     2,     3,    92,    70,   117,   118,
     111,    34,    35,    64,    13,     1,     2,     3,    82,    83,
      36,    80,    37,    38,    39,    40,    78,    79,    66,    41,
      67,    69,    84,    81,    42,    93,    43,   115,    26,    44,
     103,    34,    35,    45,    13,     1,     2,     3,    91,    19,
      36,   105,    37,    38,    39,    40,   106,    83,   107,    41,
     108,   109,   116,    12,    42,   113,    43,    96,    26,    75,
      95,    34,    35,    45,    13,     1,     2,     3,    97,     0,
      36,     0,    37,    38,    39,    40,     0,    34,    35,    41,
      13,     0,     0,     0,    42,     0,    43,     0,    26,    34,
      35,     0,    13,    45,     0,    41,     0,     0,     0,     0,
      42,     0,    43,     0,     0,     0,     0,    41,     0,    45,
       0,     0,    42,     0,    43
};

static const yytype_int8 yycheck[] =
{
      41,    42,    49,    41,    42,    39,    77,    10,    21,    43,
      30,    66,     0,    16,    85,    35,    29,     0,    29,     6,
      23,     3,     5,    34,    30,     0,     7,     8,     9,    35,
       5,    65,    32,    67,    89,    18,    77,   108,    34,    35,
      81,    82,    83,    84,    85,    48,    84,    30,    29,    28,
      28,     3,    86,    32,    32,    28,   103,    33,   105,    20,
      63,    22,    23,     7,     8,     9,    69,   108,   115,   116,
     104,     3,     4,    33,     6,     7,     8,     9,    25,    26,
      12,    35,    14,    15,    16,    17,    22,    23,    28,    21,
      28,    28,    27,    24,    26,    29,    28,    13,    30,    31,
      29,     3,     4,    35,     6,     7,     8,     9,    35,    32,
      12,    29,    14,    15,    16,    17,    29,    26,    29,    21,
      34,    33,    29,     5,    26,    35,    28,    82,    30,    31,
      81,     3,     4,    35,     6,     7,     8,     9,    83,    -1,
      12,    -1,    14,    15,    16,    17,    -1,     3,     4,    21,
       6,    -1,    -1,    -1,    26,    -1,    28,    -1,    30,     3,
       4,    -1,     6,    35,    -1,    21,    -1,    -1,    -1,    -1,
      26,    -1,    28,    -1,    -1,    -1,    -1,    21,    -1,    35,
      -1,    -1,    26,    -1,    28
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     7,     8,     9,    37,    38,    39,    40,    41,    44,
      45,     0,    39,     6,    46,    60,    34,    35,    28,    32,
      60,    29,    42,    45,     3,    32,    30,    35,    43,    29,
      34,    60,    33,     3,     3,     4,    12,    14,    15,    16,
      17,    21,    26,    28,    31,    35,    43,    44,    45,    47,
      48,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      60,    35,    43,    45,    33,    28,    28,    28,    51,    28,
      50,    56,    56,    51,    60,    31,    48,    20,    22,    23,
      35,    24,    25,    26,    27,    28,    32,    60,    51,    49,
      51,    35,    60,    29,    52,    53,    54,    55,    56,    52,
      58,    59,    51,    29,    49,    29,    29,    29,    34,    33,
      48,    51,    48,    35,    52,    13,    29,    48,    48
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_int8 yyr1[] =
{
       0,    36,    37,    38,    38,    39,    39,    39,    40,    40,
      41,    41,    42,    42,    42,    42,    43,    43,    44,    45,
      45,    45,    46,    46,    46,    46,    47,    47,    48,    48,
      48,    48,    48,    48,    48,    48,    48,    49,    49,    50,
      50,    51,    51,    52,    52,    53,    53,    54,    54,    55,
      55,    56,    56,    56,    57,    57,    57,    57,    57,    57,
      57,    58,    58,    59,    59,    60
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     1,     6,     5,
       6,     5,     4,     3,     2,     1,     3,     2,     3,     1,
       1,     1,     3,     6,     1,     4,     1,     2,     1,     1,
       1,     7,     5,     7,     5,     5,     3,     1,     2,     1,
       4,     1,     3,     1,     3,     1,     3,     1,     3,     1,
       3,     2,     2,     1,     1,     4,     3,     1,     1,     2,
       2,     1,     0,     3,     1,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YYUSE (yyoutput);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyo, yytoknum[yytype], *yyvaluep);
# endif
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyo, yytype, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[+yyssp[yyi + 1 - yynrhs]],
                       &yyvsp[(yyi + 1) - (yynrhs)]
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen(S) (YY_CAST (YYPTRDIFF_T, strlen (S)))
#  else
/* Return the length of YYSTR.  */
static YYPTRDIFF_T
yystrlen (const char *yystr)
{
  YYPTRDIFF_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYPTRDIFF_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYPTRDIFF_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            else
              goto append;

          append:
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (yyres)
    return yystpcpy (yyres, yystr) - yyres;
  else
    return yystrlen (yystr);
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYPTRDIFF_T *yymsg_alloc, char **yymsg,
                yy_state_t *yyssp, int yytoken)
{
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat: reported tokens (one for the "unexpected",
     one per "expected"). */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Actual size of YYARG. */
  int yycount = 0;
  /* Cumulated lengths of YYARG.  */
  YYPTRDIFF_T yysize = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[+*yyssp];
      YYPTRDIFF_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
      yysize = yysize0;
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYPTRDIFF_T yysize1
                    = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
                    yysize = yysize1;
                  else
                    return 2;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
    default: /* Avoid compiler warnings. */
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    /* Don't count the "%s"s in the final size, but reserve room for
       the terminator.  */
    YYPTRDIFF_T yysize1 = yysize + (yystrlen (yyformat) - 2 * yycount) + 1;
    if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
      yysize = yysize1;
    else
      return 2;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          ++yyp;
          ++yyformat;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss;
    yy_state_t *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYPTRDIFF_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYPTRDIFF_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    goto yyexhaustedlab;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
# undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2:
#line 58 "./parser.y"
        {
		print_line();
		fp2<<"start : program\n"<<endl;
	}
#line 1508 "y.tab.c"
    break;

  case 3:
#line 65 "./parser.y"
                {
			print_line();
			fp2<<"program : program unit\n"<<endl;
		}
#line 1517 "y.tab.c"
    break;

  case 4:
#line 70 "./parser.y"
                {
			print_line();
			fp2<<"program : unit\n"<<endl;
		}
#line 1526 "y.tab.c"
    break;

  case 5:
#line 77 "./parser.y"
                {
			print_line();
			fp2<<"unit : var_declaration\n"<<endl;
		}
#line 1535 "y.tab.c"
    break;

  case 6:
#line 82 "./parser.y"
        {	
			 print_line();
			fp2<<"unit : func_declaration\n"<<endl;
		}
#line 1544 "y.tab.c"
    break;

  case 7:
#line 87 "./parser.y"
        {
			 print_line();
			fp2<<"unit : func_definition\n"<<endl;
		}
#line 1553 "y.tab.c"
    break;

  case 8:
#line 94 "./parser.y"
                {
			fp2<<"func_declaration : type_specifier ID LPAREN parameter_list RPAREN SEMICOLON"<<endl;
		}
#line 1561 "y.tab.c"
    break;

  case 9:
#line 98 "./parser.y"
                {
			fp2<<"func_declaration : type_specifier ID LPAREN RPAREN SEMICOLON"<<endl;
		}
#line 1569 "y.tab.c"
    break;

  case 10:
#line 104 "./parser.y"
                {
			fp2<<"func_definition : type_specifier ID LPAREN parameter_list RPAREN compound_statement"<<endl;
		}
#line 1577 "y.tab.c"
    break;

  case 11:
#line 108 "./parser.y"
                {
			fp2<<"func_definition : type_specifier ID LPAREN RPAREN compound_statement"<<endl;
		}
#line 1585 "y.tab.c"
    break;

  case 12:
#line 115 "./parser.y"
                {
			fp2<<"parameter_list: parameter_list COMMA type_specifier id"<<endl;
		}
#line 1593 "y.tab.c"
    break;

  case 13:
#line 119 "./parser.y"
                {
			fp2<<"parameter_list: parameter_list COMMA type_specifier"<<endl;
		}
#line 1601 "y.tab.c"
    break;

  case 14:
#line 123 "./parser.y"
                {
			fp2<<"parameter_list: type_specifier id"<<endl;
		}
#line 1609 "y.tab.c"
    break;

  case 15:
#line 127 "./parser.y"
                {
			fp2<<"parameter_list: type_specifier"<<endl;
		}
#line 1617 "y.tab.c"
    break;

  case 16:
#line 134 "./parser.y"
                        {
				fp2<<"compound_statement: LCURL statements RCURL"<<endl;
			}
#line 1625 "y.tab.c"
    break;

  case 17:
#line 138 "./parser.y"
                        {
				fp2<<"compound_statement: LCURL RCURL"<<endl;
			}
#line 1633 "y.tab.c"
    break;

  case 18:
#line 144 "./parser.y"
                {
			(yyval.si) = new SymbolInfo((yyvsp[-2].si)->getName()+" "+(yyvsp[-1].si)->getName()+" "+(yyvsp[0].si)->getName(), "NON_TERMINAL");
			print_line();
			fp2<<"var_declaration: type_specifier declaration_list SEMICOLON\n"<<endl;
			fp2<<(yyvsp[-2].si)->getName()+" "+(yyvsp[-1].si)->getName()+" "+(yyvsp[0].si)->getName()<<endl<<endl;
		}
#line 1644 "y.tab.c"
    break;

  case 19:
#line 153 "./parser.y"
                        {
				(yyval.si) = new SymbolInfo("int","NON_TERMINAL");
				print_line();
				fp2<<"type_specifier: "<<"INT\n"<<endl;
				fp2<<"int\n"<<endl;
			}
#line 1655 "y.tab.c"
    break;

  case 20:
#line 160 "./parser.y"
                {
			(yyval.si) = new SymbolInfo("float","NON_TERMINAL");
			print_line();
			fp2<<"type_specifier: "<<"FLOAT\n"<<endl;
			fp2<<"float\n"<<endl;
		}
#line 1666 "y.tab.c"
    break;

  case 21:
#line 167 "./parser.y"
                {
			(yyval.si) = new SymbolInfo("void","NON_TERMINAL");
			print_line();
			fp2<<"type_specifier: "<<"VOID\n"<<endl;
			fp2<<"void\n"<<endl;
		}
#line 1677 "y.tab.c"
    break;

  case 22:
#line 176 "./parser.y"
                        {
				(yyval.si) = new SymbolInfo((yyvsp[-2].si)->getName()+" "+(yyvsp[-1].si)->getName()+" "+(yyvsp[0].si)->getName(), "NON_TERMINAL");
				print_line();
				fp2<<"declaration_list : declaration_list COMMA ID\n"<<endl;
				fp2<<(yyvsp[-2].si)->getName()+" "+(yyvsp[-1].si)->getName()+" "+(yyvsp[0].si)->getName()<<endl<<endl;
			}
#line 1688 "y.tab.c"
    break;

  case 23:
#line 183 "./parser.y"
                        {
				(yyval.si) = new SymbolInfo((yyvsp[-5].si)->getName()+" "+(yyvsp[-4].si)->getName()+" "+(yyvsp[-3].si)->getName()+" "+(yyvsp[-2].si)->getName()+" "+(yyvsp[-1].si)->getName()+" "+(yyvsp[0].si)->getName(), "NON_TERMINAL");
				print_line();
				fp2<<"declaration_list : declaration_list COMMA ID LTHIRD CONST_INT RTHIRD\n"<<endl;
				fp2<<(yyvsp[-5].si)->getName()+" "+(yyvsp[-4].si)->getName()+" "+(yyvsp[-3].si)->getName()+" "+(yyvsp[-2].si)->getName()+" "+(yyvsp[-1].si)->getName()+" "+(yyvsp[0].si)->getName()<<endl<<endl;
			}
#line 1699 "y.tab.c"
    break;

  case 24:
#line 190 "./parser.y"
                  {
 		  		(yyval.si) = new SymbolInfo((yyvsp[0].si)->getName(),"NON_TERMINAL");
 		  		print_line();
				fp2<<"declaration_list : id\n"<<endl;
				fp2<<(yyvsp[0].si)->getName()<<endl<<endl;
 		  }
#line 1710 "y.tab.c"
    break;

  case 25:
#line 197 "./parser.y"
                  {
			    (yyval.si) = new SymbolInfo((yyvsp[-3].si)->getName()+" "+(yyvsp[-2].si)->getName()+" "+(yyvsp[-1].si)->getName()+" "+(yyvsp[0].si)->getName(), "NON_TERMINAL");
 		  		print_line();
				fp2<<"declaration_list: ID LTHIRD CONST_INT RTHIRD\n"<<endl;
				fp2<<(yyvsp[-3].si)->getName()+" "+(yyvsp[-2].si)->getName()+" "+(yyvsp[-1].si)->getName()+" "+(yyvsp[0].si)->getName()<<endl<<endl;
 		  }
#line 1721 "y.tab.c"
    break;

  case 26:
#line 206 "./parser.y"
                        {
 		  	
 		  		print_line();
				fp2<<"statements : statement"<<endl;

 		  	}
#line 1732 "y.tab.c"
    break;

  case 27:
#line 214 "./parser.y"
           {
 		  	print_line();
			fp2<<"statements : statements statement"<<endl;

 		}
#line 1742 "y.tab.c"
    break;

  case 28:
#line 222 "./parser.y"
                {
			(yyval.si) = new SymbolInfo((yyvsp[0].si)->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"statement : var_declaration\n"<<endl;
			fp2<<(yyvsp[0].si)->getName()<<endl<<endl;

 		}
#line 1754 "y.tab.c"
    break;

  case 29:
#line 231 "./parser.y"
           {
 		  	print_line();
			fp2<<"statement : expression_statement"<<endl;

 		}
#line 1764 "y.tab.c"
    break;

  case 30:
#line 237 "./parser.y"
          {
 		  	print_line();
			fp2<<"statement : compound_statement"<<endl;

 		}
#line 1774 "y.tab.c"
    break;

  case 31:
#line 243 "./parser.y"
          {
 		  	print_line();
			fp2<<"FOR LPAREN expression_statement expression_statement expression RPAREN statement"<<endl;

 		}
#line 1784 "y.tab.c"
    break;

  case 32:
#line 249 "./parser.y"
           {
 		  	print_line();
			fp2<<"IF LPAREN expression RPAREN statement"<<endl;

 		}
#line 1794 "y.tab.c"
    break;

  case 33:
#line 255 "./parser.y"
          {
 		  	print_line();
			fp2<<"IF LPAREN expression RPAREN statement ELSE statement"<<endl;

 		}
#line 1804 "y.tab.c"
    break;

  case 34:
#line 261 "./parser.y"
          {
 		  	print_line();
			fp2<<"WHILE LPAREN expression RPAREN statement"<<endl;

 		}
#line 1814 "y.tab.c"
    break;

  case 35:
#line 267 "./parser.y"
           {
 		  	print_line();
			fp2<<"PRINTLN LPAREN id RPAREN SEMICOLON"<<endl;

 		}
#line 1824 "y.tab.c"
    break;

  case 36:
#line 273 "./parser.y"
          {
 		  	print_line();
			fp2<<"RETURN expression SEMICOLON"<<endl;

 		}
#line 1834 "y.tab.c"
    break;

  case 37:
#line 281 "./parser.y"
                {
 		  	print_line();
			fp2<<"expression_statement 	: SEMICOLON	"<<endl;

 		}
#line 1844 "y.tab.c"
    break;

  case 38:
#line 287 "./parser.y"
                        {
	 		  	print_line();
				fp2<<"expression SEMICOLON 	"<<endl;

 			}
#line 1854 "y.tab.c"
    break;

  case 39:
#line 295 "./parser.y"
                {
			(yyval.si) = new SymbolInfo((yyvsp[0].si)->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"variable : ID\n"<<endl;
			fp2<<(yyvsp[0].si)->getName()<<endl<<endl;
 		}
#line 1865 "y.tab.c"
    break;

  case 40:
#line 302 "./parser.y"
                {
			(yyval.si) = new SymbolInfo((yyvsp[-3].si)->getName()+" "+(yyvsp[-2].si)->getName()+" "+(yyvsp[-1].si)->getName()+" "+(yyvsp[0].si)->getName(), "NON_TERMINAL");
 		  	print_line();
			fp2<<"variable : ID LTHIRD expression RTHIRD\n"<<endl;
			fp2<<(yyvsp[-3].si)->getName()+" "+(yyvsp[-2].si)->getName()+" "+(yyvsp[-1].si)->getName()+" "+(yyvsp[0].si)->getName()<<endl<<endl;

 		}
#line 1877 "y.tab.c"
    break;

  case 41:
#line 312 "./parser.y"
                {
 		  	print_line();
			fp2<<"expression : logic_expression	"<<endl;

 		}
#line 1887 "y.tab.c"
    break;

  case 42:
#line 318 "./parser.y"
           {
 		  	print_line();
			fp2<<"expression : variable ASSIGNOP logic_expression "<<endl;

 		}
#line 1897 "y.tab.c"
    break;

  case 43:
#line 326 "./parser.y"
                {
 		  	print_line();
			fp2<<"logic_expression : rel_expression "<<endl;

 		}
#line 1907 "y.tab.c"
    break;

  case 44:
#line 332 "./parser.y"
                 {
 		  	print_line();
			fp2<<"logic_expression : rel_expression LOGICOP rel_expression "<<endl;

 		}
#line 1917 "y.tab.c"
    break;

  case 45:
#line 340 "./parser.y"
                {
 		  	print_line();
			fp2<<"rel_expression	: simple_expression "<<endl;

 		}
#line 1927 "y.tab.c"
    break;

  case 46:
#line 346 "./parser.y"
                {
 		  	print_line();
			fp2<<"rel_expression	: simple_expression RELOP simple_expression	"<<endl;

 		}
#line 1937 "y.tab.c"
    break;

  case 47:
#line 354 "./parser.y"
                {
 		  	print_line();
			fp2<<"simple_expression : term "<<endl;

 		}
#line 1947 "y.tab.c"
    break;

  case 48:
#line 360 "./parser.y"
                  {
 		  	print_line();
			fp2<<"simple_expression ADDOP term "<<endl;

 		}
#line 1957 "y.tab.c"
    break;

  case 49:
#line 369 "./parser.y"
                {
 		  	print_line();
			fp2<<"term :	unary_expression"<<endl;

 		}
#line 1967 "y.tab.c"
    break;

  case 50:
#line 375 "./parser.y"
     {
 		  	print_line();
			fp2<<"term :term MULOP unary_expression"<<endl;

 		}
#line 1977 "y.tab.c"
    break;

  case 51:
#line 383 "./parser.y"
                {
 		  	print_line();
			fp2<<"unary_expression : ADDOP unary_expression"<<endl;

 		}
#line 1987 "y.tab.c"
    break;

  case 52:
#line 389 "./parser.y"
                 {
 		  	print_line();
			fp2<<"unary_expression : NOT unary_expression"<<endl;

 		}
#line 1997 "y.tab.c"
    break;

  case 53:
#line 395 "./parser.y"
                 {
 		  	print_line();
			fp2<<"unary_expression : factor "<<endl;

 		}
#line 2007 "y.tab.c"
    break;

  case 54:
#line 403 "./parser.y"
                {
			(yyval.si) = new SymbolInfo((yyvsp[0].si)->getName(),"NON_TERMINAL");
 		  	print_line();
			fp2<<"factor: variable\n"<<endl;
			fp2<<(yyvsp[0].si)->getName()<<endl<<endl;
 		}
#line 2018 "y.tab.c"
    break;

  case 55:
#line 410 "./parser.y"
        {
		//$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName()+" "+$4->getName(), "NON_TERMINAL");
 	  	print_line();
		fp2<<"factor: id LPAREN argument_list RPAREN\n"<<endl;
 	}
#line 2028 "y.tab.c"
    break;

  case 56:
#line 416 "./parser.y"
        {
		//$$ = new SymbolInfo($1->getName()+" "+$2->getName()+" "+$3->getName(), "NON_TERMINAL");
 		print_line();
		fp2<<"factor: LPAREN expression RPAREN\n"<<endl;

	}
#line 2039 "y.tab.c"
    break;

  case 57:
#line 423 "./parser.y"
        {
		(yyval.si) = new SymbolInfo((yyvsp[0].si)->getName(),"NON_TERMINAL");
 		print_line();
		fp2<<"factor: CONST_INT\n"<<endl;
		fp2<<(yyvsp[0].si)->getName()<<endl<<endl;
	}
#line 2050 "y.tab.c"
    break;

  case 58:
#line 430 "./parser.y"
        {
		(yyval.si) = new SymbolInfo((yyvsp[0].si)->getName(),"NON_TERMINAL");
	  	print_line();
		fp2<<"factor: CONST_FLOAT\n"<<endl;
		fp2<<(yyvsp[0].si)->getName()<<endl<<endl;
 	}
#line 2061 "y.tab.c"
    break;

  case 59:
#line 437 "./parser.y"
        {

		(yyval.si) = new SymbolInfo((yyvsp[-1].si)->getName()+" "+(yyvsp[0].si)->getName(),"NON_TERMINAL");
 	  	print_line();
		fp2<<"factor: variable INCOP\n"<<endl;
		fp2<<(yyvsp[-1].si)->getName()+" "+(yyvsp[0].si)->getName()<<endl<<endl;
 	}
#line 2073 "y.tab.c"
    break;

  case 60:
#line 445 "./parser.y"
        {
		(yyval.si) = new SymbolInfo((yyvsp[-1].si)->getName()+" "+(yyvsp[0].si)->getName(),"NON_TERMINAL");
 	  	print_line();
		fp2<<"factor: variable INCOP\n"<<endl;
		fp2<<(yyvsp[-1].si)->getName()+" "+(yyvsp[0].si)->getName()<<endl<<endl;
 	}
#line 2084 "y.tab.c"
    break;

  case 61:
#line 454 "./parser.y"
                {
 		  	print_line();
			fp2<<"argument_list : arguments"<<endl;

 		}
#line 2094 "y.tab.c"
    break;

  case 62:
#line 460 "./parser.y"
                          {
 		  	print_line();
			fp2<<"argument_list : "<<endl;

 		}
#line 2104 "y.tab.c"
    break;

  case 63:
#line 468 "./parser.y"
                        {
				print_line();
				fp2<<"arguments : arguments COMMA logic_expression"<<endl;

 			}
#line 2114 "y.tab.c"
    break;

  case 64:
#line 474 "./parser.y"
                {
				print_line();
				fp2<<"arguments : logic_expression"<<endl;

 			}
#line 2124 "y.tab.c"
    break;

  case 65:
#line 482 "./parser.y"
        {
		SymbolInfo* si = st.Look_up((yyvsp[0].si)->getName());
		
		if(si == NULL)
		{
			st.Insert((yyvsp[0].si)->getName(),(yyvsp[0].si)->getType());
		}
		
		(yyval.si) = new SymbolInfo((yyvsp[0].si)->getName(),(yyvsp[0].si)->getType());
		
		//print_line();
		//fp2<<"id: ID"<<endl;
	}
#line 2142 "y.tab.c"
    break;


#line 2146 "y.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = YY_CAST (char *, YYSTACK_ALLOC (YY_CAST (YYSIZE_T, yymsg_alloc)));
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;


#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif


/*-----------------------------------------------------.
| yyreturn -- parsing is finished, return the result.  |
`-----------------------------------------------------*/
yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[+*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 501 "./parser.y"

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

