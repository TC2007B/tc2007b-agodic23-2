## Objetivo

En este laboratorio exploraremos los principios básicos de Swift como lenguaje de programación antes de empezar a aplicarlo en los principios de desarrollo móvil en Xcode.

Si bien atenderemos las bases del lenguaje de programación para que estés más familiarizado con el mismo. **Este no es un curso sobre Swift, por lo que conceptos avanzados deberás ir buscándolos conforme avance el curso**.

## Instrucciones

Sigue los pasos descritos en la siguiente práctica, si tienes algún problema no olvides que tus profesores están para apoyarte.

## Laboratorio
### Paso 1 Herramienta de trabajo

Si bien en el curso utilizaremos Xcode la mayor parte del tiempo, para aprender los fundamentos vamos a realizarlo de una manera más simple, en vez de crear un proyecto tipo App, creamos un proyecto tipo Playground. En caso de que no tengas instalado Xcode puedes utilizar [Swift Playgrounds](https://swiftfiddle.com) para tu laboratorio, pero más adelante ocuparás Xcode. 

Dentro de esta página observarás que ya tenemos un entorno de compilación completo, la única recomendación es que el avance que vayas teniendo lo guardes en un archivo de texto aparte o un archivo con extensión **.swift** que es la extensión de un script de Swift mientras te familiarizas.
### Paso 2 Hello World en Swift

Una vez con nuestro entorno configurado vamos a empezar con el típico **Hello World**.

A diferencia de muchos lenguajes de programación, principalmente orientado a objetos, requiere la función main para para poder arrancar, sin embargo en Swift puedes establecer cualquier función desde el inicio. 

Para completar este paso, escribe la siguiente instrucción en terminal, y dale run al proyecto

```
print("Hello World")
// Prints "Hello World"
```

Como puedes ver **print** muestra lo que hay dentro del paréntesis siempre en formato de String para que se muestre en la terminal. 

Algo importante a destacar es que Swift es sensible a mayúsculas y minúsculas. Para probar esto escribe en vez de **print** **Print**. Si ejecutas el programa te debería salir el siguiente error:

```
cannot find 'Print' in scope
```

### Paso 3 Variables en Swift

Como ya sabes una variable, no es más que un espacio de memoria en el que podemos guardar información.

Dependiendo del tipo de información disponemos de diferentes variables, esto nos evita el intentar sumar números con letras ya que al ser de diferente tipo no nos lo permitirá.

Swift hace la inferencia de tipos en algunas ocasiones, pero esta inferencia se realiza por conocimiento de tipos desde el momento de la compilación más no por que se adapte una variable al tipo como sucede en los lenguajes Script.

Para comenzar vamos a copiar las siguientes variables del siguiente modo:

```
var myVariable = 42
myVariable = 50
let myConstant = 42
```

Utiliza **let** para hacer una constante y **var** para hacerla variable. El valor de la constante no necesita ser conocido en el tiempo de compilación pero debes asignar el valor exactamente una vez, a continuación le asignamos un nombre y le asignamos un valor

También podemos usar emoji's:
```
let 😄 = "awesome"
print(😄)
```

Este es un perfecto ejemplo de la inferencia que realiza Swift, si bien no le hemos dicho que tipo de variable es, Swift lo ha entendido, esto por que Swift busca el tipo de valor, y le asigna un tipo por detrás, pero como dije, esto no siempre será correcto o siempre podrá realizarse así que en esos casos necesitamos decirle el tipo, y más cuando queramos usarlo como valor nulo al inicio.

```
var numeroFavorito:Int = 1
```
Observa que hemos colocado dos punto y acto seguido el tipo de variable, en este caso Int.

``` 
Experimento 
Crea una constante con el tipo Float y el valor de 4
```

Los valores nunca son convertidos de manera implicita a otro tipo. Si necesitas convertir un valor un tipo diferente, crea la instancia el tipo deseado.

```
let label = "The height is "
let height = 81
let heightLabel = label + String(height)
```

Si quitas la la conversion String(), no te dejará compilar el programa, ya que son tipos de datos diferentes mostrándote el siguiente error

```
Binary operator '+' cannot be applied to operands of type 'String' and 'Int'
```

### Paso 4 Tipos de Variables

#### Variables Numéricas
Variables para asignación de números, calculo de tamaños y realizar operaciones matemáticas entre otras. Dentro de ellas se dividen dos grupos, enteros y reales.

- Integer: Dentro de las enteras encontramos las variables Int, las más básicas que usaremos, aquí tenemos números naturales pero con limitación. Con una variable tipo **Int** no se puede pasar de los rangos  **-2,147,483,647 a** **2,147,483,647**
```
let numeroFavorito: Int = -269
```

- Float: Variables reales, a diferencia de las anteriores pueden almacenar decimales con un soporte de hasta máximo 6. Aunque también pueden trabajar con números enteros. Este tipo cambia un poco con respecto a las demás, puesto que deberemos añadir una **f** al final del valor.

```
let numeroFavorito: Float = 1.93
```

- Double: Para terminar las variables más grandes que soportan hasta 14 decimales, pero ojo, ocupan más memoria así que para un código óptimo tenemos que pensar cual es la que se adapta mejor a nuestro proyecto. En estas no necesitamos agregar ningún tipo de letra al final del valor.
```
let numeroFavorito: Double = 7.478492375
```

#### Variables Alfanuméricas

Ya que aprendimos sobre números ahora veremos como usar texto o mezclas de caracteres.

- String: Permite almacenar cualquier tipo de caracteres, la cantidad que queramos. Entonces como ya debes sabes un String es una cadena de Char, e igualmente como ya debes saber las cadenas van entre comillas dobles.
```
let numeroFavorito = "Mi número favorito es el 44"
let test = "Test. 12345!·$%&/"
let char = "a"
```

En caso de tener strings de multiples lineas, puedes utilizar """ de la siguiente forma:

```
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""
```

#### Variables Booleanas

- Boolean: Variables que solo pueden ser verdaderas o falsas {true o false}. 
```
var estoyTriste = false
var estoyFeliz = true
```

**Nota: A estas alturas de la carrera, espero no tengas problema con los tipos básicos para el lenguaje, empezamos desde 0 para que veas los pasos para poder aprender cualquier lenguaje de programación en general, lo primero es conocer los datos primitivos del lenguaje.**

### Paso 5 Operaciones aritméticas

A continuación te mostraré los tipos de operaciones básicas que podemos realizar.

```
let a = 8
let b = 3

print("Suma: ")
print(a + b)

print("Resta: ")
print(a - b)

print("Multiplicación: ")
print(a * b)

print("División: ")
print(a / b)

print("El módulo (resto): ")
print(a % b)
```

Estas operaciones son muy básicas por lo que no debería haber ninguna complicación, ahora veremos que pasa cuando tenemos un **Float** y un **Int**.

```
let a = 8.5
let b = 3

print("Suma: ")
var resultado = Int(a) + b

print(resultado)
```

Recuerda que debemos hacer el cast de la variable para que la suma sea de los mismos tipos y no nos de error.
### Paso 5 Concatenación

Si tenemos dos String, a diferencia de Kotlin podemos sumar para mostrarlas y también la concatenación. Que en forma simple es más que un atributo para poder poner más de una variable.

La formas de concatenación son las siguientes:

```
let greeting = "Hola, me llamo"
let name = "Ted"

print(greeting + " " + name)
print("\(greeting) \(name)")
```

Para ejecutar la concatenación solo se debe añadir las variables entre comillas dobles y anteponer a cada una de ellas el símbolo **\\** y entre paréntesis. También observa que en la concatenación se añade un espacio entre ambas variables, de lo contrario aparecerá el resultado sin ese espacio.

Como te mencionaba con la concatenación también podemos hacer operaciones. Debemos cuidar cualquier error ya que de lo contrario será difícil detectarlo, pero si lo controlamos no debería haber problema.

```
var introduction = "El resultado de"
var plus = "más"
var firstNumber = 2
var secondNumber = 5

print("\(introduction) \(firstNumber) \(plus) \(secondNumber) es: \(firstNumber + secondNumber)")
```

El resultado sería este:

```
El resultado de 2 más 5 es: 7
```

### Paso 6 Funciones en Swift

Empezaremos a hablar de las funciones en Swift, en otros lenguajes también son conocidos como métodos como en Java. Una función nos es más que un conjunto de instrucciones que realizan una determinada tarea y la podemos invocar mediante su nombre.

#### Declarando funciones

Las funciones se declaran usando la palabra clave **func**, seguida del nombre del método, los paréntesis donde declararemos los valores de entrada y unas llaves que limitan la función.

```    
func showMyName(){
    print("Me llamo Alex")
}
func showMyLastName(){
    print("Mi Apellido es Fernández")
}
func showMyAge(){
    print("Tengo 31 años")
}

showMyName()
showMyLastName()
showMyAge()
```

Dándonos como resultado:

```
Me llamo Alex 
Mi Apellido es Fernández 
Tengo 31 años
```

#### Funciones con parámetros de entrada

Ahora vamos a ver las funciones con parámetros de entrada, que son iguales, pero al llamarlas habrá que mandarle las variables que necesite.

```
showMyInformation("Alex", "Fernández", 31)

func showMyInformation(_ name: String, _ lastName: String, _ age: Int){
    print("Me llamo \(name) \(lastName) y tengo \(age) años.")
}
```

Como podemos observar, tiene tres parámetros de entrada, la forma de declararlos es muy fácil: el **nombre** de la variable, seguida de **dos puntos** y el **tipo de variable**, **aquí si es obligatorio definir el tipo**.

#### Funciones con parámetros de salida

Para poder devolver un resultado siempre debemos tener en cuenta como en otros lenguajes que la única limitación es que solo se puede devolver un parámetro.

```
var result = add(firstNumber: 2, secondNumber: 8)
print(result)
    
func add(firstNumber: Int, secondNumber: Int) -> Int{
    return firstNumber + secondNumber
}
```

Tal como en el ejemplo anterior, añadimos los parámetros de entrada pero esta vez, al cerrar los paréntesis pondremos -> seguido del tipo de variable que debe devolver nuestra función. Luego la función hará todo lo que tenga que hacer y cuando tenga el resultado, lo devolveremos con la palabra clave **return**.

Si queremos evitar el uso del nombre de los parámetros, tendremos que declarar la función de la siguiente manera:

```
var result = add(2, 8)
print(result)
    
func add(_ firstNumber: Int, _ secondNumber: Int) -> Int{
    return firstNumber + secondNumber
}
```
### Paso 7 Instrucciones Condicionales

Estas instrucciones nos permiten realizar lógica en función del resultado de una variable o condición, en este primer apartado veremos las condiciones **if-else**.

#### La condición if

Como ya debes saber, es de las más habituales y realizará una función o varias si la condición que hemos generado es verdadera.

```
var result = add(3, 7)

if(result > 5){
	print("El resultado es mayor que 5")
}

func add(_ firstNumber: Int, _ secondNumber: Int) -> Int {
    return firstNumber + secondNumber
}
```

Simplemente añadimos la condición entre paréntesis. No solo podemos usar operadores como <,>, = sino que podemos comparar String a través del doble igual ==

```
var name = "Alex"

if(name == ("Alex")){
    print("Se llama Alex")
}
```

#### If-Else
Hay veces que necesitaremos más de un if, y por eso está la palabra clave **else** que actuará como segundo condicional.

```
var name = "Alex"

if(name == ("Alex")){
  print("Se llama Alex")
}else{
  print("No se llama Alex")
}
```

El funcionamiento es muy claro, si no pasa la condición, entonces entrará directo en el else, así por ejemplo no necesitamos realizar 2 if, sino solo uno comprobando si el nombre es igual y otro comprobando si es diferente.

#### Anidamiento
Aunque no es la mejor práctica y en lo general **no deberíamos abusar**, en determinadas ocasiones necesitamos más condiciones, y aunque podríamos recurrir a otras instrucciones, lo podemos hacer con if.

```
if(animal == "dog"){
	print("Es un perro")
}else if(animal == "cat"){
	print("Es un gato")
}else if(animal == "bird"){
	print("Es un pájaro")
}else{
	print("Es otro animal")
}
```

Aquí hemos realizado varios anidamientos y aunque funciones como ya dijimos no es la mejor práctica.

Para poder usar más de una condición a la vez gracias a los operadores **&&** **||**

```
//solo entrará si cumple ambas condiciones
if(animal == "dog" && raza == "labrador"){
	print("Es un perro de raza labrador")
}

//Entrará si es verdadera una de las condiciones
if(animal == "dog" || animal == "gato"){
	print("Es un perro o un gato")
}
```

Puedes utilizar if y let en conjunto para trabajar con valores que puede que no existan, estos valores pueden estar representados como **optionals**. Un valor opción puede contener algún valor o puede contener **nil** para indicar que el valor no existe. Para usarlo se escribe un signo de pregunta al final para marcarlo opcional, en el siguiente ejemplo lo podemos ver:

```
var optionalString: String? = "Hello"
print(optionalString == nil)
// Prints "false"

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
```

Otra manera de manejar los valores opcionales es proveer un valor default utilizando el operador **??**. Si el valor opcional no existe entonces el default será utilizado:

```
let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)”
```
### Paso 8 Switch en Swift

Para seguir trabajando con el control de flujo ahora veremos el **switch**. Este nos permite realizar una o varias acciones dependiendo del resultado recibido. También es posible realizarlo en el paso anterior con if-else anidados, pero no sería lo correcto. Esta sería la forma más óptima.

```
getMonth(2)

func getMonth(_ month : Int){
    switch month {
        case 1:
		    print("Enero")
        case 2: 
	        print("Febrero")
        case 3: 
	        print("Marzo")
        case 4: 
	        print("Abril")
        case 5:
	        print("Mayo")
        case 6: 
	        print("Junio")
        case 7: 
	        print("Julio")
        case 8: 
	        print("Agosto")
        case 9:
	        print("Septiembre")
        case 10:
	         print("Octubre")
        case 11:
	         print("Noviembre")
        case 12:
	         print("Diciembre")
        default: 
            print("No corresponde a ningún mes del año")
    }
}

```

Este ejemplo es muy sencillo, la función **getMonth** recibe un **Int** al cual se lo mandamos al **switch**, una vez ahí se comprobará todos los casos disponibles, aquí tenemos del 1 a 12. Si concuerda con algún valor automáticamente entrará por ahí y realizará la función oportuna, en este caso imprimir el mes.

Si por el contrario no encuentra ningún caso igual, entrará por el default. Dicho default es obligatorio.

La expresión **switch** no solo soporta números, sino que puede trabajar con textos y expresiones.

```
func getMonth(month : Int){
    switch month {
        case 1,2,3:
	        print("Primer trimestre del año")
        case 4,5,6: 
	        print("segundo trimestre del año")
        case 7,8,9: 
	        print("tercer trimestre del año")
        case 10,11,12: 
	        print("cuarto trimestre del año")
        default: 
	        print("month")
    }
}
```

En este siguiente ejemplo vemos como poder separar varios valores a través de comas.

Si son rangos más altos tenemos la posibilidad de usar **...** para trabajar con **arrays** y **ranges** (lo veremos en los siguientes pasos).

```
func getMonth(month : Int){
    switch month {
    case 1...6:
	    print("Primer semestre")
    case 7...12:
	    print("segundo semestre")
    default:
	    print("default")
    }
}
```

Con esto podemos comprobar si está entre una cantidad de números específicos (en este caso entre 1 y 6 y 7 y 12).
### Paso 9 Arrays en Swift

Los arrays o arreglos son secuencias de datos, del mismo tipo e identificados por un nombre común.  Para hacerlo más fácil de entender imaginemos que tenemos que almacenar los 7 días de la semana, podríamos crear 7 variables Strings o almacenarlas todas en un solo array.

```
var weekDays = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"]
```

Ahora que en la variable **weekDays** tenemos los días de la semana podremos acceder a cada uno de los valores. Esto lo haremos a través de su posición. Como sabes la posición tiene una cuenta inicial desde 0 hasta n-1 posiciones en nuestro arreglo.

```
var weekDays = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"]

print(weekDays[0])
print(weekDays[1])
print(weekDays[2])
print(weekDays[3])
print(weekDays[4])
print(weekDays[5])
print(weekDays[6])
```

Igualmente como ya sabes si nos excedemos a una posición que el arreglo no tiene, por ejemplo la 7, entonces nos daría una excepción al ejecutarse la aplicación, **Fatal error: Index out of range**, y es por ello por lo que al trabajar con arrays debemos tener bien claro el tamaño.

Otra forma de evitar ese tipo de problemas es mediante el uso del método **size** que nos devolverá el tamaño de dicho array.

```
var weekDays = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"]

print(weekDays[0])
print(weekDays[1])
print(weekDays[2])
print(weekDays[3])
print(weekDays[4])
print(weekDays[5])
print(weekDays[6])

if(weekDays.count >= 8){
	print(weekDays[7])
}else{
	print("no tiene más parámetros la array")
}
```

Como mencionamos, una de las limitantes de los array es que deben tener un tamaño fijo, sin embargo en Swift puedes inicializar un arreglo vacío de la siguiente manera y aunque si no tendrás acceso si el valor en la posición no existe, podrás añadir más valores. Esto podemos realizarlo a través de la función **set()**.

```
var weekDays = [String]() // var weekDays = [:]

weekDays.append("Mercredi") //Añade Mercredi

// Si deseas controlar el índice donde es insertado el objeto
weekDays.insert("Mercredi", at: 0)
```

Igualmente como el acceso usando propiedad para lectura, podemos usar el acceso mediante propiedades de la forma:

```
weekDays[1] = "Un martes" //Contenía Martes
weekDays[3] = "Viernes chiquito" //Contenía Jueves
```

**Nota: El valor que mandemos a la asignación debe ser del mismo tipo, por ejemplo este array es de Strings, por lo que no podremos pasar un Int.**

#### Recorriendo Arrays

Ya que sabemos interactuar con arrays ahora vamos a ver como podemos recorrerlas.

Para ello tenemos el bucle **for()**, pero ojo este for es diferente al de otros lenguajes de programación.

```
var weekDays = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"]

for weekDay in weekDays {
	print(weekDay)
}
```

A diferencia del primer código nos evitamos una línea por cada posición que es lo que buscamos.

El **for** necesita una variable, en este caso **weekDay** que irá teniendo el valor de cada una de las valores del array. Su funcionamiento es muy simple, si el arreglo de **weekDays** esta vacío no recorre el loop, en caso contrario entra a la función, hace lo que le pidamos y vuelve a iniciar, así hasta llegar a 6 que será la última posición del array.

Otra forma de explotar el **for** es obtener usando índice como el valor directamente, para ello se hace lo siguiente:

```
var weekDays = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"]

for i in 0..<weekDays.count {
	print("La posición \(i) contiene el valor \(weekDays[i])")
}
```

**NOTA**: Toma en cuenta que los for-loop en swift no se utilizan paréntesis

El resultado sería el siguiente:

```
La posición 0 contiene el valor Lunes 
La posición 1 contiene el valor Martes 
La posición 2 contiene el valor Miércoles 
La posición 3 contiene el valor Jueves 
La posición 4 contiene el valor Viernes 
La posición 5 contiene el valor Sábado 
La posición 6 contiene el valor Domingo
```

### Paso 10 Diccionarios en Swift

En el paso anterior hablamos de los arreglos, otro tipo de datos muy utilizado en Swift para almacenar diferentes tipos de datos o hacer conversiones de modelos son los diccionarios. 

Para inicializar un diccionario la sintaxis es de la siguiente manera
```
let interestingNumbers: [String: Int] = [:]
```
Es importante que identifiquemos desde un inicio los tipo de datos que se van a utilizar para las llaves y los valores. Los diccionarios son colecciones desordenadas, que utilizan las llaves para iterar en en ellos.

```
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)
```

En el ejemplo anterior mira como se utilizan los paréntesis en el for-loop en el caso de los diccionarios para aislar los nombre de las variables.

¿Te fijaste en el guión bajo que se encuentra después del primer paréntesis del for? Ese guión bajo es en caso de que no nos interese el valor de la llave y no lo vayamos a utilizar, en caso de que no, solo hay que cambiar el _ por el nombre de variable de nuestra preferencia

### Paso 11 Tuplas en Swift

Las tuplas valores múltiples en una sola variable. Los valores adentro de una tupla pueden ser de cualquier tipo y pueden no ser del mismo tipo.

En este ejemplo:
```
let http404error = (404, "Not Found")
```

Es una tupla que describe un HTTP status code. Puedes hacer múltiples combinaciones de diferentes tipos puedes tener por ejemplo (Int, Int, Int)

Para utilizar los valores de una tupla puedes usar la siguiente sintáxis
```
let (statusCode, statusMessage) = http404error

print("The status code is \(statusCode)")

print("The status message is \(statusMessage)")
```

Alternativamente, una tuple utiliza indices numéricos para acceder a cada uno de los valores por lo que también puedes usar la siguiente sintáxis:
```
print("The status code is \(http404Error.0)")
// Prints "The status code is 404"
print("The status message is \(http404Error.1)")
// Prints "The status message is Not Found”
```

Y también puedes nombrar los elementos de una tupla para usarlos de la siguiente manera.

```
let http200Status = (statusCode: 200, description: "OK")

print("The status code is \(http200Status.statusCode)")
// Prints "The status code is 200"
print("The status message is \(http200Status.description)")
// Prints "The status message is OK”
```
### Ejercicios

Ya que hemos revisado los conceptos básicos de Swift paso a paso, es momento de que empieces con uno de los elementos fundamentales de este curso y es a **hacerte dueño de tu aprendizaje.**

A continuación te dejaré los [Mobile Challenges](https://github.com/igorwojda/kotlin-coding-challenges) que nos son más que problemas para seguir reforzando el aprendizaje de Swift.

Esto te podrá llevar a trabajar más en tu lógica de programación o en su defecto buscar algunas librerías adicionales para trabajar el lenguaje y hacerte la vida más simple.

De acuerdo a tu experiencia actual implementa algunos de estos problemas para terminar de reforzar los conceptos vistos, si te es necesario práctica de tarea.

**Recuerda que este módulo no cuenta con tareas a entregar, pero en el examen final se espera que el alumno cumpla con los conocimientos básicos del lenguaje, así como las evidencias de los mismos para el desarrollo de competencias.**

**Nota: Entre más complejo sea el problema resuelto esto puede beneficiarte en las evidencias de tus competencias de desarrollo.**