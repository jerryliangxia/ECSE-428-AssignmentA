# Jerry Xia 260917329

Feature: Leave Joined match

  As a player
  I would like to leave a match I have joined
  So I can stop playing or join another match.

  Background:
    Given the following player accounts exist in the system:
      | username |
      | Player1  |
      | Player2  |
    Given the following matches exist in the system:
      | matchId | admin   |
      | 123456  | Player1 |

  Scenario: (Normal Flow) Player who is not admin leaves a match
    Given "Player2" is logged into the system
    And "Player2" is in an active match with matchId "123456"
    And "Player2" is not the admin of the match
    When "Player2" leaves the match with matchId "123456"
    Then "Player2" shall no longer be in the match with matchId "123456"

  Scenario: (Normal Flow) Player leaves the match leaving no real players in the match
    Given "Player1" is logged into the system
    And "Player2" is in the match with matchId "123456"
    And no game is active in the match with matchId "123456"
    When "Player2" decides to leave the match with matchId "123456"
    Then "Player2" shall no longer be in the match with matchId "123456"
    And the match with matchId "123456" shall still persist in the system

  Scenario: (Normal Flow) Admin leaves the match while other players present in the game
    Given "Player1" is logged into the system
    And "Player1" is in the match with matchId "123456"
    And "Player2" is in a with matchId "123456"
    And match with matchId "123456" is active
    When "Player1" requests to leave match with matchId "123456"
    Then "Player1" shall be removed from the match with matchId "123456"
    And "Player2" shall become the new host

  Scenario: (Alternative Flow) Admin leaves a match while bots are present in the game
    Given "Player1" is logged into the system
    And "Player1" is in an active match with matchId "123456"
    When "Player1" decides to leave match with matchId "123456"
    Then "Player1" shall be removed from the match with matchId "123456"
    And the match with matchId "123456" shall be removed from the system

  Scenario: (Alternative Flow) Admin leaves the match while the game is inactive with players
    Given "Player1" is logged into the system
    And "Player2" is logged into the system
    And "Player1" is in the match with matchId "123456"
    And "Player2" is in the match with matchId "123456"
    And no game is active in match with matchId "123456"
    When "Player1" requests to leave match with matchId "123456"
    Then "Player1" shall be removed from the match with matchId "123456"
    And "Player2" shall become the new host

  Scenario: (Alternative Flow) Admin leaves the match while the game is inactive without players
    Given "Player1" is logged into the system
    And "Player1" is in the match with matchId "123456"
    And no game is active in parry with matchId "123456"
    When "Player1" decides to leave match "123456"
    Then "Player1" shall no longer be in the match "123456"
    And the match with matchId "123456" shall be removed from the system