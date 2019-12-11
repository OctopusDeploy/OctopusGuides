Feature: Build and deploy a Node js application hosted in Git on a local Octopus instance

  Scenario: Initial setup
    Given I run the feature "shared/jenkins-open-browser.feature" passing the original arguments
    And I run the feature "shared/jenkins-login.feature" passing the original arguments
    And I run the feature "shared/jenkins-initial-project-setup.feature" passing the original arguments

  @configure-project
  Scenario: Node.js - Create the project
    Given I set the following aliases:
      | Add build step                               | //button[@type='button'][contains(.,'Add build step')] |
      | Execute shell                                | //a[contains(.,'Execute shell')]                       |
      | Command                                      | //div[@class='CodeMirror']                             |
      | Execute shell                                | //a[contains(.,'Execute shell')]                       |
      | Save                                         | //button[@type='button'][contains(.,'Save')]           |

    And I scroll the "Add build step" button into view offset by "-200"
    And I highlight outside the "Add build step" button
    And I click the "Add build step" button
    And I highlight outside the "Execute shell" link
    And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}240-shell-command-1.png"
    And I click the "Execute shell" link
    And I remove the highlight from the "Add build step" option
    And I remove the highlight from the "Execute shell" option

    And I scroll the "Command" text box into view offset by "-200"
    And I highlight outside the "Command" text box
    And I run the following JavaScript:
      """
      var textarea = document.evaluate("//div[@class='CodeMirror']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
      var editor = textarea.CodeMirror
      editor.setValue("npm install\nnpm test");
      editor.save();
      """
    And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}250-dotnet-test.png"
    And I remove the highlight from the "Command" text box

    And I scroll the "Add build step" button into view offset by "-200"
    And I highlight outside the "Add build step" button
    And I click the "Add build step" button
    And I highlight outside the "Execute shell" link
    And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}260-batch-command.png"
    And I click the "Execute shell" link
    And I remove the highlight from the "Add build step" option
    And I remove the highlight from the "Execute shell" option

    And I scroll the "Command" text box into view offset by "-200"
    And I highlight outside the "Command" text box
    And I run the following JavaScript:
      """
      var textarea = document.evaluate("(//div[@class='CodeMirror'])[2]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
      var editor = textarea.CodeMirror
      editor.setValue("#!/bin/bash\n/opt/octo/Octo pack -id RandomQuotes -version 1.0.$BUILD_NUMBER -include $WORKSPACE");
      editor.save();
      """
    And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}270-octo-push.png"
    And I remove the highlight from the "Command" text box

    And I scroll the "Add build step" button into view offset by "-200"
    And I highlight outside the "Add build step" button
    And I click the "Add build step" button
    And I highlight outside the "Execute shell" link
    And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}280-batch-command.png"
    And I click the "Execute shell" link
    And I remove the highlight from the "Add build step" option
    And I remove the highlight from the "Execute shell" option

    And I scroll the "Command" text box into view offset by "-200"
    And I highlight outside the "Command" text box
    And I run the following JavaScript:
      """
      var textarea = document.evaluate("(//div[@class='CodeMirror'])[2]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
      var editor = textarea.CodeMirror
      editor.setValue("#!/bin/bash\n/opt/octo/Octo push --server http://localhost --package \"$WORKSPACE\RandomQuotes.1.0.$BUILD_NUMBER.nupkg\" --apiKey $OctopusAPIKey");
      editor.save();
      """
    And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}290-octo-push.png"
    And I remove the highlight from the "Command" text box

    And I click the "Save" button
    And I stop recording the screen

  Scenario: Build project
    And I run the feature "shared/jenkins-build.feature"

  Scenario: Shutdown
    Then I fade the screen to "1" "1" "1" over "3000" milliseconds
    And I stop recording the screen
    And I close the browser