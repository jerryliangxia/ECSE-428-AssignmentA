# Jerry Xia 260917329

Feature: Spectate Games

  As a spectator
  I would like to spectate a match
  So I can watch the game without participating or creating an account.

  Background:
    Given the following matches exist in the system:
      | matchId | admin   |
      | 123456  | Player1 |

  Scenario: (Normal Flow) Spectators successfully joins an existing game
    Given a game with matchId "123456"
    And a spectator with spectatorId "S1"
    When a spectator joins a match with matchId "123456"
    Then then the spectator with spectatorId "S1" shall be added to the match's spectator list

  Scenario: (Alternative Flow) Spectators successfully joins an existing game that hasn't started
    Given a game with matchId "123456"
    And a spectator with spectatorId "S1"
    And the match with matchId "123456" hasn't started
    When a spectator joins a match with matchId "123456"
    Then then the spectator with spectatorId "S1" shall be added to the match's spectator list

  Scenario: (Error Flow) Spectators successfully joins a nonexistent match
    Given a spectator with spectatorId "S1"
    When a spectator joins a match with matchId "654321"
    Then an error message is created with text "Match not found"