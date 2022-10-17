# Jerry Xia 260917329

Feature: Player goes to Jail

  As a player
  I would like to go to jail
  So I can play by the rules of Monopoly.

  Scenario: (Normal Flow) Player lands on the Go to Jail space
    Given a Player "Player1" who is playing the game
    And it is the turn of "Player1"
    And they have rolled their die
    When the position of the player is "jail"
    Then the player is moved to the jail space
    And the player is now in jail

  Scenario: (Alternative Flow) Player is told to go to Jail by Community/Chance card
    Given a Player "Player1" who is playing the game
    And it is the turn of "Player1"
    And they have rolled their die
    And they have picked up a card
    When the card is of type "jail"
    Then the player is moved to the jail space
    And the player is now in jail

  Scenario: (Alternative Flow) Player has rolled doubles three times in a row
    Given a Player "Player1" who is playing the game
    And it is the turn of "Player1"
    And they have rolled their die
    When the outcome of their past three rolls are doubles
    Then the player is moved to the jail space
    And the player is now in jail