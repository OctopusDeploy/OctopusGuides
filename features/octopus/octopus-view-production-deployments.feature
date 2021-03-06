Feature: Open Random Quotes

  Scenario: Open Browser
    Given I run the feature "shared/octopus-open-browser.feature" passing the original arguments

  @login
  Scenario: Login
    Given I set the following aliases:
      | Username   | //input[@id='userName']                                                                                   |
      | Password   | //input[@id='password']                                                                                   |
      | Sign In    | //button[contains(.,'SIGN IN')]                                                                           |
      | Close help | //div[*[local-name() = 'svg']/*[local-name()='path'][starts-with(@d, 'M11 18h2v-2h-2v2zm1-16C6.48 2 2')]] |

    And I set the default explicit wait time to "30" seconds
    And I open the URL "http://localhost"

    And I start recording the screen to the directory "#{ExternalMediaPath}"
    And I display a note with the text "View the dashboard as a production deployer" for "3" seconds

    And I populate the "Username" text box with "productiondeployer"
    And I populate the "Password" text box with "Password01!"
    And I click the "Sign In" button
    And I click the "Close help" button waiting up to "2" seconds if it exists

  Scenario: View Random Quotes Overview
    Given I set the following aliases:
      | Random Quotes | //a[contains(.,'Random Quotes')] |

    And I click the "Random Quotes" link
    And I scroll down "10000" px
    And I display a note with the text "There are no options to deploy to the Dev or Test environments" for "3" seconds
    And I save a screenshot to "#{ExternalMediaPath}/octopus/permissions/185-octopus-proudction-deployer-overview.png"

  Scenario: Shutdown
    Then I fade the screen to "1" "1" "1" over "3000" milliseconds
    And I stop recording the screen
    And I close the browser