(* IMMUTABLE STACK *)

module Stack = struct
  type 'a stack = 'a list

  let empty : 'a stack = []

  let push (x : 'a) (s : 'a stack) : 'a stack =
    x :: s

  let pop (s : 'a stack) : ('a * 'a stack) option =
    match s with
    | [] -> None
    | h::t -> Some (h, t)

  let peek (s : 'a stack) : 'a option =
    match s with
    | [] -> None
    | h::_ -> Some h
end