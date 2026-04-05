Feature: Post method products

  Background:
    * url 'https://automationexercise.com/api'

    Scenario: POST on productsList should return 405 but return 200
    Given path '/productsList'
    When method post
    Then status 200