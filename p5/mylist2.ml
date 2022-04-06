let hd = function
      [] -> raise(Failure"hd")
    | x::_ -> x;;


let tl = function
      [] -> failwith("tl")
    | _::y -> y;;

let length l = 
    let rec aux s l = match l with
        [] -> s
      | x::y -> aux (s+1) y 
    in aux 0 l;;

let rec compare_lengths li le = match (li,le) with
    ([],[]) -> 0 
   | (_ ,[]) -> 1
   | ([],_) -> -1
   | (_::x,_::y)-> compare_lengths x y;;    

let rec nth l n =
    if n >= length l then failwith("nth") else
        if n < 0 then raise(Invalid_argument"List.nth") else
           if n = 0 then (hd l) else nth (tl l) (n-1);; 
            
  
let rec append l p = match l with
    [] -> p
  | x::y -> x::(append y p);;
    

let rec rev_append l1 l2 =  match l1 with
    [] -> l2
  | x::y -> rev_append y (x::l2);;


let rec rev l = rev_append l [];;

let rec concat l = match l with
	[] -> []
  | x::y -> append x (concat y);;

let flatten = concat;;

let init len f =
   if len < 0 then raise(Invalid_argument"")
   else if len = 0 then []
        else let rec aux l n = 
                 if n>0 then aux ((f (n-1))::l) (n-1)
                 else l
             in aux [] len;;

let rec map f l = match l with
    [] -> []
  | x::y -> (f x)::(map f y);;


let rev_map f l = 
  let rec aux l1 l2 = match l1 with
     [] -> l2
    | x::y -> aux y (f x :: l2)
  in aux l [];;


let rec map2 f l1 l2 = match (l1,l2) with
    ([],[]) -> []
  | (x::y,a::b) -> (f x a)::map2 f y b
  | _ -> raise(Invalid_argument"");;


let fold_left f a l =
    let rec aux n la = match la with
	[] -> n
	| x::y -> aux (f n x) y
    in aux a l;;

let rec fold_right f l a = match l with
    [] -> a
  | x::y -> f x (fold_right f y a);;


let rec find f l = match l with
    [] -> raise(Not_found)
  | x::y -> if f x then x else find f y;;

let rec for_all f l = match l with
    [] -> true
  | x::y -> if not (f x) then false else for_all f y;;

let rec exists f l = match l with
    [] -> false
  | x::y -> if (f x) then true else exists f y;;

let rec mem a l = match l with
    [] -> false
  | x::y -> if x == a then true else mem a y;;

let filter f l = 
    let rec aux l1 l2 = match l2 with
        [] -> rev l1
      | x::y -> if f x then aux (x::l1) (y) else aux l1 (y) in
    aux [] l;; 

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
        [] -> (rev l1, rev l2)
      | (a,b)::y -> aux (a::l1) (b::l2) y in
    aux [] [] l;;
        
let rec combine l1 l2 = match (l1,l2) with
	([],[]) -> []
  |	(x::y,a::b) -> append [(x,a)] (combine y b)
  | _ -> raise(Invalid_argument"");;









