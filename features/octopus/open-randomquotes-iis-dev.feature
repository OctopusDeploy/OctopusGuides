Feature: Open Random Quotes

  Scenario: Open Browser
    Given I run the feature "shared/octopus-open-browser.feature" passing the original arguments

  Scenario: Login
    Given I set the following aliases:
      | Refresh | //input[@type='submit'] |

    And I set the default explicit wait time to "30" seconds
    And I open the URL "http://localhost:8081"
    And I start recording the screen to the directory "#{ExternalMediaPath}"
    And I display a note with the text "Running the Random Quotes sample application" for "3" seconds
    And I save a screenshot to "#{ExternalMediaPath}/app/#{GuideSpecificScreenshotDir}aspnet-random-quotes-dev-app.png"
    And I click the "Refresh" button
    And I sleep for "2" seconds

  Scenario: Shutdown
    Then I fade the screen to "1" "1" "1" over "3000" milliseconds
    And I stop recording the screen
    And I close the browser