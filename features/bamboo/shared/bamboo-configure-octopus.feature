Feature: Configure Octopus

  @executables
  Scenario: Configure Octo CLI
    Given I set the following aliases:
      | Close dialog        | //span[@class='aui-icon icon-close']         |
      | Administration      | //span[contains(.,'Administration')]         |
      | Server capabilities | //a[contains(.,'Server capabilities')]       |
      | Overview            | //a[contains(.,'Overview')]                  |
      | Capability type     | //select[@id='addCapability_capabilityType'] |
      | Type                | //select[@id='executableTypeSelect']         |
      | Executable label    | //input[@id='addCapability_builderLabel']    |
      | Executable path     | //input[@id='addCapability_builderPath']     |
      | Add                 | //input[@id='addCapability_save']            |

    And I stop recording the screen
    And I click the "Close dialog" button waiting up to "5" seconds if it exists
    And I start recording the screen to the directory "#{ExternalMediaPath}"

    And I display a note with the text "Configuring the Octopus CLI executable" for "3" seconds

    And I scroll the "Administration" button into view
    And I force click the "Administration" button
    And I highlight inside the "Administration" button
    And I highlight outside the "Overview" link
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/executables/#{GuideSpecificScreenshotDir}010-administration.png"
    # There were some issues trying to click this link, so we mouse over and then manually redirect
    And I force mouse over the "Overview" link
    And I open the URL "http://#{Hostname}:6990/bamboo/admin/administer.action"

    And I highlight outside the "Server capabilities" link with an offset of "5"
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/executables/#{GuideSpecificScreenshotDir}020-server-capabilities.png"
    And I click the "Server capabilities" link

    And I scroll the "Capability type" drop down list into view offset by "-300"
    And I select the option "Executable" from the "Capability type" drop down list
    And I select the option "Octopus CLI" from the "Type" drop down list
    And I populate the "Executable label" text box with "Octopus CLI"
    And I populate the "Executable path" text box with "/opt/octo/Octo"
    And I scroll the "Add" button into view offset by "-300"

    And I highlight outside the "Capability type" drop down list with an offset of "2"
    And I highlight outside the "Type" drop down list with an offset of "2"
    And I highlight outside the "Executable label" text box with an offset of "2"
    And I highlight outside the "Executable path" text box with an offset of "5"
    And I highlight outside the "Add" button with an offset of "5"

    And I save a screenshot to "#{ExternalMediaPath}/bamboo/executables/#{GuideSpecificScreenshotDir}030-octo.png"
    And I click the "Add" button

    And I stop recording the screen