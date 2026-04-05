Feature: PUT method for user

  Background:
    * url 'https://automationexercise.com/api'

  Scenario: Update data in user and validate data
  ## Obtain user data first
    * def userEmailExpected = 'ifritmaster360@gmail.com'
    Given path '/getUserDetailByEmail'
    And param email = userEmailExpected
    When method get
    Then status 200
    And match response.responseCode == 200
    * def city = response.user.name
  ## Updating user name
    * def newUserName = 'newName'
    Given path '/updateAccount'
    And form field name = newUserName
    And form field email = 'ifritmaster360@gmail.com'
    And form field password = 'Omar1234'
    When method put
    Then status 200
    And match response.responseCode == 200
    And match response.message contains 'User updated!'
  ## Obtain user data first
    Given path '/getUserDetailByEmail'
    And param email = userEmailExpected
    When method get
    Then status 200
    And match response.responseCode == 200
    * def secondUserName = response.user.name
    And match secondUserName == newUserName