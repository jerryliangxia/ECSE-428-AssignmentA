# Jerry Xia 260917329

Feature: Log out of Account

  As a user
  I would like to log out of my user account
  So I can prevent others from using my account.

  Scenario: (Normal Flow) User successfully logs out of their account
    Given a user who exists and is logged into the system
    When the user requests to log out
    Then the account will be logged out of the system and no longer have access

  Scenario: (Alternative Flow) After being idle for one hour the user will be logged out automatically
    Given a user who exists and is logged into the system
    When the user is inactive for exactly one hour
    Then the account will be logged out of the system and no longer have access