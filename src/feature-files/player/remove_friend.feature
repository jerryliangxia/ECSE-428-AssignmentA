# Hong Yi Meng 260978023
# Kalvin Khuu 260983539

Feature: Remove Friends

  As a player
  I would like to remove a friend from my managed friend list
  So that I no longer have this friend on this list.

  Background:
    Given the following player accounts exist in the system:
      | username |
      | Player1  |
      | Player2  |

  Scenario: (Normal Flow) Player removes other player from friend list
    Given "Player1" is logged into the system
    And "Player1" is friends with "Player2"
    When "Player1" attempts to remove "Player2" as a friend
    Then "Player2" shall no longer be on the friend list of "Player1"
    And "Player1" shall no longer be on the friend list of "Player2"