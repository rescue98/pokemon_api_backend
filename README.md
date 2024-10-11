# Pokemon_p
El siguiente proyecto cumple ciertas funcionalidades, utilizando la API https://pokeapi.co, la cual contiene una base de datos de Pokemon. El siguiente proyecto/código pertenece a ControlGroup.

# Pokémon API

Este proyecto es una API para gestionar Pokémon, implementada en dos tecnologías: **Ruby on Rails** y **Node.js**. La API permite realizar operaciones básicas como listar Pokémon, capturarlos, liberarlos, y gestionar un registro de Pokémon capturados.

## Estructura de Ramas

Este repositorio sigue la estrategia de **Git Flow**, donde las funcionalidades se desarrollan en ramas separadas y se integran a la rama `develop`. Esto es una buena práctica por varias razones:

1. **Seguridad**: Mantener la rama `main` limpia y libre de errores potenciales. La rama `develop` actúa como un entorno de pruebas, permitiendo detectar y corregir errores antes de que el código se fusione a `main`.

2. **Organización**: Facilita la gestión de diferentes versiones y características del proyecto. Cada nueva funcionalidad se desarrolla en su propia rama y se fusiona a `develop` una vez completada.

3. **Colaboración**: Permite que múltiples desarrolladores trabajen en diferentes características simultáneamente sin interferir con el trabajo de los demás. 

4. **Despliegue**: Se puede configurar un proceso de integración continua (CI) para automatizar pruebas en la rama `develop` antes de realizar el despliegue en `main`.

## Características

- **Listar Pokémon**: Permite obtener una lista de todos los Pokémon disponibles.
- **Capturar Pokémon**: Funcionalidad para capturar Pokémon usando su ID.
- **Listar Pokémon Capturados**: Muestra todos los Pokémon que han sido capturados.
- **Liberar Pokémon**: Permite liberar un Pokémon capturado.
- **Importar Pokémon**: Función para importar Pokémon desde la API pública de PokéAPI.

## Tecnologías Usadas

- **Ruby on Rails**: Para el desarrollo de la API en Ruby.
- **SQLite**: Base de datos utilizada para almacenar la información de los Pokémon.

### Descripción de los Directorios y Archivos

- **app**: Contiene el código de la aplicación.
  - **assets**: Archivos estáticos, como JavaScript, CSS y imágenes.
  - **controllers**: Controladores que manejan la lógica de la aplicación y la interacción entre modelos y vistas.
  - **models**: Modelos de datos, incluyendo la definición de `Pokemon` y sus validaciones.
  - **views**: Plantillas que definen cómo se presenta la información al usuario.

- **config**: Configuraciones de la aplicación, incluyendo las rutas.

- **db**: Contiene migraciones y semillas de la base de datos.
  - **migrate**: Archivos de migración que definen la estructura de la base de datos.
  - **seeds.rb**: Datos iniciales que se insertan en la base de datos al ejecutarse.

- **lib**: Funciones y bibliotecas personalizadas que pueden ser utilizadas en la aplicación.

- **log**: Archivos de log donde se registran los eventos de la aplicación.

- **test**: Pruebas para garantizar que la aplicación funcione como se espera.

- **Gemfile**: Archivo que lista las gemas necesarias para el proyecto.

- **Gemfile.lock**: Archivo que especifica las versiones exactas de las gemas instaladas.

- **Rakefile**: Define las tareas Rake que se pueden ejecutar en la aplicación.

- **README.md**: Este archivo, que proporciona información sobre el proyecto, su instalación y uso.

  ### Pruebas

  ## Imágenes

## Imágenes

### 1. Prueba en localhost

Esta imagen muestra que el código se puede ver correctamente en `http://localhost:3000`.

![Prueba_localhost](https://github.com/rescue98/pokemon_p/blob/develop/imagenes/Prueba_localhost.png?raw=true)

### 2. Listado de Pokémon

Aquí se puede ver que la lista de Pokémon se importó correctamente, destacada en amarillo.

![Prueba1_ListarPokemones](https://github.com/rescue98/pokemon_p/blob/develop/imagenes/Prueba1_ListarPokemones.png?raw=true)

### 3. Inicio de la Importación de Pokémon

Esta imagen muestra el inicio de la importación de Pokémon.

![Prueba1_Post](https://github.com/rescue98/pokemon_p/blob/develop/imagenes/Prueba1_Post.png?raw=true)

### 4. Verificación de la Importación

La última numeración en el Pokémon 150 indica que la importación fue exitosa.

![Prueba2_Post](https://github.com/rescue98/pokemon_p/blob/develop/imagenes/Prueba2_Post.png?raw=true)

