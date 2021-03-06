Feature: Set up Team City

  Scenario: Set up Team City
    Given I set the following aliases:
      | Proceed        | //input[@value='Proceed']             |
      | Accept         | //input[@id='accept']                 |
      | Continue       | //input[@name='Continue']             |
      | Username       | //input[@id='input_teamcityUsername'] |
      | Password One   | //input[@id='password1']              |
      | Password Two   | //input[@id='retypedPassword']        |
      | Create Account | //input[@value='Create Account']      |

    And I open the browser "FirefoxNoImplicitWaitNoProxy"
    And I fullscreen the window
    And I set the default explicit wait time to "30" seconds
    And I open the URL "http://localhost:8111"
    And I click the "Proceed" button
    And I click the "Proceed" button

    And I scroll the "Accept" check box into view waiting up to "500" seconds
    And I scroll down "100000" px
    And I force click the "Accept" check box
    And I force click the "Continue" button

    And I populate the "Username" text box with "admin"
    And I populate the "Password One" text box with "Password01!"
    And I populate the "Password Two" text box with "Password01!"

    And I click the "Create Account" button
    And I sleep for "60" seconds

    And I stop recording the screen
    And I close the browser

  Scenario: Login
    Given I set the following aliases:
      | Username | //input[@id='username']          |
      | Password | //input[@id='password']          |
      | Log in   | //input[@name='submitLogin']     |
      | Title    | //span[contains(@class,'contentWrapper')] |

    And I open the browser "FirefoxNoImplicitWaitNoProxy"
    And I set the default explicit wait time to "30" seconds
    And I open the URL "http://localhost:8111"
    And I populate the "Username" text box with "admin"
    And I populate the "Password" text box with "Password01!"
    And I click the "Log in" button
    And I sleep for "2" seconds
    Then I verify the text from the "Title" element matches the regex "Getting started with TeamCity"

    And I stop recording the screen
    And I close the browser