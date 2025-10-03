(* QUICK SORT *)

(* Simple recursive quicksort *)
let rec quick_sort (lst : 'a list) : 'a list =
  match lst with
  | [] -> []
  | [x] -> [x]
  | pivot :: rest ->
      let smaller, greater =
        List.partition (fun x -> x <= pivot) rest
      in
      quick_sort smaller @ (pivot :: quick_sort greater)

(* Tail-recursive quicksort (using an explicit accumulator) *)
let quick_sort_tail (lst : 'a list) : 'a list =
  let rec aux acc = function
    | [] -> acc
    | [x] -> x :: acc
    | pivot :: rest ->
        let smaller, greater =
          List.partition (fun x -> x <= pivot) rest
        in
        aux (pivot :: aux acc greater) smaller
  in
  aux [] lst
