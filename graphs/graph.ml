(* IMMUTABLE GRAPH *)

module Graph = struct
  type 'a t = ('a * 'a list) list
  (* adjacency list representation *)

  let empty : 'a t = []

  (* add a vertex if it doesn’t already exist *)
  let add_vertex (v : 'a) (g : 'a t) : 'a t =
    if List.mem_assoc v g then g
    else (v, []) :: g

  (* add a directed edge v1 -> v2 *)
  let add_edge (v1 : 'a) (v2 : 'a) (g : 'a t) : 'a t =
    let rec aux acc = function
      | [] -> List.rev ((v1, [v2]) :: acc)  (* v1 not found, create new entry *)
      | (v, ns) :: rest when v = v1 ->
          List.rev_append acc ((v, v2 :: ns) :: rest)
      | x :: rest -> aux (x :: acc) rest
    in
    aux [] (add_vertex v2 (add_vertex v1 g))

  (* get neighbors of a vertex *)
  let neighbors (v : 'a) (g : 'a t) : 'a list =
    match List.assoc_opt v g with
    | Some ns -> ns
    | None -> []
end
