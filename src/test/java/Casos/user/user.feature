@user
Feature: Automatizar el backend de Pet Store

  Background:
    * url apiPetStore
    * def CreateUserJSON = read('classpath:ArchivosJSON/userJSON/createUser.json')
    * def CreateUserArrayJSON = read('classpath:ArchivosJSON/userJSON/createUserArray.json')

  @TEST-1 @happypath
  Scenario: Creacion de una lista de usuarios en Pet Store por una lista - OK
    Given path 'user', 'createWithList'
    And request CreateUserArrayJSON
    When method post
    Then status 200
    And match response.message == "ok"
    And print response

  @TEST-2 @happypath
  Scenario Outline: Obtención de usuario por username - OK
    Given path 'user', '<username>'
    When method get
    Then status 200
    And match response.username == '<username>'
    And print response

    Examples:
      | username    |
      | persona2    |
      | persona3    |

  @TEST-3 @happypath
  Scenario: Actualización de usuario por username - OK
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
    And param username = 'persona3'
    And param password = 'contraseña3'
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
  Scenario: Creacion de una lista de usuarios en Pet Store por un array - OK
    Given path 'user', 'createWithArray'
    And request CreateUserArrayJSON
    When method post
    Then status 200
    And match response.message == "ok"
    And print response

  @TEST-8 @happypath
  Scenario: Creacion de un usuario en Pet Store - OK
    Given path 'user'
    And request CreateUserJSON
    When method post
    Then status 200
    And print response

  @TEST-9 @unhappypath
  Scenario Outline: Obtención de usuario por username inexistente - ERROR 404
    Given path 'user', '<username>'
    When method get
    Then status 404
    And match response.message == 'User not found'
    And print response

    Examples:
      | username    |
      | usuario2    |
      | usuario3    |

  @TEST-10 @unhappypath
  Scenario: Eliminar por username de usuario invalido - ERROR 404
    * def username = 'persona56'
    Given path 'user', username
    When method delete
    Then status 404
    And print response


