# Jerry Xia 260917329

Feature: Player rolls dice

  As a player
  I would like to roll two six-faced die
  So I can begin my turn.

  Scenario Outline: (Normal Flow) Player rolls any two numbers while outside of jail
    Given that the player is not in jail
    And it is the player's turn
    When the player rolls numbers <numberList>
    Then the player moves the sum of the elements in <numberList>

    Examples:
    | numberList |
    | 1,2        |
    | 4,2        |
    | 2,2        |
    | 1,1        |

  Scenario Outline: (Alternative Flow) Player rolls two same numbers while inside of jail
    Given that the player is in jail
    And it is the player's turn
    When the player rolls numbers <numberListEqual>
    Then the player is no longer in jail
    And it is still the player's turn
    And the player is able to still roll the die

    Examples:
    | numberListEqual |
    | 1,1             |
    | 2,2             |

  Scenario Outline: (Alternative Flow) Player rolls two different numbers while inside of jail
    Given that the player is in jail
    And it is the player's turn
    When the player rolls numbers <numberListNotEqual>
    Then the player remains in jail
    And it becomes the next player's turn

    Examples:
    | numberListNotEqual |
    | 1,2                |
    | 4,2                |