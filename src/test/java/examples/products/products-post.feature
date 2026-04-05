Feature: Post method products

  Background:
    * url 'https://automationexercise.com/api'

    Scenario: POST on productsList should return 405 in responseCode and return 200 in status
      Given path '/productsList'
      When method post
      Then status 200
      And match response.responseCode == 405
      And match response.message contains 'This request method is not supported'

    Scenario: POST to verify Login with valid details but Json Request
      * def data_for_login =
      """
      {
        "email": "ifritmaster360@gmail.com",
        "password":"Omar1234"
      }
      """
      Given path '/verifyLogin'
      And request data_for_login
      When method post
      Then status 200
      And match response.responseCode == 400
      And match response.message contains 'Bad request'

  Scenario: POST to verify Login with valid details but in format XML
    * def data_for_login_xml =
    """
      <user>
        <email>ifritmaster360@gmail.com</email>
        <password>Omar1234</password>
      </user>
    """
    Given path '/verifyLogin'
    And header Content-Type = 'application/xml'
    And request data_for_login_xml
    When method post
    Then status 415
    And match response.detail contains 'Unsupported media type'

  Scenario: POST with valid Login Credentials and right content type method in header
    Given path '/verifyLogin'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And form field email = 'ifritmaster360@gmail.com'
    And form field password = 'Omar1234'
    When method post
    Then status 200
    And match response.responseCode == 200
    And match response.message contains 'User exists!'

  Scenario: POST with invalid Login Credentials and right content type method in header
    Given path '/verifyLogin'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And form field email = 'bad-mail@gmail.com'
    And form field password = 'BadPassWord'
    When method post
    Then status 200
    And match response.responseCode == 404
    And match response.message contains 'User not found!'

  Scenario: Search product with form-urlencoded
    Given path '/searchProduct'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And form field search_product = 'top'
    When method post
    Then status 200
    And match response.products != null

  Scenario: Search product without parameter
    Given path '/searchProduct'
    When method post
    Then status 200
    And match response.responseCode == 400
    And match response.message contains 'Bad request, search_product parameter is missing in POST request.'