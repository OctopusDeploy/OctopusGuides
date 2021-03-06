Feature: Jenkins login

  @login
  Scenario: Log into Jenkins
    Given I set the following aliases:
      | Username     | #j_username                                          |
      | Password     | body > div > div > form > div:nth-child(2) > input   |
      | Sign In      | body > div > div > form > div.submit.formRow > input |
      | Profile Name | /html/body/div[2]/header/div[3]/a[1]/span            |

    When I open the URL "http://localhost:8080/login"
    # It can take some time for Jenkins to start up, so we need to be able to wait here for the login box
    And I refresh the page for "1500" seconds if the "Username" text box does not exist
    And I populate the "Username" text box with the text "admin"
    And I populate the "Password" text box with the text "Password01!"
    And I click the "Sign In" button
    Then I verify the text from the "Profile Name" element matches the regex "admin" waiting up to "120" seconds
    And I start recording the screen to the directory "#{ExternalMediaPath}"