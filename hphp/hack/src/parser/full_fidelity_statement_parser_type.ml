(**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *
 *)

module WithLexer(Lexer : Full_fidelity_lexer_sig.MinimalLexer_S) = struct
  module type StatementParser_S = sig
    type t
    val make : ?hhvm_compat_mode:bool
      -> Lexer.t
      -> Full_fidelity_syntax_error.t list
      -> Full_fidelity_parser_context.WithToken(Full_fidelity_minimal_token).t
      -> t
    val lexer : t -> Lexer.t
    val errors : t -> Full_fidelity_syntax_error.t list
    val parse_compound_statement : t -> t * Full_fidelity_minimal_syntax.t
    val parse_statement : t -> t * Full_fidelity_minimal_syntax.t
    val parse_markup_section: t ->
      is_leading_section:bool ->
      t * Full_fidelity_minimal_syntax.t
    val parse_possible_php_function: t -> t * Full_fidelity_minimal_syntax.t
  end
end
