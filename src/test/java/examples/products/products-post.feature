Feature: Post method products

  Background:
    * url 'https://automationexercise.com/api'

    Scenario: POST on productsList should return 405 but return 200
      Given path '/productsList'
      When method post
      Then status 200

    Scenario: POST to verify Login with valid details
      * def data_for_login =
      """
      {
        "email": "test@test.com",
        "password":/verifyLogin
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
        <email>test@test.com</email>
        <password>Omarito</password>
      </user>
    """
    Given path '/verifyLogin'
    And header Content-Type = 'application/xml'
    And request data_for_login_xml
    When method post
    Then status 415
    And match response.detail contains 'Unsupported media type'

