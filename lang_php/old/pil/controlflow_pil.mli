
open Pil

type node = {
  (* For now we just have node_kind, but later if we want to do some data-flow
   * analysis or use temporal logic, we may want to add extra information
   * in each CFG nodes. We could also record such extra
   * information in an external table that maps Ograph_extended.nodei,
   * that is nodeid, to some information.
   *)
  n: node_kind;
}
 and node_kind =

  (* special fake cfg nodes *)
  | Enter | Exit

  (* An alternative is to store such information in the edges, but
   * experience shows it's easier to encode it via regular nodes
   *)
  | TrueNode | FalseNode

  | IfHeader of expr | WhileHeader of expr

  | Return of expr option

  | Jump

  | TryHeader
  | Throw

  | Echo of expr list
  | Instr of instr

  | TodoNode of Parse_info.info option

  | Join

(* For now there is just one kind of edge. Later we may have more,
 * see the ShadowNode idea of Julia Lawall.
 *)
type edge = Direct

type flow = (node, edge) Ograph_extended.ograph_mutable
type nodei = Ograph_extended.nodei

(* for the visitor *)
type any =
  | Lvalue of Pil.lvalue
  | Expr of Pil.expr
  | Instr2 of Pil.instr
  | Stmt of Pil.stmt
  | Node of node

  | StmtList of stmt list

  | Toplevel of Pil.toplevel
  | Program of Pil.program


val first_node : flow -> Ograph_extended.nodei
val mk_node: node_kind -> node

val short_string_of_node : node -> string
(* using internally graphviz dot and ghostview on X11 *)
val display_flow: flow -> unit
