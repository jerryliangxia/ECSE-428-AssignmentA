# Jerry Xia 260917329

Feature: Player Can Play Against System Bots

  As a player
  I would like to play against the system bots
  So I can play without friends.

  Background:
    Given the following player accounts exist in the system:
      | username |
      | Player1  |

  Scenario Outline: (Normal Flow) Player inputs valid number of bots
    Given <player> is logged into the system
    When <player> requests to play a game with <n> bots
    Then a game shall be created with <player> and <n> bots

    Examples:
      | player  | n |
      | Player1 | 2 |
      | Player2 | 3 |

  Scenario: (Error Flow) Player inputs too high number of bots
    Given "Player1" is logged into the system
    When "Player1" requests to play a game with "4" bots
    Then an error message shall be created with text "Too high number of bots!"

  Scenario: (Error Flow) Player inputs invalid number of bots
    Given "Player1" is logged into the system
    When "Player1" requests to play a game with "-1" bots
    Then an error message shall be created with text "Invalid number of bots!"