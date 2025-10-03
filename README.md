# Functional Data Structures and Algorithms in OCaml

This repository contains implementations of classic **data structures** and **algorithms** in OCaml, written in a functional style.  
It is organized into several libraries:

- **data_structures/**  
  Immutable stack, queue, linked list, and heap.

- **graphs/**  
  Graph representation and algorithms: BFS, DFS, and topological sort.

- **sorting/**  
  Sorting algorithms: heap sort, merge sort, quick sort.

- **trees/**  
  Binary Search Tree (BST) and Red-Black Tree (RBT).

- **app/**  
  Example executable that demonstrates usage of the libraries.

---

## 📂 Project Structure

```
├── dune-project
├── data_structures/
│ ├── stack.ml
│ ├── queue.ml
│ ├── linked_list.ml
│ └── heap.ml
├── graphs/
│ ├── graph.ml
│ ├── topological_sort.ml
│ ├── bfs.ml
│ └── dfs.ml
├── sorting/
│ ├── heap_sort.ml
│ ├── merge_sort.ml
│ └── quick_sort.ml
├── trees/
│ ├── bst.ml
│ └── rb_tree.ml
└── app/
└── main.ml
```


Each subdirectory has its own `dune` file that defines a library.  
The `app/` directory contains an executable that depends on all of them.

---

## Getting Started

### 1. Install OPAM and OCaml

If you don’t already have OPAM:

```bash
# macOS
brew install opam

# Ubuntu / Debian
sudo apt install opam
```
Initialise opam
```bash
opam init
opam update
```

### 2. Create a switch (OCaml compiler version)
Pick a recent version:
```bash
opem switch list-available
opam switch create [version]
eval $(opam env)
```

### 3. Install Dune & Alcotest
```bash
opam install dune
opam install alcotest
```
Verify installation:
```bash
dune --version
```

## Building and Running
From the repository root:

```bash 
dune build 
```

Run the example app

```bash
dune exec ./app/main.exe
```

This will:

- Push and pop from a stack

- Run BFS on a small graph

- Sort a list using quicksort, mergesort, and heapsort

- Insert and search in a BST

## Usage of libraries
Example usage:

```ocaml
open Data_structures
open Sorting
open Trees
open Graphs

let () =
  let s = Stack.push 42 Stack.empty in
  match Stack.pop s with
  | Some (x, _) -> Printf.printf "Popped: %d\n" x
  | None -> Printf.printf "Stack empty\n";

  let sorted = Quick_sort.quick_sort [5;3;8;1] in
  Printf.printf "Sorted: %s\n"
    (String.concat ", " (List.map string_of_int sorted));

```