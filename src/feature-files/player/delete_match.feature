# Jerry Xia 260917329

Feature: Delete match

  As a player
  I would like to delete my current match
  So that I can play another match or stop playing.

  Background:
    Given the following player accounts exist in the system:
      | username |
      | Player1  |
      | Player2  |
      | Player3  |
      | Player4  |
    Given the following matches exist in the system:
      | matchId | admin   |
      | 123456  | Player1 |

  Scenario: (Normal Flow) Admin deletes match after the game has ended
    Given "Player1" is logged into the system
    And "Player1" is in the match with matchId "123456"
    And "Player2" is in the match with matchId "123456"
    And "Player3" is in the match with matchId "123456"
    And "Player4" is in the match with matchId "123456"
    And the game in match "123456" is inactive
    And "Player1" is the winner
    When "Player1" requests to delete the match with matchId "123456"
    Then "Player2" shall be removed from the match with matchId "123456"
    And "Player3" shall be removed from the match with matchId "123456"
    And "Player4" shall be removed from the match with matchId "123456"
    And "Player1" shall be removed from the match with matchId "123456"
    And the match with matchId "123456" shall no longer exist

  Scenario: (Normal Flow) Admin deletes the match without an inactive game
    Given "Player1" is logged into the system
    And "Player1" is the admin of the match with matchId "123456"
    And "Player1" is in the match with matchId "123456"
    And "Player2" is in the match with matchId "123456"
    And no game is active in the match with matchId "123456"
    When "Player1" requests to delete match with matchId "123456"
    Then "Player2" shall be removed from the match with matchId "123456"
    And "Player1" shall be removed from the match with matchId "123456"
    And the match with matchId "123456" shall no longer exist

  Scenario: (Alternative Flow) Player deletes the match in an active game
    Given "Player1" is logged into the system
    And "Player1" is in the match with matchId "123456"
    And "Player2" is in the match with matchId "123456"
    And "Player3" is in the match with matchId "123456"
    And "Player4" is in the match with matchId "123456"
    And a game is in progress in the match with matchId "123456"
    When "Player1" requests to delete match with matchId "123456"
    Then "Player2" shall be removed from the match with matchId "123456"
    And "Player1" shall be removed from the match with matchId "123456"
    And the match with matchId "123456" shall no longer exist