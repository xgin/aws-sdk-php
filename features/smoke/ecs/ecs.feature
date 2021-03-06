# language: en
@ecs
Feature: Amazon ECS

  I want to use Amazon ECS

  Scenario: Making a request
    When I call the "ListClusters" API
    Then the value at "clusterArns" should be a list

  Scenario: Handling errors
    When I attempt to call the "StopTask" API with:
    | task  | xxxxxxxxxxx-xxxxxxxxxxxx-xxxxxxxxxxx  |
    Then the error code should be "ClientException"
    And I expect the response error message to include:
    """
    task was not found
    """
