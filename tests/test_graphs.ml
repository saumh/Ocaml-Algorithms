open Alcotest

module G = Graphs.Graph.Graph
module BFS = Graphs.Bfs
module DFS = Graphs.Dfs
module TS = Graphs.Topological_sort

let test_graph_algorithms () =
  let g = [] |> G.add_edge 1 2 |> G.add_edge 1 3 |> G.add_edge 2 4 in
  let bfs_res = BFS.bfs 1 g in
  let dfs_res = DFS.dfs 1 g in
  let ts_res = TS.topological_sort g in
  (* Example checks *)
  check (list int) "BFS starts with 1" [1] (List.take 1 bfs_res);
  check (list int) "DFS starts with 1" [1] (List.take 1 dfs_res);
  check (list int) "Topological sort contains all vertices"
    [1;2;3;4]
    (List.sort compare ts_res)

let () =
  run "Graphs Tests"
    [ ("Graph Algorithms", [ test_case "graph_algorithms" `Quick test_graph_algorithms ]) ]
