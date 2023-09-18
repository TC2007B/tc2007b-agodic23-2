# Módulo 3 - Móviles (MAD)

![Tec de Monterrey](/images/logotecmty.png)

## Temario Técnico
| Clase | Tema                                       | Android                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | iOS                                                   |
| ----- | ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------- |
| 1     | Introducción al desarrollo móvil (Técnico) | [Introducción](https://docs.google.com/presentation/d/1IWuIlCWQ2FLjHXrOKezM8-RiSa1Or-wo9l-ckO_1HLY/edit#slide=id.g23bc83ae714_0_0)                                                                                                                                                                                                                                                                                                                                                                |
| 2     | Introducción a Kotlin / Swift              | [Básicos de Kotlin](https://docs.google.com/presentation/d/1fMJWpEbnQGd39zwsrzVWm3hM9Myh6mWYS1Tgq8USrls/edit?usp=sharing&resourcekey=0-TC3peTh9IKAQx3IoIxJfGw) <br /><br /> [Funciones en Kotlin](https://docs.google.com/presentation/d/1fMJWpEbnQGd39zwsrzVWm3hM9Myh6mWYS1Tgq8USrls/edit?usp=sharing&resourcekey=0-TC3peTh9IKAQx3IoIxJfGw) <br /><br /> [Clases y Objetos](https://docs.google.com/presentation/d/1NWo4-P8zO0rnlDB6zEMH7oPZP1PEP3q0d9wKB-asV9s/edit#slide=id.gb9961b3fa0_0_433) | [Introducción](/mobile/ios/ppts/IOS_Introduction.pdf) |
| 3     | Mi primera app en Android / iOS            |
| 4     | Concepto detalle vista                     |
| 5     | MVVM y Clean Architecture                  |
| 6     | Ciclos de Vida                             |
| 7     | Despliegue de Aplicaciones                 |

## Laboratorios
| Laboratorio | Tema                        | Android                                                       | iOS                                                                                 |
| ----------- | --------------------------- | ------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| 1           | Introducción a Kotlin/Swift | [Laboratorio](/mobile/labs/1_intro_kotlin.md)                 | [Laboratorio](/mobile/ios/1_intro_swift.md)                                         |
| 2           | Primera App en Kotlin/Swift |                                                               | [Storyboad](/mobile/ios/1_bases/storyboard/) [SwiftUI](/mobile/ios/1_bases/swiftui) |
| 3           | Modelos y Listas            | [Laboratorio](/mobile/labs/3_data_classes_y_recyclerview.md)  | [Laboratorio](/mobile/ios/2_modelos_y_listas.md)                                    |
| 4           | Consumiendo APIs            | [Laboratorio](/mobile/labs/4_consumiendo_apis.md)             |
| 5           | Arquitectura de Proyectos   | [Laboratorio](/mobile/labs/5_arquitectura_mvvm.md)            |
| 6           | Desarrollo Avanzado y UI    | [Laboratorio](/mobile/labs/6_fragmentos_y_material_design.md) |

## Como empezar
### Para la clase necesitarás lo siguiente:

#### Android
- Android Studio en su versión más actual.
- Java en su versión más actual.
- Kotlin (lo bajarás al configurar nuevos proyectos en Android por lo que no requieres configuración adicional)
- En caso de no contar con un dispositivo Android deberás hacer uso del emulador. Aquí podrás encontrar una guía de como configurarlo. [Guía](https://developer.android.com/design-for-safety/privacy-sandbox/download?hl=es-419#:~:text=Set%20up%20an%20Android%20device%20emulator%20image,-To%20set%20up&text=Install%20the%20latest%20Canary%20build,it%20isn't%20already%20installed.) **Nota: El emulador tiende a hacer uso de muchos recursos de la computadora, verifica que tu computadora pueda correrlo en caso de usarlo.**
- En caso de contar con un dispositivo Android sea la versión que sea deberás habilitar las opciones de desarrollador las cuales podrás encontrar en la siguiente [guía](https://developer.android.com/studio/debug/dev-options?hl=es-419).

### Documentación oficial Android
- [Documentación Oficial](https://developer.android.com/?hl=es-419)

#### iOS
- Computadora con MacOS
- Xcode en su versión más actual.
- En caso de no contar con un dispositivo iOS deberás hacer uso del emulador. **Nota: El emulador tiende a hacer uso de muchos recursos de la computadora, verifica que tu computadora pueda correrlo en caso de usarlo.**.

### Documentación oficial iOS
- [Documentación Oficial](https://developer.apple.com/develop/)

### Materiales de Consulta
- El mundo de Android se mueve muy rápido si bien existe bibliografía al respecto te recomiendo más que busques en artículos, la documentación oficial o con algunos expertos GDE (Google Developer Expert).
- **Antonio Leyva** es uno de los ponentes más conocidos en el ecosistema Android, fue de los pioneros en adoptar Kotlin y compartir con la comunidad una forma de adentrarse al lenguaje, su blog está repleto de tutoriales sencillos de aprender.
  - Canal de Youtube: [devexperto](https://www.youtube.com/@devexperto)
  - Página Oficial: [devexperto](https://devexperto.com/)
  - Blog Oficial: [devexperto](https://devexperto.com/blog/)
- **Philipp Lackner** es un ponente en inglés con tutoriales muy actualizados sobre Kotlin, sus explicaciones son bastante sencillas pero se debe tener un previo conocimiento de la plataforma y el lenguaje, si bien tiene un curso desde 0 es un poco extenso.
  - Canal de Youtube: [philipp lackner](https://www.youtube.com/@PhilippLackner)
- **Simplified Coding** es un ponente Indhú que no solo hace tutoriales de Android, también pone en práctica las buenas prácticas de Ingeniería de Software en conjunto con los proyectos tutorial que desarrolla.
  - Canal de Youtube: [simplified coding](https://www.youtube.com/@SimplifiedCoding)
- **Hyperskill** es una academia de aprendizaje, aquí puedes reforzar el dominio de Kotlin. [Kotlin Academy](https://hyperskill.org/tracks?category=4)
- **Kotlin Koans** es un curso de aprendizaje de Kotlin desarrollado por JetBrains la empresa fundadora del lenguaje. [Kotlin Koans](https://kotlinlang.org/docs/koans.html)
- **Kotlin Docs** es la página oficial del lenguaje de Kotlin, aquí podrás encontrar el manual y API de Kotlin, si tienes dudas sobre alguna sintáxis de los datos básicos no dudes en consultarla. [Kotlin docs](https://kotlinlang.org/docs/home.html)
- **JAVA Doc** es el estándar de documentación de código de Java, este lo extenderemos a nuestros proyectos para la documentación del mismo. [JAVA Doc](https://docs.oracle.com/javase/8/docs/technotes/tools/windows/javadoc.html)
- **Material Design** es el estándar para Android en el desarrollo de UI/UX, si te cuesta trabajo el diseño no olvides implementar sus reglas básicas y tendrás un éxito de diseño asegurado, o al menos eso dice el manual. [Material Design 3](https://m3.material.io/)
- **Figma** es una de las herramientas de diseño de interfaces y prototipos más usadas en el mercado, si bien puedes ver alguna otra en el curso con tu profesor y quieres ahondar más aquí tienes la liga. [Figma](https://www.figma.com/login)
  - Curso exprés del uso de Figma, es un poco viejo pero mantiene los básico [DesignCourse](https://www.youtube.com/watch?v=3q3FV65ZrUs&t=695s)
- **Penpot** es una nueva herramienta Open Source para el desarollo de interfaces, con la promesa de ser lo bastante potente como Figma, aún se encuentra en desarrollo pero si buscas una alternativa por aquí puedes empezar. [Penpot](https://penpot.app/)