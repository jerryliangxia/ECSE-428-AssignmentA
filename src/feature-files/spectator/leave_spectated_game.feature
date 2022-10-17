# Jerry Xia 260917329

Feature: Leave Spectated match

  As a spectator
  I would like to leave a match I am spectating
  So I can stop spectating or spectate another match.

  Background:
    Given the following matches exist in the system:
      | matchId | admin   |
      | 123456  | Player1 |

  Scenario: (Normal Flow) Spectators successfully leaves an existing game
    Given a game with matchId "123456"
    And a spectator with spectatorId "S1"
    And the spectator with spectatorId "S1" is in the match's spectating list
    When a spectator requests to leave the match with matchId "123456"
    Then "S1" shall no longer be spectating the match with matchId "123456"
    And the match with matchId "123456" shall still persist in the system