let rec gcd x y =
  if y = 0 then x else gcd y (x mod y);; 


let is_prm n =
  let rec not_divisible_from d =
    d * d > n || (n mod d <> 0 && not_divisible_from (d+1)) in
    n > 1 && not_divisible_from 2;;


let is_prm2 n =
  let rec not_divisible_from d =
    (n mod d <> 0 && not_divisible_from (d+1)) || d * d > n in
    n > 1 && not_divisible_from 2;; 

(*Las funciones realizan la misma tarea de detectar si un numero es 
primo o no, con diferencia en que prm2 lanza un error de STACK OVERFLOW *)


let capicua x =                                               
  let rec inverso x i =                                     
        let r = x mod 10 in                                       
          if (x/10 = 0) then i*10+r
           else inverso (x/10) (i*10+r) in 
            x = inverso x 0;;
