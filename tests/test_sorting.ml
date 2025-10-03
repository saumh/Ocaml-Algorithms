open Alcotest

(* Import sorting modules *)
module HeapSort = Sorting.Heap_sort
module MergeSort = Sorting.Merge_sort
module QuickSort = Sorting.Quick_sort

let unsorted = [5; 2; 9; 1; 5; 6]
let sorted = [1; 2; 5; 5; 6; 9]

let test_heap_sort () =
  check (list int) "heap_sort works" sorted (HeapSort.heap_sort unsorted)

let test_merge_sort () =
  check (list int) "merge_sort works" sorted (MergeSort.merge_sort unsorted)

let test_quick_sort () =
  check (list int) "quick_sort works" sorted (QuickSort.quick_sort unsorted)

let () =
  Alcotest.run "Sorting Tests"
    [ ("Heap Sort", [ Alcotest.test_case "heap_sort" `Quick test_heap_sort ]);
      ("Merge Sort", [ Alcotest.test_case "merge_sort" `Quick test_merge_sort ]);
      ("Quick Sort", [ Alcotest.test_case "quick_sort" `Quick test_quick_sort ]) ]
