# Jerry Xia 260917329

Feature: Moderator Views Player Reports

  As a moderator
  I would like to view player reports
  So I can evaluate whether or not to ban the player.

  Background:
    Given the following player accounts exist in the system:
      | username |
      | Player1  |
    Given the following moderator accounts exist in the system:
      | username |
      | Mod1     |

  Scenario: (Normal Flow) View existing player profile reports
    Given "Mod1" is logged into the system
    When "Mod1" requests to view the profile of "Player1"
    Then the reports of "Player1" can be viewed by the player

  Scenario: (Error Flow) Moderator attempts to view nonexisting player account
    Given "Mod1" is logged into the system
    When "Mod1" attempts to view the profile of "Player2"
    Then an error message shall be created with text "Player not found!"