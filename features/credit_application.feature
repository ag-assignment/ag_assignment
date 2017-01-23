@prod
Feature: Credit Application creation
  Scenario: New user creates credit application for random make/model
    Given I select a random vehicle condition
    When I filter by location
    And I select a random vehicle
    And I go through vehicle selection flows
    Then I am presented with personal information page
