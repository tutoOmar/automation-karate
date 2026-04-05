Feature: Products

  Background:
    * url 'https://automationexercise.com/api'

  Scenario Outline: Validate endpoints
    Given path <endpoint>
    When method get
    Then status 200

    Examples:
      | endpoint  |
      |'/productsList'|
      |'/brandsList'  |

  Scenario: Get productos and validate data types in the json
    Given path '/productsList'
    When method get
    Then status 200
    And match response != null
    And match response.products != null
    And match each response.products ==
    """
    {
      "id":"#number",
      "name":"#string",
      "price":"#string",
      "brand":"#string",
      "category":{
        "usertype":
        {
          "usertype":"#string",
        },
        "category":"#string",
      }
    }
    """

  Scenario: Get products with invalid path
    Given path '/noExistPath'
    When method get
    Then status 404