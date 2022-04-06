false && (2 / 0 > 0);;
(*- : bool = false
Devuelve falso ya que existe un false*)

(*true && (2 / 0 > 0);;
Exception: Division_by_zero.
En el caso anterior no se tiene en cuenta el segundo argumento 
ya que existe un false que cierra el resultado, aquí salta la 
excepción de dividir entre cero*)

true || (2 / 0 > 0);;
(*- : bool = true
Devuelve un true ya que como ya existe un valor true en la expresión
se ignora el resto de argumentos*)

(*false || (2 / 0 > 0);;
Exception: Division_by_zero.
En este caso si se tiene en cuenta el siguiente argumento por lo que lanza 
la excepción por pantalla*)

let con = (&&);;
(*val con : bool -> bool -> bool = <fun>
Se crea una variable booleana con valor conjuntivo*)

let dis = (||);;
(*val dis : bool -> bool -> bool = <fun>
Se crea una variable booleana con valor disyuntivo*)

(&&) (1 < 0) (2 / 0 > 0);;
(*- : bool = false
La condición 1<0 es falsa por lo que no se tiene en cuenta los siguientes argumentos y
la función devuelve false*)

(*con (1 < 0) (2 / 0 > 0);;
Exception: Division_by_zero.
Al crear la variable con la función conjuntiva si que se tienen en cuenta ambos argumentos
por lo que salta la excepción del segundo*)

(||) (1 > 0) (2 / 0 > 0);;
(*- : bool = true
El primer argumento devuelve un true por lo que se ignora el siguiente argumento que lanzaría
una excepción*)

(*dis (1 > 0) (2 / 0 > 0);;
Exception: Division_by_zero.
Como anteriormente con la variable conjunción, esta evalúa los dos argumentos que le pasamos, por 
lo que salta la excepción. Si añadimos algún otro argumento de valor booleano se imprimiría lo
siguiente por pantalla: Error: This function has type bool -> bool -> bool. It is applied to too many arguments; maybe you forgot a `;'. En lo que destacamos la parte de demasiados argumentos.*)

