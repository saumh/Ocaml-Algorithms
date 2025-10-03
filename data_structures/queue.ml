(* IMMUTABLE QUEUE *)
(* using two stacks *)

module Queue = struct
  type 'a queue = { front : 'a list; back : 'a list }

  let empty : 'a queue = { front = []; back = [] }

  (* normalise queue: if front is empty, reverse back into front *)
  let normalise (q : 'a queue) : 'a queue =
    match q.front, q.back with
    | [], b -> { front = List.rev b; back = [] }
    | _ -> q

  let enqueue (x : 'a) (q : 'a queue) : 'a queue =
    { q with back = x :: q.back } |> normalise

  let dequeue (q : 'a queue) : ('a * 'a queue) option =
    match normalise q with
    | { front = []; _ } -> None
    | { front = x :: xs; back } -> Some (x, { front = xs; back })
end