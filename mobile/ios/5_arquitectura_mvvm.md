# Arquitectura MVVM y Clean Architecture

## Objetivo

En este laboratorio aprenderemos sobre arquitectura de software en iOS.

Para este laboratorio vamos a desarrollar un Pokedex, que es una unidad de información para el mundo Pokemon. Esta aplicación nos mostrara los datos de cada criatura y desde ahí podremos generar un detalle.

Esta aplicación seguirá evolucionando conforme avancemos.

**Nota: Al final de este laboratorio te recomiendo que generes una copia para que en los próximos tengas un punto de comparación sobre lo que se va avanzando.

## Instrucciones

Sigue los pasos descritos en la siguiente práctica, si tienes algún problema no olvides que tus profesores están para apoyarte.

## API
Para este laboratorio estaremos utilizando el API de [PokeAPI](https://pokeapi.co/) los endpoints con los que vamos a comenzar son los siguientes:

```
GET https://pokeapi.co/api/v2/pokemon/?limit=1279
GET https://pokeapi.co/api/v2/pokemon/{number_pokemon}/
```

## Laboratorio
### Paso 1 Introducción a MVVM

Hace algunos años el uso de Arquitecturas en Android no era algo común de ver, y quedaba más del lado de los desarrolladores, viéndolo más como un lujo que como una necesidad.

En aquel entonces las aplicaciones eran más "simples" y si bien nunca ha sido la mejor práctica solo los desarrolladores veteranos explotaban estas capacidades usando los patrones comunes de desarrollo web como una arquitectura MVC con la cual deberías estar familiarizado. Te dejaré aquí un [link](https://www.swiftbeta.com/arquitecturas-en-swift/#arquitectura-model-view-controller) con recursos sobre diferentes tutoriales sobre Arquitectura en Swift para que veas que existen muchas formas de implementarlo.

Ahora bien, antes de mencionar la teoría del MVVM, por que es la que estamos seleccionando habiendo tantas posibles arquitecturas en el mundo de desarrollo. En primera instancia por que es la arquitectura oficial de Google. Hoy en día no podemos pensar de un proyecto básico en Android si no hablamos mínimo de el uso de una arquitectura MVVM. Segundo por que Google ya nos da muchas cosas hechas para hacer más fácil la implementación en lugar de otras arquitecturas donde los patrones tenemos que construirlos nosotros mismos. Por último esta arquitectura esta orientada a alcanzar buenos niveles de calidad y que el código en si mismo sea testeable uno de los principios fundamentales de la calidad.

Como último paso puedo mencionarte con mucha seguridad que de lejos MVVM sea la mejor arquitectura del mundo, y tampoco es única a Android, es más todas estas arquitecturas son muy viejas comprobando que las bases de la computación se mantienen hasta hoy en día. Si bien MVVM tiene sus pro también tiene sus contras y como todo en la comunidad hay quienes están a favor y en contra.

Como siempre mi recomendación es aprende, luego juzga. Una forma de hacer algo mejor es entender las bases de lo que ya existe, quien sabe tal vez a partir de esto puedas crear mejores prácticas que hagan innovación en el mundo de desarrollo de software.

#### ¿Qué es MVVM?

El **Model-View-ViewModel** ó **Modelo-Vista-Modelo de Vista** es una arquitectura donde vamos a hacer uso de 3 módulos que si tomamos como referencia el Modelo-Vista-Controlador **MVC** veremos que son en cierto modo similares. La diferencia vendrá entre el **Controlador** y el **View Model**.

**Model**
Representa la parte de datos, es decir, cuando recuperamos de una base de datos o de un servicio web, toda esa información la almacenaremos en el modelo de datos.

En nuestro laboratorio anterior esta parte es abarcada por los **modelos**, el archivo de configuración de Alamofire **PokemonAPIProtocol** y las implementaciones de **PokemonAPIService** así como de el **PokemonRepository**

**View**
Es la parte de la UI, los XML, las activities y los fragments. Estos actuarán como siempre, ejecutando acciones por ejemplo al pulsar un botón pero no realizarán las acciones, se suscribirán all **View Model** a través de un Patrón de Diseño **Observer** y este les dirá cuando y como pintar.

En nuestro laboratorio lo que tenemos es el **ContentView**.

**ViewModel**
Este sería la conexión entre el modelo y la vista y como mencioné sería el equivalente al Controlador en una arquitectura **MVC**, la diferencia con este es como se comporta ya que las **Vistas** se suscriben usando el **Observer** as sus respectivos **ViewModels** y estos al percatarse de que el modelo ha sido modificado lo notificarán a la vista.

En nuestro laboratorio este módulo o esta capa aún no existe y aquí es donde vamos a necesitar separar del **ContentView** la abstracción de datos para poder llevarlo a cabo.

#### ¿Cómo funciona MVVM?
Seguramente te hayas quedado más confundido con la explicación anterior que antes de empezar este laboratorio, pero vamos a unirlo todo para que quede más claro.

![lab_6](/mobile/ios/5_mvvm/arquitectur_mvvm.png)

Vamos a usar nuestro laboratorio de referencia.

Ya mencionamos que nuestros **modelos** son nuestros modelos de datos. Nuestra **ContentView** es la encargada de mostrar una lista de cada uno de los Pokemon. Si añadiéramos un campo de búsqueda se deberían filtrar está lista según el texto introducido por el usuario.

Para hacer esto con MVVM es muy sencillo, lo primero que haríamos es que nuestra **ContentView** se suscriba a un **ViewModel** propio y usando el patrón de **Observer** que para efectos de Swift se le conoce como **ObservedObject**, que no es otra cosa que conectarse y esperar un cambio en el **ViewModel** para que el **ContentView** se entere. Esto es lo más importante ya que **ContentView** solo pintará los cambios cuando el **ViewModel** lo notifique.

También el **ContentView** deberá controlar cuando se escribirá el texto para avisar al **ViewModel** que algo empieza a detonar un posible cambio en el **ViewModel**. Aquí termina la parte de la **Vista**, solo pinta lo que le diga el **ViewModel** y cuando se produce un evento en la UI lo notifica.

Nuestro **ViewModel** acaba de recibir que ha habido un evento en la UI, por ejemplo en el campo de búsqueda alguien escribió **pikachu**, por lo que tendrá que modificar el modelo de la lista de datos. Para ello llamará al **Modelo** que irá a Alamofire, a Core data (BD local) o a cualquier tipo de acceso que nos devuelva datos (en este caso un nuevo pokemon) y se lo devolverá al **ViewModel** que a su vez notificará a **ContentView** el cambio del contenido para que se actualice.

Esto es todo, parece complicado con toda la teoría así que vamos a verlo en práctica. La ventaja que tenemos es que la mayor parte del código ya esta hecho solo necesitamos estructurar nuestros archivos y aplicar el ViewModel.

Al final de esta práctica el resultado final que tendremos no debe modificar ninguna función actual de la aplicación.

Al estado actual del proyecto podemos llamarle un **iOS Vanilla** y el resultado final de esta parte será un **iOS MVVM** completo.

### Paso 2 Estructurando el proyecto

![lab_6](/mobile/ios/5_mvvm/estructura_actual.png)

Como mencionamos ya contamos con un gran avance de la arquitectura solo que de momento no es visible. Vamos a estructurar el proyecto para que podamos visualizar que nos hace falta.

Estructurar un proyecto no es nada más que agregar nuevos **groups** como hicimos con la carpeta de **modelos**. Un proyecto de iOS puede agregar tantos nuevos **groups** como sea necesario.

El nombre que estaremos asignando va ligado a la arquitectura pero algo importante a mencionar es que podemos tener la arquitectura y crear nuestra propia organización con nombres y paquetes, no es limitativo en ese sentido, así que si tienes un nombre que te haga más sentido que solo **Model-View-ViewModel** por todas las formas te recomiendo utilizarlo.

#### Modelos

Como puedes ver ya se había avanzado con este apartado, pues ya se creo el group de Modelos donde se encuentran nuestros struct:

- Pokedex
- Pokemon
- Perfil
- Sprite
- PokemonBase

Si desearás tener más visibilidad de cada modelo que existe en tu app podrías tenerlos por separado.

Vamos a arrastrar tres archivos más a esta carpeta

- PokemonRepository
- PokemonAPIProtocol
- PokemonAPIService

![lab_6](/mobile/ios/5_mvvm/estructura_modelos.png)

#### Views

Ya que tenemos nuestros modelos en su sitio, ahora vamos a crear el **group** que se llamará **Views** y en este vamos a arrastrar el **ContentView**.

![lab_6](/mobile/ios/5_mvvm/estructura_views.png)

Y listo, con esto ya tenemos ordenado nuestro proyecto con lo que hemos trabajado hasta ahora. Lo importante de aquí en adelante es crear los archivos en sus correspondientes.

### Paso 3 Trabajando con el ViewModel

Ya que tenemos nuestro group es momento de crear el archivo, y como lo hemos hecho con los anteriores vamos a crear un archivo **Swift** y lo normal es que se llame **ContentViewModel**.

![lab_6](/mobile/ios/5_mvvm/estructura_viewmodel.png)

Empecemos con el código. Como siempre al crear una clase especial debemos recordar aplicar los **protocolos** correspondientes, y en este caso vamos a utilizar **ObservableObject**.

```
import Foundation

class ContentViewModel: ObservableObject {
    
}
```
¿Qué es? Como te mencioné anteriormente el patrón de diseño **observer** es clave para la aquritectura. Un **ObservableObject** lo que hace es emitir los cambios de sus valores

Lo siguiente que vamos a realizar es declarar una propiedad **@Published**, que no es más que un tipo de datos que se utiliza con los **ObservableObject** para que de igual manera emitan notificaciones de sus cambios a nuestro **ContentView** 

```
import Foundation

class ContentViewModel: ObservableObject {
    @Published var pokemonList = [PokemonBase]()
}
```

Por último vamos a añadir un método que a estas alturas ya debes conocer el nombre por unicidad. **getPokemonList()** y aquí un pequeño paréntesis ya que este método en teoría es el mismo al que tenemos dentro del **ContentView** al menos en esencia, pero vamos a adecuarlo para que trabaje con el **ViewModel**

```
fun getPokemonList() async {  
      
}
```

La siguiente parte es el código que ya teníamos del **MainActivity** excepto que ahora no seteamos el arreglo de, sino que usamos nuestra variable **pokemonList** del **ViewModel** para avisar que tenemos cambios en el modelo y que alguien que este escuchando del otro lado realice sus funciones.

```
func getPokemonList() async {
    let pokemonRepository = PokemonRepository()
    let result = await pokemonRepository.getPokemonList(limit: 1279)
    
    for i in 0...result!.results.count-1 {
        let numberPokemon = Int(result!.results[i].url.split(separator: "/")[5])!
        
        let infoPokemon = await pokemonRepository.getPokemonInfo(numberPokemon: Int(String(numberPokemon))!)
        let tempPokemon = PokemonBase(id: Int(String(numberPokemon))!, pokemon: result!.results[i], perfil: infoPokemon)
        
        self.pokemonList.append(tempPokemon)
    }
}
```

¿Te fijaste que el cambio no fue trascendental? Pero a nivel arquitectónico le hemos quitado a la vista código que no debería importarle, nuestra vista siempre debe estar preocupada solo por renderizar los datos. 

Muy bien ya tenemos configurado nuestro **ViewModel** ahora vamos a proceder a modificar nuestro **ContentView** para que se comunique con el **ViewModel**

### Paso 4 MVVM - View

Abriendo nuesto **ContentView** vamos a declarar la siguiente variable global

```
@StateObject var contentViewModel = ContentViewModel()
```

Esta es una declaración diferente que incluso puede que no hayas visto nunca, mediante el uso del property wrapper **@StateObject** podemos instanciar el uso de **ObservableObject**. ¿Recuerdas @State?, básicamente es lo mismo pero ahora sobre un objeto más que una propiedad.

Estimados desarrolladores, favor de eliminar nuestra propiedad que teniamos inicializada de pokemonList ya que no la vamos a utilizar, ni hoy ni en un futuro.

Ahora dentro del **onAppear()** vamos a sustituir la llamada a **getPokemonList()** por lo siguiente:

```
.onAppear {
    Task {
        await contentViewModel.getPokemonList()
    }
}
```

Oops! Debería marcarte un error si borraste la variable de pokemonList con anterioridad si no lo has hecho por favor hazlo ahora!

Para arreglar el error, es muy sencillo vamos a cambiar la variable que recibe nuestra List por lo siguiente: 

Para **initializeObservers()** vamos a tener lo siguiente

```
List(contentViewModel.pokemonList) 
```

Para que nuestro resultado se cargue en la Lista. Otra cosita, como nuestra vista ya no se encarga de los datos borra el contenido que esta dentro de los previews, en caso de que hayas cargado los datos dummy.

Si ejecutamos la aplicación todo debería seguir funcionando y nuestra lista debe visualizar los Pokemon con su nombre y respectiva imagen.

Antes que cualquier otra cosa pase elimina el método **getPokemonList()** del **ContentView** pues ya no lo vamos a utilizar. Es importante tener nuestro código limpio y óptimo para no confundirnos a nosotros mismo o a los miembros de nuestro equipo.

**Nota: Recuerda que en las llamadas al API asumimos que todo se hace correctamente, pero en la realidad debemos verificar todos los posibles casos de error como los son los nulos, los vacíos, etc. Aquí depende de en que capa quieras trabajarlo, una buena práctica es hacerlo desde el Modelo, para que el ViewModel ya reciba la información correcta y el View no corra riesgo de fallar, a menos que el error sea algo que se deba notificar al usuario.**

Felicidades, usted tiene un proyecto con arquitectura oficial que sigue las buenas prácticas de desarrollo iOS. Pero espera un minuto vamos a ver un añadido más a la arquitectura, y quizás puedas empezar tu proyecto desde aquí, pero cree en mí que este añadido le va a dar mas control a tu proyecto y un montón de buenas prácticas aunque como contra es que vamos a crear más archivos y sobre todo más **groups**.

### Paso 5 Introducción a CLEAN Architecture

Quizás estés un poco confundido, normalmente un proyecto debería tener una arquitectura de software, pero entonces ¿por qué necesitamos otra?

Si bien las arquitecturas **MVC** **MVP** **MVVM** son algunas de las formas de organizar la estructura en que programamos nuestro sistema. Estas arquitecturas están orientadas a las buenas prácticas y al ciclo de desarrollo de software en general.

Esta nueva arquitectura nos va a traer beneficios de estructura, pero algo interesante que tienes es que nos permite tener una mejor implementación hacia Administración de Proyectos. Y lo veras a través de la capa de Casos de Uso, Historias de Usuario o Requerimientos.

#### ¿Qué es CLEAN Architecture?

Como ya mencionamos a diferencia de **MVC MVP MVVM** que son los patrones de arquitectura al menos conocidos de Android, **Clean architecture** es una meta arquitectura que podemos integrar en cualquiera de nuestra aplicaciones en conjunto con las anteriores mencionadas.

![lab_6](/mobile/labs/6_arquitectura_mvvm/6_011.png)

No hay una forma correcta de aplicar esta teoría y aquí es donde cada uno **tiene que entenderlo y aplicarlo como mejor le convenga**. Los beneficios que nos aporta es definir el proyecto en varias capas, es decir, lo de afuera sabe lo que hay dentro pero lo de adentro no sabe lo que tiene por fuera.

Esta abstracción total nos permite ser pragmáticos en el sentido de que si esa aplicación la queremos pasar a iOS por ejemplo solo hay que rehacer la capa exterior (obviamente la interior hay que pasarla a swift pero el funcionamiento y la lógica de negocio sería igual).

**Framework**

Esta capa será la que contenga todo el código relacionado con iOS, el SDK y sus librerías. Con lo que hemos hecho hasta ahora quienes se involucran en esta parte son los **Views** y los **ViewModels**.

**Domain**

La capa de dominio es donde hay un poco más de discrepancias entre cada teoría y como lo implementa cada uno, en esencia es la capa que abstrae las reglas de negocio de la aplicación, pero si analizamos un poco que es una regla de negocio nos vamos a dar cuenta que son las funciones que hacemos en el proyecto.

Dicho de otra forma, una función y dependiendo de la metodología que estemos siguiendo de administración de proyectos la podemos definir como casos de uso o como historias de usuario. Pero como hemos visto una administración de proyectos puede utilizar ambas formas, y como estamos hablando ya de la implementación puede que tengamos la misma manera.

Vamos a aplicar entonces una lógica similar a POO donde vamos a abstraer el concepto de Caso de Uso e Historia de Usuario en sus formas más esenciales y esto lo podemos traducir en un Requerimiento o **Requirement**.

Desde mi perspectiva podemos definir cada Requerimiento en esta capa y cuando se haga su implementación podemos ahora si tratarlo como Caso de Uso o Historia de Usuario.

**Data**

Esta capa final contiene la abstracción de conexión de datos, para nuestro laboratorio es la que más está estructurada pues sigue siendo la que contiene los Modelos, pero ojo en esta parte los Modelos también suelen ser llamados Entitites. De hecho si utilizaramos la BD local de iOS conocida como Core Data, si bien define sus **modelos** en concepto los define como **Entities** y no como **Models**, es importante que sepas esto pues puedes encontrarte proyectos con uno o ambos conceptos y debes poder identificarlos correctamente.

Además pensemos en aplicaciones complejas que utilizan tanto la BD Local como una conexión API para conectarse a una BD en la nube, toda esta abstracción viene en esta capa y quien es el encargado de mediar toda esta comunicación no es nada más ni nada menos que el **Repository** por eso desde el inicio se definió como un patrón de diseño. Pero ya entraremos en detalle más adelante.

### Paso 6 Configuraciones CLEAN Architecture

Esta primer parte es bastante sencilla pues es crear las carpetas necesarias e igual que al incorporar **MVVM** generar la estructura del proyecto.

Para comenzar vamos a crear 3 **groups** en nuestro proyecto que serán **framework** **data** y **domain**.

![lab_6](/mobile/ios/5_mvvm/clean_uno.png)

#### Framework

Para empezar con este **group** recordemos que incluye todo lo relacionado con UI y con el Framework de iOS. Por lo que debemos arrastrar aquí el **group** de **Views** y el de **Viewmodels**.

![lab_6](/mobile/ios/5_mvvm/clean_framework.png)

#### Data

Para este **group** vamos a mover tal cual nuestra carpeta **Modelos** adentro.

![lab_6](/mobile/ios/5_mvvm/clean_data.png)

Para continuar vamos a tomar **PokemonRepository** y lo vamos a colocar directamente en el **group** de **Data**, esto es sacarlo del package **Modelo**, esto lo hacemos por que si recuerdas te mencioné que el **Repository** es el encargado de mediar entre los diferentes medios que tenemos para comunicarnos con los datos, para este laboratorio solo tenemos conexión con APIs, pero si tuvieramos la BD local, necesitariamos un **group** para ello entonces el **Repository** conecta entra el **group** de la BD local y el de la conexión con el API o los n tipo de conexiones que tenga la aplicación pues no esta limitado a un número concreto, depende de cada aplicación.

También lo siguiente que vamos a hacer, copiar el contenido de nuestro PokemonAPIProtocol dentro de PokemonRepository para facilitar la lectura y creación de archivos, esto es lo más comun es Swift, ya que da una mejor trazabilidad del protocolo. Al finalizar el traspaso tu código de PokemonRepository debe quedar de la siguiente manera:

```
import Foundation

struct Api {
    static let base = "https://pokeapi.co/api/v2/"
    
    struct routes {
        static let pokemon = "/pokemon"
    }
}

protocol PokemonAPIProtocol {
    // https://pokeapi.co/api/v2/pokemon/?limit=1279
    func getPokemonList(limit: Int) async -> Pokedex?
    // https://pokeapi.co/api/v2/pokemon/{number_pokemon}/
    func getPokemonInfo(numberPokemon:Int) async -> Perfil?
}

class PokemonRepository: PokemonAPIProtocol {
    let nservice: NetworkAPIService

    init(nservice: NetworkAPIService = NetworkAPIService.shared) {
        self.nservice = nservice
    }

    func getPokemonList(limit: Int) async -> Pokedex? {
        return await nservice.getPokedex(url: URL(string:"\(Api.base)\(Api.routes.pokemon)")!, limit: limit)
    }
    
    func getPokemonInfo(numberPokemon: Int) async -> Perfil? {
        return await nservice.getPokemonInfo(url: URL(string:"\(Api.base)\(Api.routes.pokemon)/\(numberPokemon)")!)
    }
}

```

No olvides borrar el archivo PokemonAPIProtocol.

Tu estructura de archivos queda así:

![lab_6](/mobile/ios/5_mvvm/clean_repository.png)

Siguiendo con esta misma idea de la separación de objetos de la conexión con el API y la conexión de BD local sería bueno igualmente separarlo, aquí no es un nombre fijo, puedes colocar el que te de mayor entendimiento, en mi caso crearé un **group** llamado **Network** dentro del **group** **data**.

Así como está este nuevo **group** voy a tomar el archivo
**PokemonAPIService**

Y tal cual los arrastraré al **group** Network.

![lab_6](/mobile/ios/5_mvvm/clean_network.png)

Y listo con esto ya tenemos estructurada nuestra capa de **Data**, observa que inicialmente teníamos todo en **Modelos** y esto siguiendo el **MVVM** nos sirve para saber que todo lo que está en los modelos es parte de la conexión en este caso con la BD. Pero ahora con esta nueva estructura nos damos cuenta que es un poco más complejo que eso puesto que al poder tener BD locales y BD en la nube, puedo tener tipos diferentes y cada una de estas manejan sus propios tipos de Modelos o como te dije en el caso de la BD local se llaman **Entities**.

Otra cosa es que dentro de **Network** si hiciéramos el mismo ejercicio para la BD local esta tendría sus propios archivos de configuración y ya no dependerían de si son igual o no que Alamofire, que por lógica nos lleva a que son diferentes. Lo mismo pasa con el **PokemonAPIService** aquí estamos conectando el API solamente y son configuraciones propias del API.

El objetivo de hacer todo esto es hacer que los archivos y sus funciones tengan pocas líneas de código para poder hacer testing adecuado y que cuando alguien intente modificar algo pueda hacerlo fácilmente identificando la estructura de archivos del proyecto.

Ya tenemos nuestra capa de **Data** terminada es hora de trabajar con la nueva de CLEAN architecture, la capa **Domain**

#### Domain

Como vimos en la teoría, la capa de **Domain** es la que secciona las reglas de negocio o funciones de la aplicación para realizar ciertas tareas, a veces es tan simple como 1 función, en otros casos pueden ser procesos complejos que lleven a varias funciones y varios algoritmos, la idea es la misma, poder abstraer toda esta complejidad en funciones simples que podamos testear.

Otro motivo del por que tenemos esta capa, es que de lo contrario estos procesos se le delegarían al **ViewModel** y esto no debería de ser por que de por sí el **ViewModel** se encarga de conectar entre datos e interfaz, entonces cargar la lógica de negocio nos llevaría a cargar mucho estos archivos que de por sí son únicos por vista y serían muy largos y complejos de leer.

Recuerda tus archivos **Controladores** de **MVC** que tan largos se hacían por esta misma razón.

Dentro de nuestro **group** de **Domain** vamos a crear 2 nuevos archivo tipo **swift** que se llamen **PokemonListRequirement** y **PokemonInfoRequirement**

![lab_6](/mobile/ios/5_mvvm/clean_domain.png)

De entrada puedes empezar a ver que vamos a separar nuestras 2 funciones principales de la aplicación por historia de usuario, y esto tiene la lógica si desde nuestra administración de proyecto declaramos estas historias de Usuario.

- Como usuario quiero ver la lista de Pokemon para poder seleccionar y ver el detalle de alguno
- Como usuario quiero tener la información de 1 Pokemon para ver todo su detalle

En nuestra aplicación de momento no tenemos visualmente el detalle de 1 Pokemon, pero si quisiéramos implementarlo solo necesitaríamos crear la interfaz al respecto, toda la lógica de obtener la información del API ya vendría dada desde el requerimiento. Si hablamos que todo esto ya debería estar testeado y aprobado entonces añadir esa funcionalidad sería muy rápido y con un riesgo a errores muy bajo, aumentando el nivel de calidad de nuestra aplicación.

Entonces, para empezar con el código, usaremos el archivo de **PokemonListRequirement**

Al igual que hicimos con nuestro repositorio, en caso de que necesitemos hacer pruebas unitarias, lo mejor, es usar los protocolos, por lo que vamos a hacerlo de la siguiente manera.

```
import Foundation

protocol PokemonListRequirementProtocol {
    func getPokemonList(limit: Int) async -> Pokedex?
}
```

Perfecto, ahora antes de continuar recuerdas el **singleton**, como ya lo sabes utilizar implementalo en el repositorio para que puedas acceder a el desde el requerimiento...

¿Cómo?

Agrega esta línea de código a PokemonRepository 
```
static let shared = PokemonRepository()
```

Ahora en tu PokemonListRequirement no olvides agregar el método para poder inicializar la instancia con el singleton que acabos de crear, quedando tu código de la siguiente manera:

```
class PokemonListRequirement: PokemonListRequirementProtocol {
    let dataRepository: PokemonRepository

    init(dataRepository: PokemonRepository = PokemonRepository.shared) {
        self.dataRepository = dataRepository
    }
}
```

Por último este archivo solo hará la llamada al **Repository** justo como lo hace el **ViewModel** actualmente, por lo que podemos copiar parcialmente su código, quedando algo como lo siguiente.

```

class PokemonListRequirement: PokemonListRequirementProtocol {
    let dataRepository: PokemonRepository

    init(dataRepository: PokemonRepository = PokemonRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getPokemonList(limit: Int) async -> Pokedex? {
        return await dataRepository.getPokemonList(limit: limit)
    }
}
```

Como reto intenta hacer la implementación de **PokemonInfoRequirement** y revisa con el resultado que sea el adecuado. 

Vamos intentalo!!!!

```
protocol PokemonInfoRequirementProtocol {
    func getPokemonInfo(numberPokemon:Int) async -> Perfil?
}

class PokemonInfoRequirement: PokemonInfoRequirementProtocol {
    let dataRepository: PokemonRepository

    init(dataRepository: PokemonRepository = PokemonRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getPokemonInfo(numberPokemon:Int) async -> Perfil? {
        return await dataRepository.getPokemonInfo(numberPokemon: numberPokemon)
    }
}
```

Y eso es todo para nuestra capa de **Domain**, ahora con todos los movimientos que hemos hecho nuestra capa de **Framework** necesita actualizarse,

#### Framework

De entrada, empezaremos con la capa de **Viewmodel** con el archivo **ContentViewModel**. Al tener ahora nuestros archivos de **Requirement** necesitamos hacer su llamada por lo que vamos a declarar la siguiente variable global.

Para eso vamos a volver a utilizar nuestras buenas prácticas y crea los singleton para los **Requirement**

Bien!, ya que los tienes vamos a utilizarlos en nuestro **ContentViewModel**, agrega el siguiente código debajo de nuestra variable **@Published**

```
var pokemonListRequirement: PokemonListRequirementProtocol
var pokemonInfoRequirement: PokemonInfoRequirementProtocol

init(pokemonListRequirement: PokemonListRequirementProtocol = PokemonListRequirement.shared,
        pokemonInfoRequirement: PokemonInfoRequirementProtocol = PokemonInfoRequirement.shared) {
    self.pokemonListRequirement = pokemonListRequirement
    self.pokemonInfoRequirement = pokemonInfoRequirement
}
```

Lo que estamos haciendo es inicializar nuestro **ContentViewModel** con los requerimientos default, fijate bien que aunque las variables son de tipo Protocol, estamos utilizando las clases de **Requirement** directamente.

Y vamos a actualizar la función **getPokemonList()** a lo siguiente

```
fun getPokemonList(){  
    let result = await pokemonListRequirement.getPokemonList(limit: 1279)
    
    for i in 0...result!.results.count-1 {
        let numberPokemon = Int(result!.results[i].url.split(separator: "/")[5])!
        
        let infoPokemon = await pokemonInfoRequirement.getPokemonInfo(numberPokemon: Int(String(numberPokemon))!)
        let tempPokemon = PokemonBase(id: Int(String(numberPokemon))!, pokemon: result!.results[i], perfil: infoPokemon)
        
        self.pokemonList.append(tempPokemon)
    }
}
```

Con esto nuestros puntos de interfaz ya están conectados al menos a los **Requirement** correspondientes, si aún te marca errores el **ContentView** realiza los cambios necesarios, pero fuera de ello es el único archivo que no debe tener modificaciones. 
Revisa que cualquier otro archivo no te marque error que no hayamos modificado como el **PokemonAPIService**

```
import Foundation
import Alamofire

class NetworkAPIService {
    static let shared = NetworkAPIService()
    
    func getPokedex(url: URL, limit: Int) async -> Pokedex? {
        let parameters : Parameters = [
            "limit" : limit
        ]
        
        let taskRequest = AF.request(url, method: .get, parameters: parameters).validate()

        let response = await taskRequest.serializingData().response

        switch response.result {
        case .success(let data):
            do {
                return try JSONDecoder().decode(Pokedex.self, from: data)
            } catch {
                return nil
            }
        case let .failure(error):
            debugPrint(error.localizedDescription)
            return nil
        }
    }
    
    func getPokemonInfo(url: URL) async -> Perfil? {
        let taskRequest = AF.request(url, method: .get).validate()

        let response = await taskRequest.serializingData().response

        switch response.result {
        case .success(let data):
            do {
                return try JSONDecoder().decode(Perfil.self, from: data)
            } catch {
                return nil
            }
        case let .failure(error):
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}
```

Excelente, por ahora tu aplicación debería de correr sin problemas, sin embargo, si te fijas bien cuando lo compiles y los corres saldrá un warning morado.

![lab_6](/mobile/ios/5_mvvm/warning_purple.png)

Bien el warning completo es el siguiente:
> Publishing changes from background threads is not allowed; make sure to publish values from the main thread (via operators like receive(on:)) on model updates.

Aunque si nos deja compilar el proyecto, si no arreglamos esto desde un inicio después nos dará dolor de cabeza si tenemos otros threads nuestra aplicación va a tronar. 

Se arregla muy sencillo vamos a utilizar el decorador **@MainActor**, este decorador es un singleton del sistema operativo que es equivalente a que el método al que se lo asignen corran en el hilo principal (MainQueue), es la similitud a usar el siguiente código. 

```
DispatchQueue.main.async {

}
```

Tenlo en cuenta por si llegas a verlo en otros ejemplos o tutoriales.

![lab_6](/mobile/ios/5_mvvm/main_actor.png)

Ahora si llego la hora más importante de estos últimos 3 laboratorios, ejecuta tu aplicación. Si seguiste los pasos hasta este punto no deberías de tener errores y el resultado pues ya lo conoces.

![lab_6](/mobile/ios/5_mvvm/resultado_final.png)

Con esto tenemos un proyecto con arquitectura de software MVVM y meta arquitectura CLEAN, lo cual nos da que el proyecto sea óptimo, facilmente testeable y fácil de leer en sus métodos así como fácilmente replicable a otras plataformas como iOS.

El único downside es la cantidad de archivos que hemos generado solo para mostrar una pequeña lista.

![lab_6](/mobile/ios/5_mvvm/clean_mvvm.png)

Pero recuerda que hoy en día las aplicaciones no son lo que eran antes, los usuarios buscan cosas más complejas en cuestión de funcionalidad, las aplicaciones tradicionales van muriendo poco a poco justo por estas razones. Es tu deber estar al día con todos estos cambios.

Otro punto importante que espero te hayas dado cuenta hasta este punto, hemos potenciado nuestra aplicación de iOS a lo más actual, sin haber utilizado sintaxis muy compleja en cuestión de Swift, en general así es, si bien puedes implementar todo lo ofrecido por el lenguaje, un desarrollador inicial iOS no necesita conocer todo el lenguaje para poder realizar aplicaciones poderosas, ese es un plus que se va ganando con la experiencia realizando aplicaciones.

Bienvenido al desarrollo iOS.