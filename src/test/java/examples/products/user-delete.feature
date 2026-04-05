Feature: PUT method for user

  Background:
    * url 'https://automationexercise.com/api'

  Scenario: Full user lifecycle - Create, Get and Delete account
    * def userEmail = 'testeandoBien@test.com'
    * def userPassword = 'Test123'
      # --- Step 1: CREATE account ---
    Given path '/createAccount'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And form field name = 'testUser'
    And form field email = userEmail
    And form field password = userPassword
    And form field title = 'Mr'
    And form field birth_date = '15'
    And form field birth_month = '6'
    And form field birth_year = '1995'
    And form field firstname = 'Test'
    And form field lastname = 'User'
    And form field company = 'Sofka'
    And form field address1 = 'Calle 123'
    And form field address2 = 'Apto 456'
    And form field country = 'Colombia'
    And form field zipcode = '110111'
    And form field state = 'Cundinamarca'
    And form field city = 'Bogota'
    And form field mobile_number = '3001234567'
    When method post
    Then status 200
    And match response.responseCode == 201
    And match response.message == 'User created!'
    * print 'User created'

        # --- Step 2: GET user ---
    Given path '/getUserDetailByEmail'
    And param email = userEmail
    When method get
    Then status 200
    And match response.responseCode == 200
    And match response.user.email == userEmail
    * print 'User found:', response.user.name

    # --- Step 3: DELETE account ---
    Given path '/deleteAccount'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And form field email = userEmail
    And form field password = userPassword
    When method delete
    Then status 200
    And match response.responseCode == 200
    And match response.message == 'Account deleted!'
    * print 'User deleted'