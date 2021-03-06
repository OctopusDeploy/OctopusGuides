Feature: Create and deploy a release

  Scenario: Prepare TeamCity
    Given I run the feature "shared/teamcity-login.feature" passing the original arguments

  @add-step
  Scenario: Add step
    Given I set the following aliases:
      | Build                         | //a[text()='Build']                                    |
      | Edit Configuration Settings   | //a[text()='Edit Configuration Settings']              |
      | Build Steps                   | //a[text()='Build Steps']                              |
      | Add build step                | //a[contains(.,'Add build step')]                      |
      | Runner type                   | //input[@id='-ufd-teamcity-ui-runTypeInfoKey']         |
      | Runner type container         | //span[./input[@id='-ufd-teamcity-ui-runTypeInfoKey']] |
      | OctopusDeploy: Create release | //li[@data-title='OctopusDeploy: Create release']      |
      | Step name                     | //input[@id='buildStepName']                           |
      | Octopus URL                   | //input[@id='octopus_host']                            |
      | Octopus API key               | //input[@id='secure:octopus_apikey']                   |
      | Octopus Project               | //input[@id='octopus_project_name']                    |
      | Octopus Environments          | //input[@id='octopus_deployto']                        |
      | Save                          | (//input[@value='Save'])[1]                            |

    And I start recording the screen to the directory "#{ExternalMediaPath}"
    And I display a note with the text "Deploying an Octopus release from TeamCity" for "3" seconds

    And I highlight outside the "Build" link
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/createrelease/#{GuideSpecificScreenshotDir}001-create-release.png"
    And I click the "Build" link

    And I highlight outside the "Edit Configuration Settings" link
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/createrelease/#{GuideSpecificScreenshotDir}002-create-release.png"
    And I click the "Edit Configuration Settings" link

    And I highlight outside the "Build Steps" link
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/createrelease/#{GuideSpecificScreenshotDir}003-create-release.png"
    And I click the "Build Steps" link

    And I highlight outside the "Add build step" button
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/createrelease/#{GuideSpecificScreenshotDir}004-create-release.png"
    And I click the "Add build step" button

    And I click the "Runner type" drop down list
    And I scroll the "OctopusDeploy: Create release" option into view
    And I click the "OctopusDeploy: Create release" option
    And I highlight outside the "Runner type container" drop down list
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/createrelease/#{GuideSpecificScreenshotDir}010-create-release.png"

    And I scroll the "Step name" text box into view offset by "-300"
    And I highlight outside the "Step name" text box
    And I populate the "Step name" text box with "Create and deploy release"
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/createrelease/#{GuideSpecificScreenshotDir}020-create-release.png"

    And I scroll the "Octopus URL" text box into view offset by "-300"
    And I highlight outside the "Octopus URL" text box
    And I populate the "Octopus URL" text box with "http://localhost"
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/createrelease/#{GuideSpecificScreenshotDir}030-create-release.png"

    And I scroll the "Octopus API key" text box into view offset by "-300"
    And I highlight outside the "Octopus API key" text box
    And I populate the "Octopus API key" text box with "ExternalOctopusAPIKey"
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/createrelease/#{GuideSpecificScreenshotDir}040-create-release.png"

    And I remove the highlight from the "Step name" text box
    And I remove the highlight from the "Octopus URL" text box
    And I remove the highlight from the "Octopus API key" text box

    And I scroll the "Octopus Project" text box into view offset by "-300"
    And I highlight outside the "Octopus Project" text box
    And I populate the "Octopus Project" text box with "Random Quotes"
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/createrelease/#{GuideSpecificScreenshotDir}050-create-release.png"

    And I remove the highlight from the "Octopus Project" text box

    And I scroll the "Octopus Environments" text box into view offset by "-300"
    And I highlight outside the "Octopus Environments" text box
    And I populate the "Octopus Environments" text box with "Dev"
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/createrelease/#{GuideSpecificScreenshotDir}060-create-release.png"
    And I remove the highlight from the "Octopus Environments" text box

    And I scroll the "Save" button into view
    And I highlight outside the "Save" button
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/createrelease/#{GuideSpecificScreenshotDir}070-create-release.png"
    And I click the "Save" button

    And I stop recording the screen

  @run-build
  Scenario: Run a build
    Given I set the following aliases:
      | Run                      | //button[contains(.,'Run')]                                |
      | Build Configuration Home | //a[@href='/viewType.html?buildTypeId=RandomQuotes_Build'] |
      | Build Two                | //a[contains(.,'#2')]                                      |
      | Build log                | //a[contains(.,'Build Log')]                               |

    And I start recording the screen to the directory "#{ExternalMediaPath}"
    And I highlight outside the "Build Configuration Home" link with an offset of "2"
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/createrelease/#{GuideSpecificScreenshotDir}080-build-config-home.png"
    And I click the "Build Configuration Home" link

    And I highlight outside the "Run" button
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/createrelease/#{GuideSpecificScreenshotDir}090-run.png"
    And I click the "Run" button
    And I sleep for "10" seconds
    And I refresh the page

    And I highlight outside the "Build Two" link
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/createrelease/#{GuideSpecificScreenshotDir}100-build-one.png"
    And I click the "Build Two" link
    And I click the "Build log" link
    And I scroll down "10000" px
    And I sleep for "30" seconds

    And I save a screenshot to "#{ExternalMediaPath}/teamcity/createrelease/#{GuideSpecificScreenshotDir}110-build-one-results.png"

  Scenario: Shutdown
    And I run the feature "shared/teamcity-close.feature"