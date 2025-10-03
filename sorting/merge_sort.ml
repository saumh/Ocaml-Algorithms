(* MERGE SORT *)

let rec merge (l1 : 'a list) (l2 : 'a list) : 'a list =
  match (l1, l2) with
  | [], ys -> ys
  | xs, [] -> xs
  | x :: xs, y :: ys ->
      if x <= y then x :: merge xs (y :: ys)
      else y :: merge (x :: xs) ys

(* Tail-recursive merge of two sorted lists *)
let merge_tail (l1 : 'a list) (l2 : 'a list) : 'a list =
  let rec aux acc l1 l2 =
    match (l1, l2) with
    | [], ys -> List.rev_append acc ys
    | xs, [] -> List.rev_append acc xs
    | x :: xs, y :: ys ->
        if x <= y then aux (x :: acc) xs (y :: ys)
        else aux (y :: acc) (x :: xs) ys
  in
  aux [] l1 l2

(* Custom split function: split a list into two halves *)
let split (lst : 'a list) : 'a list * 'a list =
  let rec aux left right n xs =
    match xs with
    | [] -> (List.rev left, List.rev right)
    | x :: xs ->
        if n > 0 then aux (x :: left) right (n - 1) xs
        else aux left (x :: right) n xs
  in
  let len = List.length lst in
  aux [] [] (len / 2) lst

(* Merge sort *)
let rec merge_sort (lst : 'a list) : 'a list =
  match lst with
  | [] -> []
  | [x] -> [x]
  | _ ->
      let left, right = split lst in
      merge (merge_sort left) (merge_sort right)