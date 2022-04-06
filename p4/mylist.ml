let hd = function
      [] -> raise(Failure"hd")
    | x::_ -> x;;

let tl = function
      [] -> failwith("tl")
    | _::y -> y;;

let rec length = function
      [] -> 0
    | (_::x) -> 1 + length(x);;

let rec compare_lengths li le = match (li,le) with
    ([],[]) -> 0 
   | (_ ,[]) -> 1
   | ([],_) -> -1
   | (_::x,_::y)-> compare_lengths x y;;

let rec nth l n = match l with
    [] -> failwith("nth")
  | x::y -> if n = 0 then x else nth y (n-1);;

let rec append l p = match l with
    [] -> p
  | x::y -> x::(append y p);;
    
let rec rev l = match l with
    [] -> []
  | x::y -> append (rev y) [x];;    
    
let rec init len f =
if len = 0 then []
else rev((f len)::(init(len - 1) f));;

let rev_append l1 l2 = match l1 with
	[] -> l2
  | x::y -> append (rev l1) l2;;

let rec concat l = match l with
	[] -> []
  | x::y -> append x (concat y);;

let flatten = concat;;

let rec map f l = match l with
    [] -> []
  | x::y -> (f x)::(map f y);;

let rec rev_map f l = match l with
    [] -> []
  | x::y -> rev(map f l);;

let rec map2 f l1 l2 = match (l1,l2) with
    ([],[]) -> []
  | (x::y,a::b) -> (f x a)::map2 f y b
  | _ -> failwith("Invalid_argument");;


let rec fold_left f a l = match l with
    [] -> a
  | x::y -> fold_left f (f a x) y;;

let rec fold_right f l a = match l with
    [] -> a
  | x::y -> f x (fold_right f y a);;


let rec find f l = match l with
    [] -> failwith("Not_found")
  | x::y -> if f x then x else find f y;;

let rec for_all f l = match l with
    [] -> true
  | x::y -> (f x) && for_all f y;;

let rec exists f l = match l with
    [] -> false
  | x::y -> (f x) || exists f y;;

let rec mem a l = match l with
    [] -> false
  | x::y -> (x = a) || mem a y;;

let rec filter f l = match l with
    [] -> []
  | x::y -> if f x then x::(filter f y) else (filter f y);;

let find_all = filter;;

let partition f l = 
    let rec aux l1 l2 l3 = match l3 with
        [] -> (rev l1,rev l2)
      | x::y -> if f x 
                then aux (x::l1) l2 y 
                else aux l1 (x::l2) y in
    aux [] [] l;;
        

let split l = 
    let rec aux l1 l2 l3 = match l3 with
        [] -> (rev l1,rev l2)
      | (a,b)::y -> aux (a::l1) (b::l2) y in
    aux [] [] l;;
        

let rec combine l1 l2 = match (l1,l2) with
	([],[]) -> []
  |	(x::y,a::b) -> append [(x,a)] (combine y b)
  | _ -> failwith("Invalid_argument");;
