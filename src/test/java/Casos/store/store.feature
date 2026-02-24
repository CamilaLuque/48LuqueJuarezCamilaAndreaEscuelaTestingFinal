@regresion
Feature: Automatizar el acceso a ordenes de Pet Store

  Background:
    * url apiPetStore
    * def OrderJSON = read('classpath:ArchivosJSON/storeJSON/order.json')

  @TEST-1 @happypath
  Scenario: Verificar el retorno de inventario de mascotas por estatus - OK
    Given path 'store', 'inventory'
    When method get
    Then status 200
    And print response

  @TEST-2 @happypath
  Scenario: Verificar que se realice un pedido para la mascota - OK
    Given path 'store', 'order'
    And request OrderJSON
    When method post
    Then status 200
    And print response

  @TEST-3 @happypath
  Scenario Outline: Verificar la busqueda por id de una orden de compra - OK
    Given path 'store/', 'order' + '<idOrder>'
    When method get
    Then status 200
    And print response

    Examples:
      | idOrder |
      | 1       |
      | 2       |
      | 3       |

  @TEST-4 @happypath
  Scenario Outline: Eliminar compra por id - OK
    Given path 'store/', 'order' + '<idOrder>'
    When method delete
    Then status 200
    And print response

    Examples:
      | idOrder |
      | 1       |
      | 2       |
      | 3       |
