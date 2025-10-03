(* HEAP SORT *)
module Heap = Data_structures.Heap.Heap

let heap_sort (lst : 'a list) : 'a list =
  (* Build a heap from the list *)
  let h =
    List.fold_left (fun acc x -> Heap.insert x acc) Heap.empty lst
  in
  (* Extract elements in sorted order *)
  let rec extract acc h =
    match Heap.find_min h with
    | None -> List.rev acc
    | Some x -> extract (x :: acc) (Heap.delete_min h)
  in
  extract [] h
