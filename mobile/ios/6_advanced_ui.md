# Diseño UI Avanzado

## Objetivo

En este laboratorio aprenderemos sobre la navegación entre Views, el uso de patrón de diseño **Coordinator**, persistencia de datos local con **UserDefaults** y un poco sobre reglas de Apple.

Para este laboratorio vamos a continuar el desarrollo del Pokedex que hemos venido realizando hasta ahora.

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
### Paso 1 Preparando los casos de Uso

Hasta ahora nos hemos centrado mucho en el desarrollo de la arquitectura de nuestro pequeño proyecto, la funcionalidad básica nos permite visualizar la lista de todos los Pokemon, pero ya va siendo hora de incrementar el alcance y hacer mejor la experiencia de usuario y de interfaz para quien la vaya a utilizar.

Hasta ahora solo hemos definido el **ContentView** y como ya debes saber a estas alturas es la **Vista** de nuestra aplicación, pero una aplicación compleja puede no tener solo 1 vista, al contrario se compone de varias vistas.

Como mencionamos en el laboratorio del **Lists** todas las vistas siguen el concepto de **Lista-Detalle** según como interactúan en la aplicación, nuestro **View** es una **List** pues no contiene una interfaz compleja pero se enfoca en todos los cambios del **List** que empiezan desde llamar al API hasta dibujarlo, es más todo lo que hemos hecho ha sido derivado de ello incluyendo el **MVVM** y la **CLEAN Architecture**.

Ahora vamos a empezar creando nuevas vistas, pero antes de hacerlo vamos a definir algunas historias de usuario que nos permitan enfocar lo que queremos hacer puesto que ya tenemos toda la arquitectura necesaria para desarrollar nuestro proyecto.

- Como usuario al entrar a la aplicación quiero iniciar sesión con mi correo antes de usar la aplicación para que mi sesión quede guardada.
- Como usuario quiero poder elegir entre la lista del Pokedex o poder ver mi perfil.
- Como usuario quiero ver el detalle de un Pokemon para ver más información del mismo.
- Como usuario quiero cerrar sesión para borrar mis datos personales del dispositivo.

Los pasos que realizaremos en este laboratorio son enfocados a estas historias de usuario, pero dentro vienen los conceptos de todo lo que necesitamos del laboratorio que son:

- Persistencia local
- Navegación entre vistas
- Alertas

### Paso 2 Como usuario al entrar a la aplicación quiero iniciar sesión con mi correo antes de usar la aplicación para que mi sesión quede guardada.

Esta historia de usuario nos lleva directamente a realizar un sencillo un login que contenga un campo de texto para el correo electrónico, sin embargo, lo que vemos muy común que se hace en muchas aplicaciones es que la sesión se mantenga guardada, es decir, que el usuario no se tenga que loguear una y otra vez.

Vamos a comenzar entonces, dentro de nuestro proyecto del Pokedex, vamos a crear un nuevo archivo de interfaz que será un **SwiftUI View** que se llame **LoginView**, como ya lo sabes este archivo debe ir en el **group** de **Framework->Views**

![lab_7](/mobile/ios/6_advanceui/swiftui_view.png)

Bien, vamos a crear un login muy sencillo para cumplir con la historia de usuario, lo indispensable para nuestro ejercicio es agregar un campo de texto para el correo electrónico y un botón para Acceder.

Antes que nada, como vamos a utilizar un campo de texto, vamos a crear nuestra variable **@State** para manejar el texto de nuestro textfield, lo haremos de la siguiente manera: 

```
@State var email = ""
```

Recuerda que está línea debe ir antes de nuestro body.

Ahora sí, vamos a hacer la interfaz, primero voy a incluir todo dentro de un **VStack**, ya que mis componentes los requiero acomodados de manera vertical, y modificaré la propiedad de alignment a .center para que mis elementos queden centrados.

```
VStack(alignment: .center) {
    
}
```

Posteriormente vamos a agregar el título de Pokedex, con el tipo de font largeTitle, como podrás notar swift ya tiene por default varios tamaños predeterminados que puedes utilizar, te recomiendo utilizarlos para que no entres en conflicto con los tamaños de letra. 

```
VStack(alignment: .center) {
    Text("Pokedex").font(.largeTitle)
}
```

Bien, ahora vamos a añadir nuestro textfield con una línea debajo de él para ayudarle a usuario decirle que hay un campo de texto.

```
VStack(spacing: 0) {
    TextField(text: $email) {
        Text("Correo Electrónico")
    }.multilineTextAlignment(.center)
        .keyboardType(.emailAddress)
        .padding()
        .font(.title3)
        .textInputAutocapitalization(.never)
    
    Divider()
}
```

Nota como modifiqué la propiedad de spacing a 0, esto es para que entre mis componentes dentro del VStack no haya un espacio considerable, ya que por default le agrega un espacio y como queremos mostrarlo es que el divider este pegado al textfield para que el usuario lo utilice.

Dentro del textfield estoy utilizando mi variable @State que declaramos arriba, el **$** es un wrapper para poder hacer un binding de nuestra variable.

Como ya lo sabes cada componente tiene sus modificadores, en este caso, estamos utilizando **keyboardType**, determina el tipo de teclado que queremos que se le presente al usuario, es decir, un keyboard normal mostrará por default el teclado para que tenemos para escribir, pero el **.emailAddress** facilita al usuario encontrar el **@** sin tener que cambiar entre teclado alfanúmero y de símbolos.

Otro modificador importante que estamos utilizando aquí es el **textInputAutocapitalization**, por default iOS escribe en **CamelCase** ya que muchos usuarios están acostumbrados a hacerlo así cuando inician un texto, muchos quieren escribir su correo tal cual es, por ejemplo, en minúsculas por lo que será frustante para ellos si no lo dejas empezar con ello. 

Sigamos, vamos a agregar el botón de Acceder:

```
Button {
    // TODO: Save user and continue to next page
} label: {
    Text("Acceder")
}
```

De momento no vamos a realizar ninguna acción, para después poder utilizar nuestro **ViewModel**. Bien, si lo ves en el preview ya está listo. Te dejo el resultado final, yo agregue algunos Spacer() para mejorar un poco la vista:

```
VStack(alignment: .center) {
    Spacer().frame(height: 48)
    
    Text("Pokedex").font(.largeTitle)
    
    Spacer()
            
    VStack(spacing: 0) {
        TextField(text: $email) {
            Text("Correo Electrónico")
        }.multilineTextAlignment(.center)
            .keyboardType(.emailAddress)
            .padding()
            .font(.title3)
            .textInputAutocapitalization(.never)
        
        Divider()
    }
            
    Spacer()
        
    Button {
        // TODO: Save user and continue to next page
    } label: {
        Text("Acceder")
    }
}.padding()
```

![lab_7](/mobile/ios/6_advanceui/login.png)


Si quieres ver el resultado final en tu simulador/dispositivo puedes ir a tu **PokedexApp** y cambiar el ContentView() por el LoginView()

Perfecto ahora que tenemos nuestra interfaz, vamos a nuestra siguiente parte de la historia de usuario que es que nuestra sesión se guarde. Para esto si recuerdas tenemos el PokemonAPIService dentro de nuestro **group** de **Data**, sin embargo, en este caso vamos a utilizar un servicio local sin ninguna conexión a Internet por lo que requerimos un nuevo group dentro de Data->Modelos que se llame **Local**.

![lab_7](/mobile/ios/6_advanceui/local.png)

Dentro vamos a crear nuestro archivo swift **LocalService** que nos ayude manejar nuestras llamadas a base de datos local.

![lab_7](/mobile/ios/6_advanceui/local_service.png)

Excelente, no olvidemos crear nuestro singleton para acceder a nuestro servicio

```
static let shared = LocalService()
```

Entonces, ¿qué vamos a utilizar para la persistencia de datos local?

Vamos utilizar **UserDefaults**, esta clase provee la manera de interactuar con el sistema default de iOS. Este sistema perfime a la app personalizar su comportamiento de acuerdo a las preferencias del usuario. Por ejemplo puedes especificar su preferencia de tamaño de letra. Las apps almacenan estas preferencias asignando valores a los parámetros en una base de datos del usuario. El **Defaults** es debido a que normalmente son utilizados para determinar el estado de la app al inicio o como se comporta.

**UserDefaults** almacena en caché la información para evitar tener que abrir la base de datos predeterminada del usuario cada vez que necesita un valor. Cuando establece un valor, se cambia de forma sincrónica dentro de su proceso y de forma asincrónica con el almacenamiento persistente y otros procesos.

Vamos a utilizar agrega los siguientes tres métodos a tu clase de LocalService:

```
func getCurrentUser() -> String? {
    return UserDefaults.standard.string(forKey: "currentUser")
}

func setCurrentUser(email: String) {
    UserDefaults.standard.set(email, forKey: "currentUser")
}

func removeCurrentUser() {
    UserDefaults.standard.removeObject(forKey: "currentUser")
}
```

Así de sencillo ya estaremos manejando la información de nuestro usuario de manera local, de preferencia utiliza solamente variables primitivas, para almacenar objetos se puede pero ya es una herramienta más avanzada.

Bien, continuemos con nuestro UserRepository, no entraré mucho en detalle ya que lo vimos en el laboratorio pasado te dejo el resultado final, sin antes invitarte a que lo intentes por tu cuenta. 

```
import Foundation

protocol UserServiceProtocol {
    func getCurrentUser() -> String?
    func setCurrentUser(email:String)
    func removeCurrentUser()
}

class UserRepository: UserServiceProtocol {
    static let shared = UserRepository()
    var localService = LocalService()
    
    init(localService: LocalService = LocalService.shared) {
        self.localService = localService
    }
    
    func getCurrentUser() -> String? {
        self.localService.getCurrentUser()
    }
    
    func setCurrentUser(email: String) {
        self.localService.setCurrentUser(email: email)
    }
    
    func removeCurrentUser() {
        self.localService.removeCurrentUser()
    }
}
```

Y según nuestra arquitectura nos faltan nuestro Requirement y el ViewModel, crea el UserRequirement en la carpeta correspondiente, de nuevo te dejo el código aquí pero intentalo para que practiques.

```
import Foundation

protocol UserRequirementProtocol {
    func setCurrentUser(email: String)
    func getCurrentUser() -> String?
    func removeCurrentUser()
}

class UserRequirement: UserRequirementProtocol {
    static let shared = UserRequirement()
    let dataRepository: UserRepository

    init(dataRepository: UserRepository = UserRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func setCurrentUser(email: String) {
        self.dataRepository.setCurrentUser(email: email)
    }
    
    func getCurrentUser() -> String? {
        return self.dataRepository.getCurrentUser()
    }
    
    func removeCurrentUser() {
        self.dataRepository.removeCurrentUser()
    }
}
```

Por último vamos a crear el **LoginViewModel**, que en vez lo requirementes de Pokemon que utilizamos los laboratorios pasados, recuerda usar el UserRequiremente:

```
class LoginViewModel: ObservableObject {
    @Published var email = ""
    
    var userRequirement: UserRequirementProtocol
    
    init(userRequirement: UserRequirementProtocol = UserRequirement.shared) {
        self.userRequirement = userRequirement
    }
}
```

Perfecto ahora vamos a agregar los métodos que vamos a utilizar en nuestro login. El primero guardar el correo de nuestro usuario

```
@MainActor
func setCurrentUser() {
    self.userRequirement.setCurrentUser(email: self.email)
}
```

¿Sencillo cierto? ¿Pero y si quiero validar que el correo no este vació o que se inválido? 

Vamos a agregar dos variables @Published más a nuestro código

```
@Published var messageAlert = ""
@Published var showAlert = false
```

Y vamos a modificar el código de nuestro setCurrentUser de la siguiente forma: 

```
@MainActor
func setCurrentUser() {
    if self.email != "" {
        self.userRequirement.setCurrentUser(email: self.email)
    } else {
        self.messageAlert = "Correo inválido"
        self.showAlert = true
    }
}
```

Bien ahora vamos a modificar nuestro LoginView para utilizar nuestro **LoginViewModel**. Intercambia nuestra variable @State var email que teniamos por lo siguiente línea:

```
@StateObject var loginViewModel = LoginViewModel()
```

¿Cuál es nuestra variable para el textfield? Modifica el textfield para usar nuestra variable @Published email de nuestro ViewModel:

```
TextField(text: $loginViewModel.email)
```

Y modifica el // TODO de nuestro botón para guardar la información del usuario

```
Button {
    loginViewModel.setCurrentUser()
} label: {
    Text("Acceder")
}
```

Listo! Satisfactoriamente con esto el usuario ya puede guardar su información de manera local. Ah se me olvida para mostrar una alerta de error al usuario en caso de que este vació, lo único que tenemos que hacer es lo siguiente:

```
VStack(alignment: .center) {
    ...
}.padding()
    .alert(isPresented: $loginViewModel.showAlert) {
            Alert(
                title: Text("Oops!"),
                message: Text(loginViewModel.messageAlert)
            )
        }
```

En nuestro VStack agregamos el modificador de **.alert** para mostrar una alerta dependiendo del estado de nuestra variable @Published **showAlert** y mostramos el mensaje de nuestra alerta que configuramos en la variable @Published **messageAlert**. Y listo puedes correrlo y ver que sucede.

![lab_7](/mobile/ios/6_advanceui/error_vacio.png)

Pues con esto hemos concluido el trabajo de la historia de usuario del **Login**.

- ~~Como usuario al entrar a la aplicación quiero iniciar sesión con mi correo antes de usar la aplicación para que mi sesión quede guardada.~~
- Como usuario quiero poder elegir entre la lista del Pokedex o poder ver mi perfil.
- Como usuario quiero ver el detalle de un Pokemon para ver más información del mismo.
- Como usuario quiero cerrar sesión para borrar mis datos personales del dispositivo.

## Paso 3 Como usuario quiero poder elegir entre la lista del Pokedex o poder ver mi perfil.

Para historia de usuario, vamos a crear otro archivo **SwiftUI View** que va a contener un **TabView** verás que es muy sencillo, por lo tanto crea el nuevo archivo y llamalo **MenuView**

Ahora dentro de nuestro MenuView agrega lo siguiente para crear el tab:

struct MenuView: View {
    var body: some View {
        TabView {
            ContentView().tabItem {
                Image(systemName: "cricket.ball")
                Text("Pokedex")
            }
            Text("Perfil").tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }
        }
    }
}

Listo! Tenemos un Tab, que fácil para probarlo a tu PokedexApp e intercambia LoginView() por MenuView(). ¿Ya notaste que para el segundo tab utilizamos un Text() y no una vista? Lo podemos hacer de manera temporal en lo que creamos nuestra vista de Perfil.

Ahora viene lo complicado ¿Cómo llegamos a ella después de iniciar sesión? ó ¿Cómo le decimos que es nuestra vista principal cuándo el usuario ya esta logueado?

Para ello vamos utilizar el patrón de diseño **Coordinator**

Utilizando el coordinator pattern podemos remover el trabajo de navegación a nuestros controladores, nos ayuda a hacerlos manejables y reusables, por lo que nos permite adaptar nuestro flujo cuando lo necesitemos.

El Coordinator patter hace que los controladores sean independientes trabajando de una mejor manera independientemente de la posición que nuestra vista en el stack de vistas, con el stack de vistas me refiero a como se organizas la vistas en una aplicación móvil, siempre que habrás una nueva vista se agrega a un stack, es decir, si abres mil vistas y no manejas el ciclo de vida podrías crear un memory leak por tantas pantallas abiertas. En una navegación lista-detalle ambas vistas se encuentran en el stack aunque diera la sensación que list no existe.

Bien, sin más preambulos vamos a hacer como se hace. A través de Swift Pagackage Manager (SPM) instala la librería de **Flowstacks** (https://github.com/johnpatrickmorgan/FlowStacks)

![lab_7](/mobile/ios/6_advanceui/flowstacks.png)

Espera a que se importe y ahora dentro de nuestro group Framework->Views crea un nuevo archivo de tipo SwiftUI View que se llame CoordinatorView. Dentro de este archivo lo primero que vamos a usar es importar la librería

```
import FlowStacks
```

Ahora vamos a agregar un enum con las opciones de vistas que tenemos en nuestra aplicación

```
enum Screen {
    case login
    case menu
}
```

Vamos definir nuestra homepage

```
@State var routes: Routes<Screen> = [.root(.login)]
```

Y dentro del body vamos a ingresar lo siguiente:
```
Router($routes) { screen, _ in
    /// For each screen setup the corresponding view
    switch screen {
    case .login:
        /// Setup page/view will be shown when referring this case
        LoginView(
            /// The function `goMenu` is declared in LoginView, we use it to send the action to present a specific screen
            /// Set up the route screen and the presenting mode for the flow desired
            goMenu: { routes.presentCover(.menu) }
        )
    case .menu:
        MenuView(
            goRoot: { routes.presentCover(.login) }
        )
    }
}
```

Lee los comentarios del código para que te des una idea de lo que estamos haciendo aquí. ¿Te marca error de compilación cierto? ahorita lo arreglamos vamos a seguir con este archivo para terminarlo.

Por último vamos a agregar el siguiente método:
```
/// Return to main screen [eg. Logout] that returns to first screen in flow
private func goRoot() {
    Task { @MainActor in
        await $routes.withDelaysIfUnsupported {
            $0.goBackToRoot()
        }
    }
}
```
Como el comentario lo dice nos regresa a nuestra primer vista que tengamos en el flujo.

Te dejo el resultado final con algunos comentarios:
```
import SwiftUI
import FlowStacks

/// Main view to manage navigation flow on different presentations mode
struct Coordinator: View {
    /// Use this variable to set the main screen the app should start
    @State var routes: Routes<Screen> = [.root(.login)]
    
    /// It's not necessary to add all screens. Check up the side menu to understand whole navigation
    enum Screen {
        case login
        case menu
    }
    
    var body: some View {
        Router($routes) { screen, _ in
            /// For each screen setup the corresponding view
            switch screen {
            case .login:
                /// Setup page/view will be shown when referring this case
                LoginView(
                    /// The function `goMenu` is declared in LoginView, we use it to send the action to present a specific screen
                    /// Set up the route screen and the presenting mode for the flow desired
                    goMenu: { routes.presentCover(.menu) }
                )
            case .menu:
                MenuView(
                    goRoot: { routes.presentCover(.login) }
                )
            }
        }
    }

    /// Return to main screen [eg. Logout] that returns to first screen in flow
    private func goRoot() {
        Task { @MainActor in
            await $routes.withDelaysIfUnsupported {
                $0.goBackToRoot()
            }
        }
    }
}
```
Bien ahora sí, los errores que te marca son porque los métodos deben existir en las vistas correspondientes, estos son lo que se conectan con el coordinator para manejar la transición de las vistas.

Entonces vamos a nuestro loginview y agrega la siguiente línea antes del body:
```
/// Used by the coordinator to manage the flow
let goMenu: () -> Void
```

Ahora vamos a editar nuestro menuview
```
/// Used by the coordinator to manage the flow
let goRoot: () -> Void
```

Listo tenemos configurado nuestro patrón Coordinator y ya no te debe marcar errores. Si te da error en los previews, puedes borrarlos para que no te de problema o dejarlos de la siguiente manera: 

```
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView {
            ()
        }
    }
}
```

Vamos a modificar nuestro login para que cuando el usuario acceda lo lleve a la vista del Tab:

Vamos a loginview y dentro de nuestro botón vamos a hacer lo siguiente:

```
Button {
    loginViewModel.setCurrentUser()
    goMenu()
} label: {
    Text("Acceder")
}
```
Así de simple, agregamos nuestro método en el momento que queremos que se ejecute el Coordinator, aún lo podemos mejorar una vez que el usuario ingrese ya que no queremos que se vuelva a loguear, sino que lo lleve directamente a la vista de menuview.

Vamos a agregar el uso de **onAppear** a nuestro VStack utiliza el siguiente código antes del modificador de .padding()

```
}.onAppear {
        loginViewModel.getCurrentUser()
            
        if loginViewModel.email != "" {
            goMenu()
        }
}.padding()
```

¿Si te quedó? Tranquilo aquí está el resultado final:
```
import SwiftUI

struct LoginView: View {
    @StateObject var loginViewModel = LoginViewModel()
    
    /// Used by the coordinator to manage the flow
    let goMenu: () -> Void
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: 48)
            
            Text("Pokedex").font(.largeTitle)
            
            Spacer()
            
            VStack(spacing: 0) {
                TextField(text: $loginViewModel.email) {
                    Text("Correo Electrónico")
                }.multilineTextAlignment(.center)
                    .keyboardType(.emailAddress)
                    .padding()
                    .font(.title3)
                    .textInputAutocapitalization(.never)
                
                Divider()
            }
            
            Spacer()
            
            Button {
                loginViewModel.setCurrentUser()
                goMenu()
            } label: {
                Text("Acceder")
            }
        }.onAppear {
            loginViewModel.getCurrentUser()
                
            if loginViewModel.email != "" {
                goMenu()
            }
        }.padding()
            .alert(isPresented: $loginViewModel.showAlert) {
                    Alert(
                        title: Text("Oops!"),
                        message: Text(loginViewModel.messageAlert)
                    )
                }
    }
}
```

Perfecto ahora nos marca un error ya que nos falta agregar el método de getCurrentUser en nuestro LoginViewModel, dirigete al archivo y agrega el siguiente método:

```
@MainActor
func getCurrentUser() {
    self.email = self.userRequirement.getCurrentUser() ?? ""
}
```

Recuerda que aquí estamos modificando la variable @Publisher de nuestro viewmodel para poder utilizarlo en nuestra vista.

Perfecto, para probarlo lo único que debes hacer es ir directamente al PokedexApp y reemplazar MenuView() por Coordinator(), el resultado final queda de la siguiente manera: 

```
import SwiftUI

@main
struct PokedexApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            Coordinator()
        }.onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .background:
                print("App State : Background")
            case .inactive:
                print("App State : Inactive")
            case .active: // Foreground
                print("App State : Active")
            @unknown default:
                 print("App State : Unknown")
            }
        }
    }
}
```

¡Excelente! Ya deberías de poder loguearte e ir al menú. 

![lab_7](/mobile/ios/6_advanceui/menu.png)

Con esto hemos concluido el trabajo de la historia de usuario del **Tab**.

- ~~Como usuario al entrar a la aplicación quiero iniciar sesión con mi correo antes de usar la aplicación para que mi sesión quede guardada.~~
- ~~Como usuario quiero poder elegir entre la lista del Pokedex o poder ver mi perfil.~~
- Como usuario quiero ver el detalle de un Pokemon para ver más información del mismo.
- Como usuario quiero cerrar sesión para borrar mis datos personales del dispositivo.

## Paso 4 Como usuario quiero ver el detalle de un Pokemon para ver más información del mismo.

Para esta historia de usuario vamos a editar nuestra lista para que pueda llevarnos al detalle de uno de los pokemon, dirigete a tu ContentView para realizarlo.

Nuestra lista la vamos a incrustar en un NavigationView y ahora nuestro onAppear pertenecerá a este de la siguiente manera:

```
NavigationView {
    List(contentViewModel.pokemonList) { pokemonBase in
        HStack {
            WebImage(url: URL(string: pokemonBase.perfil?.sprites.front_default ?? ""))
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            Text(pokemonBase.pokemon.name)
        }
    }
}.onAppear {
    Task {
        await contentViewModel.getPokemonList()
    }
}
```
Esto nada más es para que le demos la posibilidad a nuestra vista de que sea navegable, ahora a cada uno dentros rows los vamos a incrustar dentro de un navigation link que es el que se encargar de definir la vista de destino:

```
NavigationLink {
    // TODO: Send Detail
} label: {
    HStack {
        WebImage(url: URL(string: pokemonBase.perfil?.sprites.front_default ?? ""))
            .resizable()
            .scaledToFit()
            .frame(width: 48, height: 48, alignment: .center)
        Text(pokemonBase.pokemon.name)
    }
}
```

Ahora nos falta nuestra vista de detalle, crea un nuevo archivo SwiftUI View que se llame **PokemonDetailView**, al cual, le pasaremos la información del pokemon que hayamos seleccionado, para hacer esto basta con hacer lo siguiente:

```
import SwiftUI

struct PokemonDetailView: View {
    var pokemonBase: PokemonBase
    
    var body: some View {
        Text(pokemonBase.pokemon.name).font(.largeTitle)
    }
}
```

Creamos una variable de tipo pokemonBase y por el momento solamente vamos a mostrar su nombre en pantalla. Te invito a que hagas la vista completa y agregues todos los detalles del pokemon, para esto recuerda que debes modificar los modelos ya que por el momento solo contamos con la imagen y el nombre.

Bien, regresemos ahora a nuestro ContentView, vamos a modificar el código de manera que la vista detalle que se muestre sea la de PokemonDetailView:

```
NavigationLink {
    PokemonDetailView(pokemonBase: pokemonBase)
} label: {
    ...
}
```
Te dejo el resultado final:
```
import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            List(contentViewModel.pokemonList) { pokemonBase in
                NavigationLink {
                    PokemonDetailView(pokemonBase: pokemonBase)
                } label: {
                    HStack {
                        WebImage(url: URL(string: pokemonBase.perfil?.sprites.front_default ?? ""))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48, height: 48, alignment: .center)
                        Text(pokemonBase.pokemon.name)
                    }
                }
            }
        }.onAppear {
            Task {
                await contentViewModel.getPokemonList()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

El resultado final es el siguiente:

![lab_7](/mobile/ios/6_advanceui/list_navigation.png)
![lab_7](/mobile/ios/6_advanceui/detail_navigation.png)

Con esto hemos concluido el trabajo de la historia de usuario del **Detalle del Pokemon**.

- ~~Como usuario al entrar a la aplicación quiero iniciar sesión con mi correo antes de usar la aplicación para que mi sesión quede guardada.~~
- ~~Como usuario quiero poder elegir entre la lista del Pokedex o poder ver mi perfil.~~
- ~~Como usuario quiero ver el detalle de un Pokemon para ver más información del mismo.~~
- Como usuario quiero cerrar sesión para borrar mis datos personales del dispositivo.

## Paso 5 Como usuario quiero cerrar sesión para borrar mis datos personales del dispositivo.

Finalmente para esta historia de usuario vamos a crear la vista y el viewModel de Perfil, PerfilView y PerfilViewModel. Lo que que queremos es mostrar el nombre de nuestro usuario y poder hacer logout.
Crea un interfaz con un texto que muestre el correo del usuario que guardamos en user defaults y un botón que diga Logout.

Te dejo el resultado final de la interfaz:
```
import SwiftUI

struct PerfilView: View {
    @StateObject var perfilViewModel = PerfilViewModel()

    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            Text(perfilViewModel.email)
            
            Button {
                // TODO Logout user and go to login
            } label: {
                HStack(spacing: 16) {
                    Image(systemName: "power")
                    Text("Logout")
                }.foregroundColor(.red)
            }
        }.onAppear {
            perfilViewModel.getCurrentUser()
        }
    }
}
```

Y el resultado final del viewmodel:
```
import Foundation

class PerfilViewModel: ObservableObject {
    @Published var email = ""
    
    var userRequirement: UserRequirementProtocol
    
    init(userRequirement: UserRequirementProtocol = UserRequirement.shared) {
        self.userRequirement = userRequirement
    }
    
    @MainActor
    func getCurrentUser() {
        self.email = self.userRequirement.getCurrentUser() ?? ""
    }
}
```

Listo! Bien ahora si vamos a crear el logout en nuestro viewmodel agrega el siguiente método:
```
@MainActor
    func logOut() {
        self.email = ""
        self.userRequirement.removeCurrentUser()
    }
```
Tan simple como limpiar nuestro email y remove el current user a través de nuestro requerimiento que ya estaba conectado previamente hasta nuestro repositorio.

Y ahora en nuestra interfaz vamos a agregar nuestros métodos del coordinator y que se ejecuta este método.

```
/// Used by the coordinator to manage the flow
let goRoot: () -> Void
```

Y ahora en nuestro botón vamos a agregar lo siguiente:
```
Button {
    perfilViewModel.logOut()
    /// Used by the coordinator to manage the flow
    goRoot()
} label: {
    HStack(spacing: 16) {
        Image(systemName: "power")
        Text("Logout")
    }.foregroundColor(.red)
}
```

Recuerda si te da error en los previews puedes resolverlo quitando los previews o de la siguiente manera:
```
struct PerfilView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilView {()}
    }
}
```

![lab_7](/mobile/ios/6_advanceui/perfil.png)

Wujuu!! con esto ya terminamos nuestras historias de usuario:

- ~~Como usuario al entrar a la aplicación quiero iniciar sesión con mi correo antes de usar la aplicación para que mi sesión quede guardada.~~
- ~~Como usuario quiero poder elegir entre la lista del Pokedex o poder ver mi perfil.~~
- ~~Como usuario quiero ver el detalle de un Pokemon para ver más información del mismo.~~
- ~~Como usuario quiero cerrar sesión para borrar mis datos personales del dispositivo.~~

Hemos finalizado nuestras historias de usuario ahora tienes los siguientes retos para realizar como práctica de todo lo que hemos realizado.

1. Crear la interfaz del detalle del Pokemon, revisa la información que ofrece el API y define cual sería la mejor visualización de información, ya puedes implementar desde componentes básicos hasta listas.
2. Personaliza tu perfil y agrega la cámara para tu subir tu foto de perfil. 
3. Implementar la barra de búsqueda en la vista de Pokedex.
4. Mejorar los detalles para hacer la aplicación tuya.