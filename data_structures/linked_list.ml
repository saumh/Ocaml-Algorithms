(* IMMUTABLE LINKED LIST *)

module LinkedList = struct
  type 'a llist =
    | Empty
    | Cons of 'a * 'a llist

  let empty = Empty

  let rec length (lst : 'a llist) : int =
    match lst with
    | Empty -> 0
    | Cons(_, xs) -> 1 + (length xs)

  let rec map (f : 'a -> 'b) (lst : 'a llist) : 'b llist =
    match lst with
    | Empty -> Empty
    | Cons(x, xs) -> Cons(f x, map f xs)

  let rec filter (f : 'a -> bool) (lst : 'a llist) : 'a llist =
    match lst with
    | Empty -> Empty
    | Cons(x, xs) -> 
      if f x then Cons(x, filter f xs)
      else filter f xs
end