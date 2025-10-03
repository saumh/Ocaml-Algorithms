(* TOPOLOGICAL SORT *)

open Graph
module Queue = Data_structures.Queue.Queue

let topological_sort (graph : 'a Graph.t) : 'a list =
  (* Compute in-degrees for each vertex *)
  let indegrees =
    List.fold_left
      (fun acc (v, ns) ->
         let acc =
           if List.mem_assoc v acc then acc else (v, 0) :: acc
         in
         List.fold_left
           (fun acc n ->
              let d = match List.assoc_opt n acc with Some x -> x | None -> 0 in
              (n, d + 1) :: List.remove_assoc n acc)
           acc ns)
      [] graph
  in

  (* Initialize queue with vertices of indegree 0 *)
  let q =
    List.fold_left
      (fun q (v, d) -> if d = 0 then Queue.enqueue v q else q)
      Queue.empty indegrees
  in

  let rec aux (order : 'a list) (q : 'a Queue.queue) (indegs : ('a * int) list) =
    match Queue.dequeue q with
    | None -> List.rev order
    | Some (v, q') ->
        let order' = v :: order in
        let ns = Graph.neighbors v graph in
        let (indegs', q'') =
          List.fold_left
            (fun (inds, qacc) n ->
               let d = match List.assoc_opt n inds with Some x -> x | None -> 0 in
               let d' = d - 1 in
               let inds' = (n, d') :: List.remove_assoc n inds in
               let qacc' = if d' = 0 then Queue.enqueue n qacc else qacc in
               (inds', qacc'))
            (indegs, q') ns
        in
        aux order' q'' indegs'
  in

  aux [] q indegrees
