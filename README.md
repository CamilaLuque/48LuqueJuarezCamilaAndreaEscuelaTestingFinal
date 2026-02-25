Proyecto de Pruebas Automatizadas con Karate

Este proyecto contiene un conjunto de pruebas automatizadas para la API [PetStore](https://petstore.swagger.io/#/), desarrolladas utilizando el framework Karate. Las pruebas cubren varios endpoints, incluyendo la creación, obtención, actualización y eliminación de usuarios y productos.

## 1. Prerrequisitos

Antes de ejecutar las pruebas, asegúrate de tener instalado y configurado lo siguiente en tu sistema:

*   **Java 17:** El proyecto está configurado para usar Java 17.
*   **Apache Maven:** Se utiliza para la gestión de dependencias y la ejecución de las pruebas.
*   **Variables de Entorno:**
    *   `JAVA_HOME`: Debe apuntar al directorio de instalación de tu JDK 17.
    *   `M2_HOME`: Debe apuntar al directorio de instalación de Maven.
    *   Asegúrate de que las carpetas `bin` de Java y Maven estén incluidas en la variable `Path` de tu sistema operativo.

## 2. Features desarrollados
*   **Store:** Automatizar el acceso a órdenes de Pet Store.
    * `GET` /store/inventory: Retorno de inventario de mascotas por estatus. 
    * `POST` /store/order: Realizar un pedido para una mascota.
    * `GET` /store/order/{orderId}: Búsqueda de una orden de compra por su id.
    * `DELETE` /store/order/{orderId}: Eliminar una orden de compra por id.
    
*   **User:** Automatizar las operaciones de user de Pet Store.
    * `POST` /user/createWithList: Creación de una lista de usuarios en Pet Store dada una lista.
    * `GET` /user/{username}: Retorno de usuario por username.
    * `PUT` /user/{username}: Actualización de usuario por username.
    * `DELETE` /user/{username}: Eliminar un usuario por `username`.
    * `GET` /user/login: Login de un usuario al sistema.
    * `GET` /user/logout: Logout de un usuario del sistema.
    * `POST` /user/createWithArray: Creación de un array de usuarios en Pet Store dado un array.
    * `POST` /user: Creación de un usuario en Pet Store.

## 3. Ejecución de las Pruebas

Todas las pruebas se ejecutan desde la línea de comandos, ubicándote en la raíz del proyecto. El proyecto permite ejecutar las pruebas según el Feature (Store o User), ID de prueba específico o por tipo de flujo (Happy Path o Unhappy Path). 

## Feature Store

Para ejecutar el conjunto completo de pruebas del feature Store, utiliza el siguiente comando. Este comando ejecuta todos los escenarios etiquetados con `@store` en el entorno (`dev`).

```bash
mvn clean test -Dtest=StoreTest -Dkarate.options="--tags @store" -Dkarate.env=dev
```
### Ejecutar por test específico

Para ejecutar un test específico del feature Store, utiliza el siguiente comando, indicando el test que se desea ejecutar en -Dkarate.options="--tags @". 

```bash
mvn clean test -Dtest=StoreTest -Dkarate.options="--tags @TEST-1" -Dkarate.env=dev
```

### Ejecutar por tipo de flujo

Para ejecutar por tipo de flujo, utiliza los siguientes comandos, dependiendo del tipo de flujo deseado.

```bash
# Happy Paths
mvn clean test -Dtest=StoreTest -Dkarate.options="--tags @happypath" -Dkarate.env=dev

# Unhappy Paths
mvn clean test -Dtest=StoreTest -Dkarate.options="--tags @unhappypath" -Dkarate.env=dev
```

## Feature User

Para ejecutar el conjunto completo de pruebas del feature User, utiliza el siguiente comando. Este comando ejecuta todos los escenarios etiquetados con `@user` en el entorno (`dev`).

```bash
mvn clean test -Dtest=UserTest -Dkarate.options="--tags @user" -Dkarate.env=dev
```
### Ejecutar por test específico

Para ejecutar un test específico del feature User, utiliza el siguiente comando, indicando el test que se desea ejecutar en -Dkarate.options="--tags @".

```bash
mvn clean test -Dtest=UserTest -Dkarate.options="--tags @TEST-1" -Dkarate.env=dev
```

### Ejecutar por tipo de flujo

Para ejecutar por tipo de flujo, utiliza los siguientes comandos, dependiendo del tipo de flujo deseado.

```bash
# Happy Paths
mvn clean test -Dtest=UserTest -Dkarate.options="--tags @happypath" -Dkarate.env=dev

# Unhappy Paths
mvn clean test -Dtest=UserTest -Dkarate.options="--tags @unhappypath" -Dkarate.env=dev
```




