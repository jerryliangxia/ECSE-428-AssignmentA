# Jerry Xia 260917329

Feature: Report player

  As a user
  I would like to report a player
  So moderators can review and ban the player.

  Background:
    Given the following player accounts exist in the system:
      | username |
      | Player1  |

  Scenario Outline: (Normal Flow) User successfully report a player
    Given <reporter> is logged into the system
    When <reporter> requests to report <reportee> with text <report>
    Then <reportee> shall have this report of <report>
    And a message shall be displayed <message>

    Examples:
    | reporter | reportee | report     | message                        |
    | Player1  | Player2  | Bad player | Successfully reported Player2! |
    | Player2  | Player1  | Cheats     | Successfully reported Player1! |

  Scenario: (Error Flow) User unsuccessfully reports nonexistent player
    Given "Player1" is logged into the system
    When "Player1" requests to report "Player3" with text "Bad player"
    Then an error message is created with text "Player not found!"