Feature: Create Docker project

  Scenario: Prepare TeamCity
    Given I run the feature "shared/teamcity-login.feature" passing the original arguments

  @create-project @applicationspecific @java
  Scenario: Create Project
    Given I set the following aliases:
      | Create project        | //a[contains(.,'Create project')]                      |
      | Repository URL        | //input[@id='url']                                     |
      | Proceed               | //input[@name='createProjectFromUrl']                  |
      | Project name          | //input[@id='projectName']                             |
      | Proceed Two           | //input[@name='createProject']                         |
      | Configure manually    | //a[text()='configure build steps manually']           |
      | Runner type           | //input[@id='-ufd-teamcity-ui-runTypeInfoKey']         |
      | Runner type container | //span[./input[@id='-ufd-teamcity-ui-runTypeInfoKey']] |
      | Command Line          | //li[@data-title='Command Line']                       |
      | Maven                 | //li[@data-title='Maven']                              |
      | Step name             | //input[@id='buildStepName']                           |
      | Goals                 | //input[@id='goals']                                   |
      | Save                  | (//input[@value='Save'])[1]                            |
      | Got it                | //button[contains(.,'Got it')]                         |

    And I sleep for "5" seconds
    And I start recording the screen to the directory "#{ExternalMediaPath}"
    And I display a note with the text "Create the TeamCity project" for "3" seconds

    And I highlight outside the "Create project" button with an offset of "5"
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/initialproject/#{GuideSpecificScreenshotDir}010-create-project.png"
    And I click the "Create project" button

    And I highlight outside the "Repository URL" text box
    And I highlight outside the "Proceed" button
    And I populate the "Repository URL" text box with the text "GitUrl"
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/initialproject/#{GuideSpecificScreenshotDir}020-repo-url.png"
    And I click the "Proceed" button
    And I sleep for "3" seconds
    And I stop recording the screen

    And I verify the "Project name" text box is present waiting up to "120" seconds

    And I start recording the screen to the directory "#{ExternalMediaPath}"
    And I highlight outside the "Project name" text box
    And I highlight outside the "Proceed Two" button
    And I mouse over the "Project name" text box
    And I clear the "Project name" text box
    And I populate the "Project name" text box with "Random Quotes"
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/initialproject/#{GuideSpecificScreenshotDir}030-project-name.png"
    And I click the "Proceed Two" button

    And I highlight outside the "Configure manually" link
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/initialproject/#{GuideSpecificScreenshotDir}040-configure-manually.png"
    And I click the "Configure manually" link

    And I click the "Runner type" drop down list
    And I scroll the "Maven" option into view offset by "-300"
    And I click the "Maven" option
    And I sleep for "1" second
    And I highlight outside the "Runner type container" drop down list

    And I highlight outside the "Step name" text box
    And I populate the "Step name" text box with "Set Maven Version"

    And I scroll the "Goals" text box into view offset by "-300"
    And I highlight outside the "Goals" text box
    And I highlight outside the "Save" button
    And I populate the "Goals" text box with "versions:set -DnewVersion=1.0.%build.counter%"
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/initialproject/#{GuideSpecificScreenshotDir}050-maven-version.png"
    And I click the "Save" button

    And I highlight outside the "Add build step" button
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/initialproject/#{GuideSpecificScreenshotDir}060-add-build-step.png"
    And I click the "Add build step" button

    And I click the "Runner type" drop down list
    And I scroll the "Maven" option into view offset by "-300"
    And I click the "Maven" option
    And I sleep for "1" second
    And I highlight outside the "Runner type container" drop down list

    And I highlight outside the "Step name" text box
    And I populate the "Step name" text box with "Maven Package"

  @repositoryspecific @octo-built-in-feed
  Scenario: Package only
    Given I set the following aliases:
      | Goals | //input[@id='goals']        |
      | Save  | (//input[@value='Save'])[1] |

    And I scroll the "Goals" text box into view offset by "-300"
    And I highlight outside the "Goals" text box
    And I highlight outside the "Save" button
    And I populate the "Goals" text box with "clean test package -Pwar"
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/initialproject/#{GuideSpecificScreenshotDir}070-maven-publish.png"
    And I click the "Save" button

  @repositoryspecific @artifactory
  Scenario: Publish
    Given I set the following aliases:
      | Goals | //input[@id='goals']        |
      | Save  | (//input[@value='Save'])[1] |

    And I scroll the "Goals" text box into view offset by "-300"
    And I highlight outside the "Goals" text box
    And I highlight outside the "Save" button
    And I populate the "Goals" text box with "clean test deploy -Pwar -s /opt/settings.xml"
    And I save a screenshot to "#{ExternalMediaPath}/teamcity/initialproject/#{GuideSpecificScreenshotDir}070-maven-publish.png"
    And I click the "Save" button

  Scenario: Close popups
    Given I set the following aliases:
      | Got it | //button[contains(.,'Got it')] |
    And I click the "Got it" button waiting up to "5" seconds if it exists

  @repositoryspecific @octo-built-in-feed
  Scenario: Add Octopus Push
    And I run the feature "shared/teamcity-add-octo-push.feature"

  @run-build
  Scenario: Run a build
    And I run the feature "shared/teamcity-runbuild.feature"
    And I run the feature "shared/teamcity-close.feature"