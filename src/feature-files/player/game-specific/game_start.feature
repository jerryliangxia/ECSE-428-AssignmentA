# Jerry Xia 260917329

Feature: Start the game

  As a player
  I would like to start a game of Monopoly
  So I can play Monopoly on the system.

  Scenario Outline: (Normal Flow) Player starts a game with other players
    Given a match exists with matchId <matchId>
    And a match of players in the system <players>
    And spectators <spectators> are present
    And an admin <admin> of the match with matchId <matchId>
    When the player who is <admin> starts the game
    Then all players shall each have a unique starter piece
    And each player shall have $1500 of in-game currency
    And the remaining money shall be in the bank

    Examples:
    | players                   | spectators | admin   | matchId |
    | Player1, Player2, Player3 | S1, S2, S3 | Player1 | 123456  |

  Scenario: (Error Flow) Admin starts the game by themself with spectators
    Given a match exists with matchId "123456"
    And spectators "S1 ,S2, S3"
    And only the admin of the match "Player1" is in
    When "Player1" attempts to start the game
    Then an error message is created with text "Find more players to play Monopoly!"

  Scenario: (Error Flow) Admin starts the game by themself without spectators
    Given a match exists with matchId "123456"
    And no spectators are present
    And only the admin of the match "Player1" is in
    When "Player1" attempts to start the game
    Then an error message is created with text "Find more players to play Monopoly!"