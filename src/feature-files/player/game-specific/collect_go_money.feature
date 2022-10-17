# Jerry Xia 260917329

Feature: Player collects money from GO space

  As a player
  I would like to gain $200 upon passing the GO space
  So that I can obtain in-game currency and try to win the game.

  Background:
    Given that the following players exist in the system:
      | players          |
      | Player1, Player2 |
    Given that the following match exists:
      | matchId | players          |
      | 123456  | Player1, Player2 |

  Scenario: (Normal Flow) Player successfully passes by GO space
    Given a Player "Player1" who is playing the game
    When the player passes the GO space within their turn
    Then they shall receive $200 added to their in-game account

  Scenario: (Normal Flow) Player lands on GO space
    Given a player "Player1" who is playing the game
    When the player lands on the GO space within their turn
    Then they shall receive $200 added to their in-game account