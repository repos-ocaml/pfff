
(* can raise Not_found or Multi_found *)
val lookup_method: 
  Entity_php.method_identifier ->
  Entity_php.entity_finder ->
  Ast_php.method_def

val get_public_or_protected_vars_of_class:
  Ast_php.class_def -> Ast_php.dname list

val class_variables_reorder_first:
  Ast_php.class_def -> Ast_php.class_def

val is_static_method:
  Ast_php.method_def -> bool

(* __construct *)
val constructor_name: string 
val get_constructor: Ast_php.class_def -> Ast_php.method_def

