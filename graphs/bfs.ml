(* BREADTH FIRST SEARCH *)

open Graph
module Queue = Data_structures.Queue.Queue

let bfs (start : 'a) (graph : 'a Graph.t) : 'a list =
  let rec aux (visited : 'a list) (q : 'a Queue.queue) : 'a list =
    match Queue.dequeue q with
    | None -> List.rev visited
    | Some (v, q') ->
        if List.mem v visited then
          aux visited q'
        else
          let ns = Graph.neighbors v graph in
          let q'' = List.fold_left (fun acc n -> Queue.enqueue n acc) q' ns in
          aux (v :: visited) q''
  in
  aux [] (Queue.enqueue start Queue.empty)
