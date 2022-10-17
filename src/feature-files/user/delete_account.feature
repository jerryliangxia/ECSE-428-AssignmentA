# Jerry Xia 260917329

Feature: Delete Player Account

  As a user
  I would like to delete my account
  So I can remove my data from the database.

  Scenario: (Normal Flow) User deletes their user account successfully
    Given a user who is logged in with email <email>
    When the user with email <email> deletes their account
    Then the account shall no longer exist within the database