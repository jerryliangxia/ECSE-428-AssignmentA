# Jerry Xia 260917329

Feature: Sell properties

  As a player
  I would like to sell properties
  So I can make profit from them and try to win the game.

  Scenario Outline: (Normal Flow) Player sells property
    Given it is the turn of <player>
    And the player's property list is <properties>
    And the player's balance is <balance>
    And the property <property> is within <properties>
    When the player requests to sell the property <property> with cost <propertyCost>
    Then the player shall have <newProperties> as their list of properties
    And the player shall have a balance of <newBalance>

    Examples:
      | player  | balance | properties  | profit | property | newProperties | newBalance |
      | Player1 | 400     | A,B,C,D,E,F | 200    | F        | A,B,C,D,E     | 600        |
      | Player2 | 500     | A,B,C,D,E,F | 300    | E        | A,B,C,D,F     | 800        |
      | Player3 | 600     | A,B,C,D,E,F | 400    | D        | A,B,C,E,F     | 1000       |

    Scenario: (Error Flow) Player sells property that is not theirs
      Given it is the turn of "Player1"
      And the player's property list is "B,C"
      And the property "A" is not within "B,C"
      When the player requests to sell the property "A" with cost "200"
      Then an error message is created with text "You cannot sell a property you do not own!"