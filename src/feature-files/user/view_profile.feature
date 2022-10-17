# Jerry Xia 260917329

Feature: View User's Profile

  As a user
  I would like to view a user's profile
  So I can see all of their statistics.

  Background:
    Given the following user accounts exist in the system:
      | username |
      | User1    |
      | User2    |

  Scenario: (Normal Flow) View existing user profile
    Given "User1" is logged into the system
    When "User1" requests to view the profile of "User2"
    Then the statistics of "User2" can be viewed by the user

  Scenario: (Alternative Flow) View own user profile
    Given "User1" is logged into the system
    When "User2" attempts to view their own profile
    Then the statistics of "User2" can be viewed by the user

  Scenario: (Error Flow) User attempts to view nonexisting user account
    Given "User1" is logged into the system
    When "User1" attempts to view the profile of "User3"
    Then an error message shall be created with text "User not found!"