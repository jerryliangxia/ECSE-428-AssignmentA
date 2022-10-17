# Jerry Xia 260917329

Feature: Log into Account

  As a user
  I would like to log into my account
  So I can play games and view my statistics.

  Scenario Outline: (Normal Flow) User logs into their account successfully
    Given an existing user account with email <email> and password <password>
    When the corresponding user enters their details successfully
    Then the user will be logged into the system

    Examples:
      | email                   | password  |
      | jerrylxia@gmail.com     | password1 |
      | jerryliangxia@gmail.com | password2 |

  Scenario Outline: (Error Flow) User unsuccessfully login with the nonexisting email and any password
    Given a user account that exists with email <email> and password <password>
    When the user requests to log in with a nonexistent email <nonExistentEmail>
    Then an error message is created with text "Email does not exist. Please try again."

    Examples:
      | email                   | password  | nonExistentEmail       |
      | jerrylxia@gmail.com     | password1 | someaddress1@gmail.com |
      | jerryliangxia@gmail.com | password2 | someaddress2@gmail.com |
    
  Scenario Outline: (Error Flow) User unsuccessfully login with incorrect email and correct password
    Given a user account that exists with email <email> and password <password>
    When the user enters the correct password but wrong email <wrongEmail>
    Then an error message is created with text "Wrong Email and/or Password!"

    Examples:
      | email                   | password  | wrongEmail             |
      | jerrylxia@gmail.com     | password1 | someaddress1@gmail.com |
      | jerryliangxia@gmail.com | password2 | someaddress2@gmail.com |

  Scenario Outline: (Error Flow) User unsuccessfully login with correct email and incorrect password
    Given a user account that exists with email <email> and password <password>
    When the user enters the correct email but wrong password <wrongPassword>
    Then an error message is created with text "Wrong Email and/or Password!"

    Examples:
      | email                   | password  | wrongPassword     |
      | jerrylxia@gmail.com     | password1 | wrongPassword1    |
      | jerryliangxia@gmail.com | password2 | wrongPassword2    |