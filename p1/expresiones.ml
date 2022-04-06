();;
(*-:unit=()
 Expresion de tipo unit, la unidad más básica*)

2 + 5 * 3;;
(*- : int = 17
 Prioriza la multiplicación a la suma*)

1.0;;
(*- : float = 1.
 Representa el numero entero 1 asignándole valor flotante*)

(*1.0 * 2;;
 -: Error: This expression has type float but an expression was expected of type int
 El error es causado por ejecutar una operación con distintos tipos de datos (int & float) en este caso*)

(*2-2.0;;
 -: Error: This expression has type float but an expression was expected of type int
 En una misma operacion no se pueden utilizar enteros o flotantes, se debe operar solo con enteros o 
 solo con flotantes, usando los operadores adecuados.*)

(*3.0+2.0;;
 -: Error: This expression has type float but an expression was expected of type int
 Se necesita operar con un punto precedido del operador para trabajar con tipos int*)

5 / 3;;
(*- : int = 1
 Devuelve el cociente entero de la division*)

5 mod 3;;
(*- : int = 2
 Nos devuelve el valor entero del valor de 5 en módulo 3*)

3.0 *. 2.0 ** 3.0;;
(*- : float = 24.
 Prioriza la potencia ante la multiplicación y devuelve un valor flotante*)

3.0 = float_of_int 3;;
(*- : bool = true
 Devuelve verdadero o falso dependiendo de que si el valor flotante que le das 
 es igual a eliminarle la parte decimal, es decir, que si no tiene parte decimal devuelve true*)

(*sqrt 4;;
-: Error: This expression has type float but an expression was expected of type int
 *sqrt es una funcion para numeros de tipo flotante*)

int_of_float 2.1 + int_of_float (-2.9);;
(*- : int = 0
 Convierte los dos números en enteros eliminando su parte decimal, por lo que resulta ser una
 operación de 2-2*)

truncate 2.1 + truncate (-2.9);;
(*-:int=0
 Aproxima a su parte entera y realiza la suma*)

floor 2.1 +. floor (-2.9);;
(*-:float = -1
 la funcion floor aproxima al valor entero más bajo y sigue definiendo el número como flotante*)

(*ceil 2.1 +. ceil -2.9;;
 -: Error: This expression has type float -> float but an expression was expected of type float
 Ceil aproxima al valor más alto del entero, la operación da error por falta de paréntesis en el número negativo*)

'B';;
(*-: char = 'B'
 Recoge y devuelve el caracter introducido*)

int_of_char 'A';;
(*-: int=65
 Devuelve el valor de 'A' en la tabla ASCII*)

char_of_int 66;;
(*-:char='B'
 Devuelve el caracter que esta asignado al valor 66 en la tabla ASCII*)

Char.code 'B';;
(*-:int=66
 Mismo funcionamiento que el anterior*)

 Char.chr 67;;
(*-: char = 'C'
 Mismo funcionamiento que el anterior*)

'\067';;
(*-: char='C'
 Expresion más optimizada para obtener el caracter de valor 67*)

Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'M');;
(*-: char = 'm'
 Opera con los números correspondientes de cada caracter de la tabla ASCII y despúes
 transforma ese resultado en el caracter ASCII con ese valor*)

Char.uppercase 'm';;
(*- : char = 'M'
 Convierte el caracter introducido en su correspondiente mayúscula*)

Char.lowercase 'O';;
(*-: char = 'o'
 Convierte el caracter introducido en su correspondiente minúscula*)

"this is a string";;
(*-: string = "this is a string"
 Interpreta cualquier cadena de caracteres entre comillas como una string*)

String.length"longitud";;
(*-: int = 8
 Mide la la longitud del string*)

(*"1999"+"1";;
 Error: This expression has type string but an expression was expected of type int
 No se pueden sumar strings*)

"1999" ^ "1";;
(*-: string = "19991"
 Concatena las strings*)

int_of_string "1999" + 1;;
(*-: int = 2000
 Convierte la string a tipo int y realiza la suma*)

"\064\065";;
(*-: string = "@A"
 Pasa a caracteres los valores de tipo int y los concatena en una única string*)

string_of_int 010;;
(*-: string = "10"
 Convierte el entero en una string suprimiendo el cero a la izquierda por su valor inoperante*)

not true;;
(*-: bool = false
 Niega un valor booleano*)

true && false;;
(*-: bool = false
 Funcion AND, únicamente devuelve true si se introdujera true && true*)

true || false;;
(*-: bool = true
 Funcion OR, nos devuelve true en el caso de que introduzcamos un único valor true*)

(1<2) = false;;
(*-: bool = false
 Como 1<2 es verdadero y le estamos asignando un valor booleano false, nos devuelve un false*)

"1" < "2";;
(*-: bool = true
 Compara las dos strings y como el valor de las strings cumplen con la expresión devuelve true*)

2 < 12;;
(*-: bool = true
 Compara el valor de los enteros y devuelve si la expresión es false o en este caso true*)

"2" < "12";;
(*-: bool = false
 Compara el valor de los caracteres de los strings y como el 2 es mayor que el 1, devuelve false*)

"uno" < "dos";;
(*-: bool = false
 Como en el caso anterior, el valor de 'u' es mayor que el de la 'd', por lo que devuelve false*)

if 3 = 4 then 0 else 4;;
(*- : int = 4
 La expresion 3=4 siempre va a ser falsa por lo que devolverá 4 en todas las ejecuciones*)

if 3 = 4 then "0" else "4";;
(*- : string = "4"
 Igual que el caso anterior, solo que en vez de devolver un tipo int devuelve un string*)

(if 3 < 5 then 8 else 10) + 4;;
 (*- : int = 12
 Comprueba si la condición es cierta y lo que devuelva se le sumará 4*)

2.0 *. asin 1.0;;
(*- : float = 3.14159265358979312
 Una forma de conseguir el número pi*)

sin (2.0 *. asin 1.0 /. 2.);;
(*- : float = 1.
 Calcula el sen de pi partido de 2*)

function x -> 2 * x;;
(*-: int- > int = <fun>
 Creamos una función que multiplica un número de tipo int por 2*)

(function x -> 2 * x) (2 + 1);;
(*- : int = 6
 Misma función que el caso anterior, en este caso se ignora el valor de x y se multiplica 
 directamente la condición final de suma que le damos (3)*)

let x = 1;;
(*val x : int = 1
 Se le asigna a la variable x el valor de int = 1*)

let y = 2;;
(*val y : int = 2
 Se le asigna a la variable y el valor de int = 2*)

x-y;;
(*- : int = -1
 Resta las variables x e y con valores previamente asignados*)

let x = y in x - y;;
(*- : int = 0
 Como se le asignan valores idénticos a las variables x e y el resultado es = 0 del mismo
 tipo de las variables*)

x-y;;
(*- : int = -1
 La asignación anterior no cambia el valor de las variables por lo que la resta no es igual a cero*)

(*z;;
Error: Unbound value z
 Da error ya que la variable z no existe, es decir, no se le ha asignado ningún valor*)

let z = x + y;;
(*val z : int = 3 
 Se guarda en una nueva variable z el valor de la suma de las variables x e y*)

z;;
(*- : int = 3
 Muestra el valor de la variable z*)

let x = 5;;
(*val x : int = 5
 Cambia el valor de la variable x*)

z;;
(*val z : int = 3
 Muestra el valor de la variable z*)

let y = 5 in x + y;;
(*- : int = 10
 Se le da un valor distinto a la variable y en esta operación pero no cambia*)

x + y;;
(*- : int = 7
 Opera con las variables x e y*)

let x = x + y in let y = x * y in x + y + z;;
(*- : int = 24
 les asignamos nuevos valores temporales durante esta función a las variables x e y, para dar 
 como salida a la operación x+y+z de tipo int*)

x + y + z;;
(*- : int = 10
 Opera con las variables x,y,z y como podemos comprobar la función anterior no alteró sus valores*)

int_of_float;;
(*- : float -> int = <fun>
 Funcion que convierte un dato tipo int a tipo float*)

float_of_int;;
(*- : int -> float = <fun>
 Funcion que convierte un dato tipo float a tipo int*)

int_of_char;;
 (*- : char -> int = <fun>
 Funcion que convierte un dato tipo int a su correspondiente caracter en la tabla ASCII*)

char_of_int;;
 (*- : int -> char = <fun>
 Funcion que convierte un caracter a su correspondiente dato tipo int en la tabla ASCII *)

abs;;
(*- : int -> int = <fun>
 La función abs devuelve el valor absoluto de tipo int del número que reciba*)

sqrt;;
(*- : float -> float = <fun>
 La funcion sqrt devuelve el valor float de la raíz cuadrada del número introducido*)

truncate;;
(*- : float -> int = <fun>
 Aproxima un número flotante a su entero pasándolo a ser de tipo int*)

ceil;;
(*- : float -> float = <fun>
 Aproxima al entero más grande en tipo float*)

floor;;
(*- : float -> float = <fun>
 Aproxima al entero más pequeño en tipo float*)

Char.code;;
(*- : char -> int = <fun>
 Funciona igual que int_of_char como mencionamos anteriormente*)

Char.chr;;
(*- : int -> char = <fun>
 Funciona igual que char_of_int como mencionamos anteriormente*)

Char.uppercase;;
(*- : char -> char = <fun>
 Recibe un caracter y devuelve su correspondiente mayúscula*)

Char.lowercase;;
(*- : char -> char = <fun>
 Recibe un caracter y devuelve su correspondiente minúscula*)

int_of_string;;
(*- : string -> int = <fun>
 Esta función convierte un dato tipo int a una string*)

string_of_int;;
(*- : int -> string = <fun>
 Recibe como entrada un string y devuelve un dato tipo int*)

String.length;;
(*- : string -> int = <fun>
 Devuelve en formato int la longitud en caracteres de una string*)

let f = function x -> 2 * x;;
(*val f : int -> int = <fun>
 Se define una función f que duplica el valor que le pases*)

f(2+1);;
(*- : int = 6
 Se le multiplica a la suma 2+1 * 2 ya que es la operación que realiza la función f*)

f 2 + 1;;
(*- : int = 5
 Solo afecta al dos la función, por lo que se multiplica 2*2 y luego se le suma 1*)

let n = 1;;
(*val n : int = 1
 Se crea una variable n a la que se le asigna el valor 1 de tipo int*)

let g x = x + n;;
(*val g : int -> int = <fun>
 La variable creada 'g' va a depender del valor de n y x*)

g 3;;
(*- : int = 4
 Ejecuta la función g dandole un valor de tipo int = 3 a la variable x*)

let n = 5;;
(*val n : int = 5
 Cambia el valor de la variable n*)
 
g 3;;
(*- : int = 4
 Ejecuta la funcion g dandole a x un valor de 3, y el resultado es int = 4 debido a que el anterior
 cambio de la variable n no se puede realizar*)
