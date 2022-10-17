# Jerry Xia 260917329

Feature: Create Account

  As a user
  I would like to create a user account
  So I can save game preferences and play the game.

  Scenario Outline: (Normal Flow) User uses email to create a user account
    Given a user with email <email>
    When the user inputs <email> as their email and <password> as their password
    Then a user account is created in the system

    Examples:
    | email                   | password |
    | jerryliangxia@gmail.com | 1234     |
    | jerrylxia@gmail.com     | 12345    |


  Scenario: (Error Flow) Users attempts to create an account with invalid email format
    Given that no user is logged in
    When the user tries to create an account with email "IncorrectFormat!"
    Then an error message is created with text "Invalid email format"

  Scenario: (Error Flow) User attempts to create an account with pre-existing email
    Given a user with email "jerrylxia@gmail.com"
    And an existing user account with email "jerrylxia@gmail.com"
    When the user attempts to create an account with email "jerrylxia@gmail.com"
    Then an error message is created with text "This email already exists."

  Scenario: (Error Flow) User attempts to create an account with invalid password format
    Given that no user is logged in
    When the user tries to create an account with email "jerrylxia@gmail.com" and password " "
    Then an error message is created with text "Invalid password format"