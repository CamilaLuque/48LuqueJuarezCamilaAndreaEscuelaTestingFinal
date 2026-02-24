@regresion
Feature: Automatizar el backend de Pet Store

  Background:
    * url apiPetStore
    * def CreateUserJSON = read('classpath:ArchivosJSON/userJSON/createUser.json')
    * def CreateUserArrayJSON = read('classpath:ArchivosJSON/userJSON/createUserArray.json')

  @TEST-1 @happypath
  Scenario: Verificar la creacion de una lista de usuarios en Pet Store por una lista - OK
    Given path 'user', 'createWithList'
    And request CreateUserArrayJSON
    When method post
    Then status 200
    And match response.message == "ok"
    And print response

  @TEST-2 @happypath
  Scenario Outline: Verificar la obtención de usuario por nombre de usuario - OK
    Given path 'user', '<username>'
    When method get
    Then status 200
    And match response.username == '<username>'
    And print response

    Examples:
      | username    |
      | CamilaLuque |
      | persona2    |
      | persona3    |

  @TEST-3 @happypath
  Scenario Outline: Verificar la actualización de usuario por nombre de usuario - OK
    Given path 'user', '<username>'
    * set CreateUserJSON.username = '<usernameNuevo>'
    And request CreateUserJSON
    When method put
    Then status 200
    And print response

    Examples:
      | username    | usernameNuevo |
      | CamilaLuque | camilaLuque   |
      | persona2    | Persona2      |
      | persona3    | Persona3      |

  @TEST-7 @happypath
  Scenario: Verificar la creacion de una lista de usuarios en Pet Store por un array - OK
    Given path 'user', 'createWithArray'
    And request CreateUserArrayJSON
    When method post
    Then status 200
    And match response.message == "ok"
    And print response

  @TEST-8 @happypath
  Scenario: Verificar la creacion de un usuario en Pet Store - OK
    Given path 'user'
    And request CreateUserJSON
    When method post
    Then status 200
    And print response

  @TEST-4 @happypath
  Scenario Outline: Verificar la busqueda por id de mascota - OK
    Given path 'store/' + '<idPet>'
    When method get
    Then status 200
    And print response

    Examples:
      | idPet |
      | 1     |
      | 19    |
      | 13    |

  @TEST-5 @happypath
  Scenario: Verificar la actualizacion por id de mascota - OK
    * def id = 1
    Given path 'store', id
    When method get
    Then status 200
    And print response

  @TEST-6 @happypath
  Scenario: Eliminar por id de mascota - OK
    * def id = 19
    Given path 'store', id
    When method delete
    Then status 200
    And print response

