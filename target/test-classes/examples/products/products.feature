Feature: Products API - GET /api/productsList
  Validates the automation exercise products endpoint

  Background:
    * url 'https://automationexercise.com/api'

  Scenario: GET all products returns status 200
    Given path 'productsList'
    When method get
    Then status 200

  Scenario: Response body contains responseCode 200 and a non-empty products list
    Given path 'productsList'
    When method get
    Then status 200
    And match response.responseCode == 200
    And match response.products == '#[] #notempty'

  Scenario: Each product has the required fields with correct types
    Given path 'productsList'
    When method get
    Then status 200
    And match each response.products ==
      """
      {
        "id":       "#number",
        "name":     "#string",
        "price":    "#string",
        "brand":    "#string",
        "category": {
          "usertype": { "usertype": "#string" },
          "category": "#string"
        }
      }
      """

  Scenario: First product matches the known Blue Top entry
    Given path 'productsList'
    When method get
    Then status 200
    * def firstProduct = response.products[0]
    And match firstProduct.id    == 1
    And match firstProduct.name  == 'Blue Top'
    And match firstProduct.brand == 'Polo'
    And match firstProduct.category.usertype.usertype == 'Women'

  Scenario: Products list contains items for all user types (Women, Men, Kids)
    Given path 'productsList'
    When method get
    Then status 200
    * def usertypes = $response.products[*].category.usertype.usertype
    And match usertypes contains 'Women'
    And match usertypes contains 'Men'
    And match usertypes contains 'Kids'
