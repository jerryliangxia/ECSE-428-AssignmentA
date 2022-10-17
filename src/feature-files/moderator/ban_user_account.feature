# Jerry Xia 260917329

Feature: Ban a user's account from the system

  As a moderator
  I would like to ban a user account from the system
  So I can remove their account.

  Scenario Outline: (Normal Flow) Moderator bans player account from the system
    Given a moderator <moderator> who is logged into the system
    And a player account that exists in the system as <playerAccount> with player <data>
    When the moderator bans the player account
    Then the player's account is removed

    Examples:
      | moderator | playerAccount | data             |
      | mod       | player        | player1, player2 |

  Scenario: (Error Flow) Moderator attempts to ban a nonexistent player from the system
    Given a moderator account that exists and is logged in as "mod"
    And a player's data {player1, player2}
    When the moderator bans the player's account "player3"
    Then an error message is created with the text "Player account not found!"