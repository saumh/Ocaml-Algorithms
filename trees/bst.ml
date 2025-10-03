(* BINARY SEARCH TREE *)

module BST = struct
  type 'a bst =
    | Empty
    | Node of 'a bst * 'a * 'a bst

  let rec insert (x : 'a) (t : 'a bst) : 'a bst =
    match t with
    | Empty -> Node (Empty, x, Empty)
    | Node (l, v, r) ->
        if x < v then Node (insert x l, v, r)
        else if x > v then Node (l, v, insert x r)
        else t  (* no duplicates *)

  let rec search (x : 'a) (t : 'a bst) : bool =
    match t with
    | Empty -> false
    | Node (l, v, r) ->
        if x = v then true
        else if x < v then search x l
        else search x r

  let rec find_min (t : 'a bst) : 'a option =
    match t with
    | Empty -> None
    | Node (Empty, v, _) -> Some v
    | Node (l, _, _) -> find_min l

  let rec delete (x : 'a) (t : 'a bst) : 'a bst =
    match t with
    | Empty -> Empty
    | Node (l, v, r) ->
        if x < v then Node (delete x l, v, r)
        else if x > v then Node (l, v, delete x r)
        else
          (* x = v, remove this node *)
          match l, r with
          | Empty, _ -> r
          | _, Empty -> l
          | _ ->
              match find_min r with
              | None -> l  (* shouldn't happen *)
              | Some min_val -> Node (l, min_val, delete min_val r)
end
