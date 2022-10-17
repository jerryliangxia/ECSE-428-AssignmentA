# Jerry Xia 260917329

Feature: Player Picks Up a Card

  As a player
  I would like to pick up a chance card when I have landed on a card spot
  So I can play by the rules of Monopoly.

  Scenario: (Normal Flow) Player lands on a Chest space
    Given it is the turn of "Player1"
    And they have rolled their die
    When the position of the player is "Chest"
    Then the player will pick up a card from the "Chest" pile

  Scenario: (Normal Flow) Player lands on a Chance space
    Given it is the turn of "Player1"
    And they have rolled their die
    When the position of the player is "Chance"
    Then the player will pick up a card from the "Chance" pile