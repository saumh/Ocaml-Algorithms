open Alcotest

module BST = Trees.Bst.BST
module RB = Trees.Rb_tree

let bst_test () =
  let open BST in
  let t = Empty |> insert 5 |> insert 3 |> insert 7 in
  check bool "search 3" true (search 3 t);
  check bool "search 7" true (search 7 t);
  check bool "search 10" false (search 10 t);
  let t = delete 3 t in
  check bool "deleted 3" false (search 3 t)

let rb_test () =
  let open RB in
  let t = empty |> insert 5 |> insert 3 |> insert 7 in
  check bool "search 3" true (search 3 t);
  check bool "search 7" true (search 7 t);
  check bool "search 10" false (search 10 t)

let () =
  Alcotest.run "Trees Tests"
    [ ("BST", [ Alcotest.test_case "bst_test" `Quick bst_test ]);
      ("RBTree", [ Alcotest.test_case "rb_test" `Quick rb_test ]) ]
