@regresion
Feature: Automatizar el acceso a ordenes de Pet Store

  Background:
    * url apiPetStore
    * def OrderJSON = read('classpath:ArchivosJSON/storeJSON/order.json')
    * def ErrorOrderJSON = read('classpath:ArchivosJSON/storeJSON/orderError.json')

  @TEST-1 @happypath
  Scenario: Retorno de inventario de mascotas por estatus - OK
    Given path 'store', 'inventory'
    When method get
    Then status 200
    And print response

  @TEST-2 @happypath
  Scenario: Realizar un pedido para la mascota - OK
    Given path 'store', 'order'
    And request OrderJSON
    When method post
    Then status 200
    And print response

  @TEST-3 @happypath
  Scenario: Busqueda por id de una orden de compra - OK
    * def idOrder = 1
    Given path 'store', 'order', idOrder
    When method get
    Then status 200
    And print response
    And match response.id == 1

  @TEST-4 @happypath
  Scenario: Eliminar compra por id - OK
    * def idOrder = 1
    Given path 'store', 'order', idOrder
    When method delete
    Then status 200
    And print response

  @TEST-5 @unhappypath
  Scenario: Realizar un pedido para la mascota invalido - ERROR 500
    Given path 'store', 'order'
    And request ErrorOrderJSON
    When method post
    Then status 500
    And print response

  @TEST-6 @unhappypath
  Scenario: Busqueda por id que no existe - ERROR 404
    * def idOrder = 8329
    Given path 'store', 'order', idOrder
    When method get
    Then status 404
    And print response

  @TEST-7 @unhappypath
  Scenario: Eliminar compra por id inexistente - ERROR 404
    * def idOrder = -1234
    Given path 'store', 'order', idOrder
    When method delete
    Then status 404
    And print response