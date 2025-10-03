(* FUNCTIONAL HEAP / PRIORITY QUEUE *)
(* Leftist Heap implementation *)

module Heap = struct
  type 'a heap =
    | Empty
    | Node of int * 'a * 'a heap * 'a heap

    (* Node (rank, value, left, right) 
       - rank = length of shortest path to an Empty
       - heap property: parent <= children
       - leftist property: rank(left) >= rank(right) *)

  (* return the rank of a heap *)
  let rank (h : 'a heap) : int =
    match h with
    | Empty -> 0
    | Node (r, _, _, _) -> r

  (* make a new node ensuring the leftist property *)
  let make_node (x : 'a) (a : 'a heap) (b : 'a heap) : 'a heap =
    if rank a >= rank b then
      Node (rank b + 1, x, a, b)
    else
      Node (rank a + 1, x, b, a)

  (* merge two heaps *)
  let rec merge (h1 : 'a heap) (h2 : 'a heap) : 'a heap =
    match (h1, h2) with
    | Empty, h | h, Empty -> h
    | Node (_, x, l1, r1), Node (_, y, l2, r2) ->
        if x <= y then
          make_node x l1 (merge r1 h2)
        else
          make_node y l2 (merge h1 r2)

  (* empty heap *)
  let empty : 'a heap = Empty

  (* insert a value by merging singleton heap *)
  let insert (x : 'a) (h : 'a heap) : 'a heap =
    merge (Node (1, x, Empty, Empty)) h

  (* find the minimum element if it exists *)
  let find_min (h : 'a heap) : 'a option =
    match h with
    | Empty -> None
    | Node (_, v, _, _) -> Some v

  (* remove the minimum element and return the new heap *)
  let delete_min (h : 'a heap) : 'a heap =
    match h with
    | Empty -> Empty
    | Node (_, _, l, r) -> merge l r

end
