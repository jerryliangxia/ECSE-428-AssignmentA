# Jerry Xia 260917329

Feature: Join match with matchId to play a game

  As a player
  I would like to join a specific match
  So that I can play games with friends or anonymously.

  Background:
    Given the following player accounts exist in the system:
      | username |
      | Player1  |
      | Player2  |
      | Player3  |
    Given the following matches exist in the system:
      | matchId | admin   |
      | 123456  | Player1 |

  Scenario: (Normal Flow) Player joins a match using a matchId
    Given "Player2" is logged into the system
    And match with match id "123456" has at least one spot open
    When "Player2" chooses to join the match with matchId "123456"
    Then "Player2" shall successfully join the match with matchId "123456"

  Scenario: (Alternative Flow) Player joins a match through their managed friend list
    Given "Player3" is logged into the system
    And "Player3" has "Player2" on their managed friend list
    And "Player2" has "Player3" on their managed friend list
    When "Player3" joins the match of "Player2" with matchId "123456" from the friend list
    Then "Player3" shall be added to the match with matchId "123456"

  Scenario: (Error Flow) Player requests to join a match with an invalid matchId
    Given "Player1" is logged into the system
    And match with matchId "123456" has at least one spot open
    When "Player1" chooses to join the match with matchId "123456"
    Then an error message shall be created with text "Invalid matchID!"

  Scenario: (Error Flow) Player unsuccessfully joins a partt that is full
    Given "Player1" is logged into the system
    And match "123456" has no spots open
    When "Player1" requests to join match with matchId "123456"
    Then an error message shall be created with text "match is full!"