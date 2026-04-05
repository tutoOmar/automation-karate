Feature: PUT method

  Background:
    * url 'https://automationexercise.com/api'

  Scenario: Update data in user and validate data
    * def userUtils = call read('classpath:utils/user-utils.js')
  #-- Obtain current user data
    * def userEmailExpected = 'ifritmaster360@gmail.com'
    Given path '/getUserDetailByEmail'
    And param email = userEmailExpected
    When method get
    Then status 200
    And match response.responseCode == 200
    * def currentTitle = response.user.title
    * def currentName = response.user.name
  #-- Update account with new title
    * def newTitle = userUtils.generateUniqueTitle(currentTitle)
    Given path '/updateAccount'
    And form field name = currentName
    And form field email = userEmailExpected
    And form field password = 'Omar1234'
    And form field title = newTitle
    When method put
    Then status 200
    And match response.responseCode == 200
    And match response.message contains 'User updated!'
  #-- Verify the title was updated
    Given path '/getUserDetailByEmail'
    And param email = userEmailExpected
    When method get
    Then status 200
    And match response.responseCode == 200
    * def updatedTitle = response.user.title
    And match updatedTitle == newTitle
    And match updatedTitle != currentTitle