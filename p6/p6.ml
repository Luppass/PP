let rec suml l= 
  let rec aux s lista = match lista with
     [] -> s
    | h::t -> aux (s+h) t
  in aux 0 l;;

let rec maxl l = match l with
   [] -> raise (Failure "maxl")
  | h::t -> let rec aux maxim lista = match lista with
        [] -> maxim
       | x::y -> aux (max maxim x) y
     in aux h t;;

let rec to0from n =
if n < 0 then []
else let rec aux num l = 
       if num < n then aux (num + 1) (num::l)
       else num::l
     in aux 0 [];;

let rec fromto m n =
if m > n then []
else let rec aux num l = 
       if m < num then aux (num-1) (num::l)
       else num::l
     in aux n [];;

let rec from1to n =
if n < 1 then []
else let rec aux num l = match num with 
       1 -> num::l
      |_ -> aux (num - 1) (num :: l)
     in aux n [];;

let append l1 l2 =
    let rec aux l p = match l with
         [] -> p
        | h::t -> aux t (h::p)
    in aux (List.rev l1) l2;;

let map f l =
   let rec aux li = function
       [] -> List.rev li
      | h::t -> aux (f h::li) t
   in aux [] l;;


let power x y =
  if y < 0 then invalid_arg "power"
     else let rec aux num m = match m with 
         0 -> num
        |_ -> aux (x * num) (m-1)
     in aux 1 y;;
        

let incseg l =
   let rec aux l1 l2 c = match l2 with 
      [] -> List.rev l1
     |h::t -> aux ((h+c)::l1) t (c+h)
   in aux [] l 0;;

let rec remove a l = 
    let rec aux l1 l2 = match l2 with 
        [] -> List.rev l1
      | x::y -> if x = a then List.rev_append l1 y
                else aux (x::l1) y in
    aux [] l;;                 

let rec insert x l=
   let rec aux laux lista = match lista with 
       [] -> List.rev (x::laux)
      |h::t -> if x <= h then List.rev_append (h::x::laux) t
               else aux (h::laux) t
   in aux [] l;;

let rec insert_gen f x l=
   let rec aux laux lista = match lista with 
       [] -> List.rev (x::laux)
      |h::t -> if f x h then List.rev_append (h::x::laux) t
               else aux (h::laux) t
   in aux [] l;;