(*
Práctica: 		9
Autor:			David Gayoso Salvado
Grupo:			1.5
*)

open Bin_tree;;

let rec fold_tree f e t =
  match t with
    Empty -> e
  | Node (x, l, r) -> f x (fold_tree f e l) (fold_tree f e r);;

let sum t = fold_tree (fun x l r -> x + l + r) 0 t;;
	
let prod t = fold_tree (fun x l r -> x *. l *.r) 1.0 t;;

let num_nodes t = fold_tree (fun x l r -> 1 + l + r) 0 t;;

let in_order t = fold_tree (fun x l r -> l @ [x] @ r) [] t;;

let mirror t = fold_tree (fun x l r -> Node(x, r, l)) Empty t;; 

let prod2 t = match t with
	Empty -> 1.0 
	| Node (x, l, r) -> if x = 0.0 then raise(Not_found)
						else try x *. (prod l) *. (prod r)
							with (Not_found) -> 0.0;;
