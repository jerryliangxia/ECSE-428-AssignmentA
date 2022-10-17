# Jerry Xia 260917329

Feature: Remove Players From match

  As a player
  I would like to edit my match list
  So that I can remove players from my match.

  Scenario Outline: (Normal Flow) Player removes other player from match
    Given a match of players <match>
    And an admin of the match <admin>
    When the admin removes <toBeRemoved>
    Then <toBeRemoved> shall no longer be in the match

    Examples:
      | match                              | admin   | toBeRemoved |
      | Player1, Player2, Player3, Player4 | Player1 | Player2     |

  Scenario Outline: (Normal Flow) Player removes multiple players from match
    Given a match of players <match>
    And an admin of the match <admin>
    When the admin removes the players <toBeRemovedList> from the match
    Then <toBeRemovedList> shall no longer be in the match

    Examples:
      | match                              | admin   | toBeRemoved      |
      | Player1, Player2, Player3, Player4 | Player1 | Player2, Player3 |
    
  Scenario: (Error Flow) Player tries to remove themselves from match
    Given a match of players "Player1, Player2, Player3"
    And an admin of the match who is "Player1"
    When the admin attempts to remove themselves from the match
    Then an error message is created with text "Cannot remove oneself from the match!"