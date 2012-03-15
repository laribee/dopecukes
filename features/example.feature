@wip @S-12345
Feature: An Example Feature

  Now feature descriptions can contain _markdown_. [Links are fine](http://versionone.com) as are images:

  ![SteveSteve BuscemiBuscemi](http://i.imgur.com/UjRML.jpg)

  > The quick brown fox jumped
  > over the lazy dog.

  It works like a **charm**!

  Background:

    Given the following items:
      | name   | rank | color  |
      | Pinky  | 2    | pink   |
      | Blinky | 1    | red    |
      | Inky   | 3    | cyan   |
      | Clyde  | 4    | orange |

  @wip
  Scenario: A Pending Scenario

    Given I describe some givens
    When they have no step definitions
    Then they should show up pending

  @manual
  Scenario: A Passing Scenario

    When I pass
    Then I look gooooooood

  Scenario: A Failing Scenario

    When I take one step forward
    Then I take two steps back

  Scenario: Multi-line string

    When I have a multi-line string
    """
    Hello today.
    """
    Then I can see it

  Scenario Outline: An outline

    Given you can get with <this>
    When you can get with <that>
    Then you get with <this> cause this is where it's at

  Examples:
    | this | that |
    | a    | 1    |
    | b    | 2    |
