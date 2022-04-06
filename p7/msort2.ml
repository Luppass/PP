open List;;

let rec divide = function
   [] -> [], []
  | h::[] -> [h],[]
  | h1::h2::t -> let t1,t2 = divide t in (h1::t1, h2::t2);;



let rec merge ord (l1 ,l2) = match (l1,l2) with
   [],l | l,[] -> l
  | h1::t1, h2::t2 -> if ord h1 h2 then h1::merge ord (t1, l2)
                      else h2::merge ord (l1, t2);;


let rec msort1 ord l = match l with
   [] | _::[] -> l
  | _ -> let l1, l2 = divide l in
         merge ord ((msort1 ord l1), (msort1 ord l2));;

let aleatorio n =
    let rec aux numero lista =
       if (numero = 0) then lista 
       else aux (numero - 1) (Random.int 10000 :: lista)
    in aux n [];;

let l2 = aleatorio 100000;;

(*con msort2, que tiene split y merge terminales, no me da error pero cuando utilizo el msort1 de una lista muy grande salta el error de Stack Overflow*)

let divide' l =
   let rec aux lo ld1 ld2 = match lo with
        [] -> (ld1, ld2)
      | h::[] -> aux [] (h::ld1) ld2
      | h1::h2::t -> aux t (h1::ld1) (h2::ld2)
    in aux l [] [];; 


let merge' ord (l1, l2) = 
   let rec aux laux1 laux2 lista = match laux1,laux2 with
       [],l | l,[] -> rev_append lista l
      | h1::t1, h2::t2 -> if ord h1 h2 then aux t1 (h2::t2) (h1::lista)
                          else aux (h1::t1) t2 (h2::lista)
   in aux l1 l2 [];;  


let rec msort2 ord l = match l with
   [] | _::[] -> l
 | _ -> let l1, l2 = divide' l in
        merge' ord ((msort2 ord l1), (msort2 ord l2));;


let lista = aleatorio 50000;;

let time f ord l = 
    let t = Sys.time() in 
    let fx = f ord l in 
    Printf.printf "Execution time: %fs\n" (Sys.time() -. t); 
    fx;;

let t1 = time msort1 (<) lista;;

let t2 = time msort2 (<) lista;;

let qsort3 ord l =
  let rec sort_asc = function
    [] -> []
   | h::t -> let after, before = partition (ord h) t in rev_append (sort_des before) (h :: sort_asc after)
  and sort_des = function
    [] -> []
   | h::t -> let after, before = partition (ord h) t in rev_append (h :: sort_asc after) (sort_des before)
  in sort_asc l;;

let t3 = time qsort3 (<) lista;;

(*Hice la comparacion de tiempos (varias veces) entre msort1, msort2 y qsort3 con una lista de aleatorios y la conclusion es que msort1 es un poco mas rapida que msort2 y qsort3 es un poco mas lenta que msort2*)
