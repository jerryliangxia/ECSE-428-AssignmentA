# Jerry Xia 260917329

Feature: Player Creates Game match

  As a player
  I would like to create a game match
  So I can play with my friends and/or other players.

  Background:
    Given the following player accounts exist in the system:
      | username |
      | Player1  |

  Scenario: (Normal Flow) Player creates a match
    Given "Player1" is logged into the system
    And "Player1" has no active matches going
    When "Player1" requests to create a new game match
    Then a new game match shall be created under the profile of "Player1"
    And an invite link shall be provided to "Player1"

  Scenario: (Error Flow) Player creates a match while ongoing match exists
    Given "Player1" is logged into the system
    And "Player1" has an active match going
    When "Player1" requests to create a new match
    Then an error is generated with message "You already have an match"
    And no new match shall be created under the profile of "Player1"
    And "Player1" still has an active match