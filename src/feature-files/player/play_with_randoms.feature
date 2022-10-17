# Jerry Xia 260917329

Feature: Play With Random Players Online

  As a player
  I would like to play with random players online
  So I can play games without people on my friend list.

  Background:
    Given the following user-players exist in the system:
      | username |
      | Player1  |
      | Player2  |
      | Player3  |
      | Player4  |
    Given the following matchmaking pools exist in the system:
      | pool |
      | 123  |

  Scenario: (Normal Flow) Player gets grouped with 3 other players waiting in pool
    Given "Player1" is logged into the system
    And pool with poolId "123" exists in the system
    And "Player2" is logged into the system
    And "Player3" is logged into the system
    And "Player4" is logged into the system
    And "Player2" is in the matchmaking pool
    And "Player3" is in the matchmaking pool
    And "Player4" is in the matchmaking pool
    When "Player1" chooses to play with random players
    Then "Player1" shall join the matchmaking pool with poolId "123"
    And a game shall be created with "Player1", "Player2", "Player3" and "Player4".

  Scenario: (Alternative Flow) Not enough players in the matchmaking pool
    Given "Player1" is logged into the system
    And pool with poolId "123" exists in the system
    And "Player2" is in the matchmaking pool
    And "Player3" is in the matchmaking pool
    When "Player1" chooses to play with random players
    Then "Player1" shall join the matchmaking pool with poolId "123"
    And a message shall be displayed to the users "Player1 joined! Waiting for 1 more..."