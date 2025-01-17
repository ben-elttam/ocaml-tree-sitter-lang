(* Generated by ocaml-tree-sitter. *)
(*
   lua grammar

   entrypoint: program
*)

open! Sexplib.Conv
open Tree_sitter_run

type string_ = Token.t
[@@deriving sexp_of]

type field_sep = [ `COMMA of Token.t (* "," *) | `SEMI of Token.t (* ";" *) ]
[@@deriving sexp_of]

type identifier = Token.t (* pattern [a-zA-Z_][a-zA-Z0-9_]* *)
[@@deriving sexp_of]

type number = Token.t
[@@deriving sexp_of]

type parameters = (
    Token.t (* "(" *)
  * (
        [
            `Self of Token.t (* "self" *)
          | `Spread of Token.t (* "..." *)
          | `Id of identifier (*tok*)
        ]
      * (Token.t (* "," *) * identifier (*tok*)) list (* zero or more *)
      * (Token.t (* "," *) * Token.t (* "..." *)) option
    )
      option
  * Token.t (* ")" *)
)
[@@deriving sexp_of]

type local_variable_declarator = (
    identifier (*tok*)
  * (Token.t (* "," *) * identifier (*tok*)) list (* zero or more *)
)
[@@deriving sexp_of]

type function_name_field = (
    identifier (*tok*)
  * (Token.t (* "." *) * identifier (*tok*)) list (* zero or more *)
)
[@@deriving sexp_of]

type function_name = (
    [ `Id of identifier (*tok*) | `Func_name_field of function_name_field ]
  * (Token.t (* ":" *) * identifier (*tok*)) option
)
[@@deriving sexp_of]

type anon_exp_rep_COMMA_exp_0bb260c = (
    expression
  * (Token.t (* "," *) * expression) list (* zero or more *)
)

and arguments = [
    `LPAR_opt_exp_rep_COMMA_exp_RPAR of (
        Token.t (* "(" *)
      * anon_exp_rep_COMMA_exp_0bb260c option
      * Token.t (* ")" *)
    )
  | `Table of table
  | `Str of string_ (*tok*)
]

and binary_operation = [
    `Exp_or_exp of (expression * Token.t (* "or" *) * expression)
  | `Exp_and_exp of (expression * Token.t (* "and" *) * expression)
  | `Exp_LT_exp of (expression * Token.t (* "<" *) * expression)
  | `Exp_LTEQ_exp of (expression * Token.t (* "<=" *) * expression)
  | `Exp_EQEQ_exp of (expression * Token.t (* "==" *) * expression)
  | `Exp_TILDEEQ_exp of (expression * Token.t (* "~=" *) * expression)
  | `Exp_GTEQ_exp of (expression * Token.t (* ">=" *) * expression)
  | `Exp_GT_exp of (expression * Token.t (* ">" *) * expression)
  | `Exp_BAR_exp of (expression * Token.t (* "|" *) * expression)
  | `Exp_TILDE_exp of (expression * Token.t (* "~" *) * expression)
  | `Exp_AMP_exp of (expression * Token.t (* "&" *) * expression)
  | `Exp_LTLT_exp of (expression * Token.t (* "<<" *) * expression)
  | `Exp_GTGT_exp of (expression * Token.t (* ">>" *) * expression)
  | `Exp_PLUS_exp of (expression * Token.t (* "+" *) * expression)
  | `Exp_DASH_exp of (expression * Token.t (* "-" *) * expression)
  | `Exp_STAR_exp of (expression * Token.t (* "*" *) * expression)
  | `Exp_SLASH_exp of (expression * Token.t (* "/" *) * expression)
  | `Exp_SLASHSLASH_exp of (expression * Token.t (* "//" *) * expression)
  | `Exp_PERC_exp of (expression * Token.t (* "%" *) * expression)
  | `Exp_DOTDOT_exp of (expression * Token.t (* ".." *) * expression)
  | `Exp_HAT_exp of (expression * Token.t (* "^" *) * expression)
]

and else_ = (
    Token.t (* "else" *)
  * statement list (* zero or more *)
  * return_statement option
)

and elseif = (
    Token.t (* "elseif" *)
  * expression
  * Token.t (* "then" *)
  * statement list (* zero or more *)
  * return_statement option
)

and expression = [
    `Spread of Token.t (* "..." *)
  | `Prefix of prefix
  | `Func_defi of (Token.t (* "function" *) * function_body)
  | `Table of table
  | `Bin_oper of binary_operation
  | `Un_oper of (
        [
            `Not of Token.t (* "not" *)
          | `HASH of Token.t (* "#" *)
          | `DASH of Token.t (* "-" *)
          | `TILDE of Token.t (* "~" *)
        ]
      * expression
    )
  | `Str of string_ (*tok*)
  | `Num of number (*tok*)
  | `Nil of Token.t (* "nil" *)
  | `True of Token.t (* "true" *)
  | `False of Token.t (* "false" *)
  | `Id of identifier (*tok*)
]

and field = [
    `LBRACK_exp_RBRACK_EQ_exp of (
        Token.t (* "[" *) * expression * Token.t (* "]" *)
      * Token.t (* "=" *) * expression
    )
  | `Id_EQ_exp of (identifier (*tok*) * Token.t (* "=" *) * expression)
  | `Exp of expression
]

and field_sequence = (
    field
  * (field_sep * field) list (* zero or more *)
  * field_sep option
)

and function_body = (
    parameters
  * statement list (* zero or more *)
  * return_statement option
  * Token.t (* "end" *)
)

and function_call_statement = [
    `Prefix_args of (prefix * arguments)
  | `Prefix_COLON_id_args of (
        prefix * Token.t (* ":" *) * identifier (*tok*) * arguments
    )
]

and in_loop_expression = (
    identifier (*tok*)
  * (Token.t (* "," *) * identifier (*tok*)) list (* zero or more *)
  * Token.t (* "in" *)
  * expression
  * (Token.t (* "," *) * expression) list (* zero or more *)
)

and loop_expression = (
    identifier (*tok*)
  * Token.t (* "=" *)
  * expression
  * Token.t (* "," *)
  * expression
  * (Token.t (* "," *) * expression) option
)

and prefix = [
    `Var_decl of variable_declarator
  | `Func_call_stmt of function_call_statement
  | `LPAR_exp_RPAR of (Token.t (* "(" *) * expression * Token.t (* ")" *))
]

and return_statement = (
    Token.t (* "return" *)
  * anon_exp_rep_COMMA_exp_0bb260c option
  * Token.t (* ";" *) option
)

and statement = [
    `Exp of expression
  | `Var_decl of (
        variable_declarator
      * (Token.t (* "," *) * variable_declarator) list (* zero or more *)
      * Token.t (* "=" *)
      * expression
      * (Token.t (* "," *) * expression) list (* zero or more *)
    )
  | `Local_var_decl of (
        Token.t (* "local" *)
      * local_variable_declarator
      * (
            Token.t (* "=" *)
          * expression
          * (Token.t (* "," *) * expression) list (* zero or more *)
        )
          option
    )
  | `Do_stmt of (
        Token.t (* "do" *)
      * statement list (* zero or more *)
      * return_statement option
      * Token.t (* "end" *)
    )
  | `If_stmt of (
        Token.t (* "if" *)
      * expression
      * Token.t (* "then" *)
      * statement list (* zero or more *)
      * return_statement option
      * elseif list (* zero or more *)
      * else_ option
      * Token.t (* "end" *)
    )
  | `While_stmt of (
        Token.t (* "while" *)
      * expression
      * Token.t (* "do" *)
      * statement list (* zero or more *)
      * return_statement option
      * Token.t (* "end" *)
    )
  | `Repeat_stmt of (
        Token.t (* "repeat" *)
      * statement list (* zero or more *)
      * return_statement option
      * Token.t (* "until" *)
      * expression
    )
  | `For_stmt of (
        Token.t (* "for" *)
      * loop_expression
      * Token.t (* "do" *)
      * statement list (* zero or more *)
      * return_statement option
      * Token.t (* "end" *)
    )
  | `For_in_stmt of (
        Token.t (* "for" *)
      * in_loop_expression
      * Token.t (* "do" *)
      * statement list (* zero or more *)
      * return_statement option
      * Token.t (* "end" *)
    )
  | `Goto_stmt of (Token.t (* "goto" *) * identifier (*tok*))
  | `Brk_stmt of Token.t (* "break" *)
  | `Label_stmt of (
        Token.t (* "::" *) * identifier (*tok*) * Token.t (* "::" *)
    )
  | `Empty_stmt of Token.t (* ";" *)
  | `Func_stmt of (Token.t (* "function" *) * function_name * function_body)
  | `Local_func_stmt of (
        Token.t (* "local" *) * Token.t (* "function" *) * identifier (*tok*)
      * function_body
    )
  | `Func_call_stmt of function_call_statement
]

and table = (Token.t (* "{" *) * field_sequence option * Token.t (* "}" *))

and variable_declarator = [
    `Id of identifier (*tok*)
  | `Self of Token.t (* "self" *)
  | `Prefix_LBRACK_exp_RBRACK of (
        prefix * Token.t (* "[" *) * expression * Token.t (* "]" *)
    )
  | `Field_exp of (prefix * Token.t (* "." *) * identifier (*tok*))
]
[@@deriving sexp_of]

type program = (statement list (* zero or more *) * return_statement option)
[@@deriving sexp_of]

type true_ (* inlined *) = Token.t (* "true" *)
[@@deriving sexp_of]

type spread (* inlined *) = Token.t (* "..." *)
[@@deriving sexp_of]

type break_statement (* inlined *) = Token.t (* "break" *)
[@@deriving sexp_of]

type false_ (* inlined *) = Token.t (* "false" *)
[@@deriving sexp_of]

type empty_statement (* inlined *) = Token.t (* ";" *)
[@@deriving sexp_of]

type self (* inlined *) = Token.t (* "self" *)
[@@deriving sexp_of]

type nil (* inlined *) = Token.t (* "nil" *)
[@@deriving sexp_of]

type comment (* inlined *) = Token.t
[@@deriving sexp_of]

type label_statement (* inlined *) = (
    Token.t (* "::" *) * identifier (*tok*) * Token.t (* "::" *)
)
[@@deriving sexp_of]

type goto_statement (* inlined *) = (
    Token.t (* "goto" *) * identifier (*tok*)
)
[@@deriving sexp_of]

type do_statement (* inlined *) = (
    Token.t (* "do" *)
  * statement list (* zero or more *)
  * return_statement option
  * Token.t (* "end" *)
)
[@@deriving sexp_of]

type field_expression (* inlined *) = (
    prefix * Token.t (* "." *) * identifier (*tok*)
)
[@@deriving sexp_of]

type for_in_statement (* inlined *) = (
    Token.t (* "for" *)
  * in_loop_expression
  * Token.t (* "do" *)
  * statement list (* zero or more *)
  * return_statement option
  * Token.t (* "end" *)
)
[@@deriving sexp_of]

type for_statement (* inlined *) = (
    Token.t (* "for" *)
  * loop_expression
  * Token.t (* "do" *)
  * statement list (* zero or more *)
  * return_statement option
  * Token.t (* "end" *)
)
[@@deriving sexp_of]

type function_definition (* inlined *) = (
    Token.t (* "function" *) * function_body
)
[@@deriving sexp_of]

type function_statement (* inlined *) = (
    Token.t (* "function" *) * function_name * function_body
)
[@@deriving sexp_of]

type if_statement (* inlined *) = (
    Token.t (* "if" *)
  * expression
  * Token.t (* "then" *)
  * statement list (* zero or more *)
  * return_statement option
  * elseif list (* zero or more *)
  * else_ option
  * Token.t (* "end" *)
)
[@@deriving sexp_of]

type local_function_statement (* inlined *) = (
    Token.t (* "local" *) * Token.t (* "function" *) * identifier (*tok*)
  * function_body
)
[@@deriving sexp_of]

type local_variable_declaration (* inlined *) = (
    Token.t (* "local" *)
  * local_variable_declarator
  * (
        Token.t (* "=" *)
      * expression
      * (Token.t (* "," *) * expression) list (* zero or more *)
    )
      option
)
[@@deriving sexp_of]

type repeat_statement (* inlined *) = (
    Token.t (* "repeat" *)
  * statement list (* zero or more *)
  * return_statement option
  * Token.t (* "until" *)
  * expression
)
[@@deriving sexp_of]

type unary_operation (* inlined *) = (
    [
        `Not of Token.t (* "not" *)
      | `HASH of Token.t (* "#" *)
      | `DASH of Token.t (* "-" *)
      | `TILDE of Token.t (* "~" *)
    ]
  * expression
)
[@@deriving sexp_of]

type variable_declaration (* inlined *) = (
    variable_declarator
  * (Token.t (* "," *) * variable_declarator) list (* zero or more *)
  * Token.t (* "=" *)
  * expression
  * (Token.t (* "," *) * expression) list (* zero or more *)
)
[@@deriving sexp_of]

type while_statement (* inlined *) = (
    Token.t (* "while" *)
  * expression
  * Token.t (* "do" *)
  * statement list (* zero or more *)
  * return_statement option
  * Token.t (* "end" *)
)
[@@deriving sexp_of]

let dump_tree root =
  sexp_of_program root
  |> Print_sexp.to_stdout
