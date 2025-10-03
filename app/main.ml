(* app/main.ml *)

open Printf

(* Aliases for modules *)
module Stack = Data_structures.Stack.Stack
module Queue = Data_structures.Queue.Queue
module LinkedList = Data_structures.Linked_list.LinkedList
module Heap = Data_structures.Heap.Heap

module BST = Trees.Bst.BST
module RB = Trees.Rb_tree

module Quick_sort = Sorting.Quick_sort
module Merge_sort = Sorting.Merge_sort
module Heap_sort = Sorting.Heap_sort

module Graph = Graphs.Graph.Graph
module BFS = Graphs.Bfs
module DFS = Graphs.Dfs
module Topo = Graphs.Topological_sort

(* Helper to convert immutable linked list to OCaml list *)
let rec llist_to_list = function
  | LinkedList.Empty -> []
  | LinkedList.Cons (x, xs) -> x :: llist_to_list xs

let () =
  printf "=== Data Structures Demo ===\n";

  (* Stack *)
  let s = Stack.empty |> Stack.push 10 |> Stack.push 20 in
  let popped =
    match Stack.pop s with
    | Some (x, _) -> x
    | None -> -1
  in
  printf "Stack popped: %d\n" popped;

  (* Queue *)
  let q = Queue.empty |> Queue.enqueue 1 |> Queue.enqueue 2 in
  let (front, _) =
    match Queue.dequeue q with
    | Some (x, q') -> (x, q')
    | None -> (-1, q)
  in
  printf "Queue dequeued: %d\n" front;

  (* Linked List *)
  let ll = LinkedList.Cons (3, LinkedList.Cons (2, LinkedList.Cons (1, LinkedList.Empty))) in
  let ocaml_list = llist_to_list ll in
  printf "Linked list: %s\n"
    (String.concat " -> " (List.map string_of_int ocaml_list));

  (* Heap *)
  let h = Heap.empty |> Heap.insert 5 |> Heap.insert 2 |> Heap.insert 9 in
  let min_val = Heap.find_min h |> Option.value ~default:(-1) in
  printf "Heap min: %d\n" min_val;

  printf "\n=== Sorting Demo ===\n";
  let lst = [5;3;8;1;4] in
  let print_list name l =
    printf "%s: %s\n" name (String.concat ", " (List.map string_of_int l))
  in
  print_list "Quick sort" (Quick_sort.quick_sort lst);
  print_list "Merge sort" (Merge_sort.merge_sort lst);
  print_list "Heap sort" (Heap_sort.heap_sort lst);

  printf "\n=== Trees Demo ===\n";
  let bst =
    BST.Empty |> BST.insert 10 |> BST.insert 5 |> BST.insert 15 |> BST.insert 12
  in
  printf "BST search 12: %b\n" (BST.search 12 bst);
  printf "BST search 99: %b\n" (BST.search 99 bst);

  let rbt =
    RB.empty |> RB.insert 10 |> RB.insert 5 |> RB.insert 15 |> RB.insert 12
  in
  printf "RBT search 12: %b\n" (RB.search 12 rbt);

  printf "\n=== Graphs Demo ===\n";
  let g = Graph.empty |> Graph.add_edge 0 1 |> Graph.add_edge 0 2 |> Graph.add_edge 1 3 |> Graph.add_edge 2 4 in
  let bfs_result = BFS.bfs 0 g in
  let dfs_result = DFS.dfs 0 g in
  let topo_result = Topo.topological_sort g in
  print_list "BFS" bfs_result;
  print_list "DFS" dfs_result;
  print_list "Topo sort" topo_result;

  printf "\nDone!\n"
