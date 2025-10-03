(* RED BLACK TREE *)

type color = Red | Black

type 'a rb_tree =
  | Empty
  | Node of color * 'a rb_tree * 'a * 'a rb_tree

let empty : 'a rb_tree = Empty

(* Balance a red-black tree after insertion *)
let balance = function
  | Black, Node (Red, Node (Red, a, x, b), y, c), z, d
  | Black, Node (Red, a, x, Node (Red, b, y, c)), z, d
  | Black, a, x, Node (Red, Node (Red, b, y, c), z, d)
  | Black, a, x, Node (Red, b, y, Node (Red, c, z, d)) ->
      Node (Red, Node (Black, a, x, b), y, Node (Black, c, z, d))
  | c, l, v, r -> Node (c, l, v, r)

let rec insert_aux (x : 'a) (t : 'a rb_tree) : 'a rb_tree =
  match t with
  | Empty -> Node (Red, Empty, x, Empty)
  | Node (c, l, v, r) ->
      if x < v then balance (c, insert_aux x l, v, r)
      else if x > v then balance (c, l, v, insert_aux x r)
      else t  (* no duplicates *)

let insert (x : 'a) (t : 'a rb_tree) : 'a rb_tree =
  match insert_aux x t with
  | Node (_, l, v, r) -> Node (Black, l, v, r)  (* root is always black *)
  | Empty -> Empty  (* shouldn't happen *)

let rec search (x : 'a) (t : 'a rb_tree) : bool =
  match t with
  | Empty -> false
  | Node (_, l, v, r) ->
      if x = v then true
      else if x < v then search x l
      else search x r
