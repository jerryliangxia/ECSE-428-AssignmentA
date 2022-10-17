# Jerry Xia 260917329

Feature: Edit Account Details

  As a user
  I would like to edit my account details
  So I can update my username or password.

  Scenario Outline: (Normal Flow) User requests to change their password
    Given a user that exists with email <email> and password <password>
    When the user changes their password to <newPassword>
    Then the user will have <newPassword> as their password

    Examples:
      | email                   | password     | newPassword  |
      | jerrylxia@gmail.com     | oldPassword1 | newPassword1 |
      | jerryliangxia@gmail.com | oldPassword1 | newPassword2 |
    
  Scenario Outline: (Normal Flow) User requests to change their email address
    Given that a user with email <email> and password <password> exist in the system
    When the user changes their email to <newEmail>
    Then the user will have <newEmail> as their email

    Examples:
      | email                   | password  | newEmail             |
      | jerrylxia@gmail.com     | password1 | jerrylxia1@gmail.com |
      | jerryliangxia@gmail.com | password2 | jerrylxia2@gmail.com |

  Scenario: (Error Flow) User requests email change with empty string
    Given a user exists with email "jerrylxia@gmail.com" and password "password1"
    When the user requests to change their password to ""
    Then an error is created with text "New email address cannot be empty"

  Scenario: (Error Flow) User requests password change with empty string
    Given a user exists with email "jerrylxia@gmail.com" and password "password1"
    When the user requests to change their password to ""
    Then an error is created with text "New password cannot be empty"

  Scenario: (Error Flow) User requests an email address change with illegal characters
    Given a user exists with email "jerrylxia@gmail.com" and password "password1"
    When the user requests to change their email to "[;]:'"
    Then an error is created with text "New email address contains illegal characters"

  Scenario: (Error Flow) User requests an email address change with invalid email format
    Given a user exists with email "jerrylxia@gmail.com" and password "password1"
    When the user requests to change their email to "jerry"
    Then an error is created with text "New email address is in an invalid format"

  Scenario: (Error Flow) User requests a password change with illegal characters
    Given a user exists with email "jerrylxia@gmail.com" and password "password1"
    When the user requests to change their password to "[;]:'"
    Then an error is created with text "New password contains illegal characters"