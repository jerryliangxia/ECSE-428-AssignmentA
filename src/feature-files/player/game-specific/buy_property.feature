# Jerry Xia 260917329

Feature: Player buys Property

  As a player
  I would like to buy a property I have landed on
  So that I can profit from it and try to win the game.

  Scenario Outline: (Normal Flow) Player lands on property with proper balance.
    Given it is the turn of <player>
    And they have rolled their die
    And the position of the player is <property>
    And the player's property list is <properties>
    And the player's balance is <balance>
    When the player requests to buy the property <property> with cost <propertyCost>
    Then the player shall have <newProperties> as their list of properties
    And the player shall have a balance of <newBalance>

    Examples:
      | player  | balance | property | propertyCost | properties | newProperties | newBalance |
      | Player1 | 500     | Z        | 200          | A,B        | A,B,Z         | 300        |
      | Player2 | 700     | Y        | 300          | D,E        | D,E,Y         | 400        |

  Scenario: (Error Flow) Player lands on property with improper balance.
    Given it is the turn of "Player1"
    And they have rolled their die
    And the position of the player is "C"
    And the player's balance is "100"
    When the player requests to buy the property "C" with cost "200"
    Then an error message shall be created with text "You are too poor!"
    
  Scenario: (Error Flow) Player lands on property but the property is owned by another player.
    Given it is the turn of "Player1"
    And they have rolled their die
    And the position of the player is "C"
    And the player's property list is "A,B"
    And the player's balance is "400"
    And the property list of "Player2" is "C"
    When the player requests to buy the property "C" with cost "200"
    Then an error message shall be created with text "You cannot buy other people's property!"