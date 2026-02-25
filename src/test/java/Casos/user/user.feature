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
  Scenario: Verificar la actualización de usuario por nombre de usuario - OK
    * def UpdateUserJSON = read('classpath:ArchivosJSON/userJSON/updateUser.json')
    Given path 'user', CreateUserJSON.username
    And request UpdateUserJSON
    When method put
    Then status 200
    And print response

  @TEST-4 @happypath
  Scenario: Eliminar por username de usuario - OK
    * def username = 'persona2'
    Given path 'user', username
    When method delete
    Then status 200
    And print response

  @TEST-5 @happypath
  Scenario: Login de un usuario al sistema - OK
    Given path 'user', 'login'
    And param username = 'persona2'
    And param password = 'contraseña2'
    When method get
    Then status 200
    And print response

  @TEST-6 @happypath
  Scenario: Logout de un usuario al sistema - OK
    Given path 'user', 'logout'
    When method get
    Then status 200
    And print response

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