(* DEPTH FIRST SEARCH *)

open Graph

let dfs (start : 'a) (graph : 'a Graph.t) : 'a list =
  let rec aux (visited : 'a list) (stack : 'a list) : 'a list =
    match stack with
    | [] -> List.rev visited
    | v :: rest ->
        if List.mem v visited then
          aux visited rest
        else
          let ns = Graph.neighbors v graph in
          (* push neighbors on stack, depth-first order *)
          aux (v :: visited) (ns @ rest)
  in
  aux [] [start]
