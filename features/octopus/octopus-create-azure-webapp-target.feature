Feature: Create Azure Web App Target

  @login
  Scenario: Login
    Given I set the following aliases:
      | Username | //input[@name='userName']       |
      | Password | //input[@name='password']       |
      | Sign In  | //button[contains(.,'SIGN IN')] |
    And I open the shared browser "FirefoxNoImplicitWait"
    And I maximize the window
    #And I set the window size to "1024" x "768"
    And I set the default explicit wait time to "30" seconds
    And I open the URL "http://localhost"

    And I populate the "Username" text box with "admin"
    And I populate the "Password" text box with "Password01!"
    And I click the "Sign In" button

  Scenario: Add target
    Given I set the following aliases:
      | Infrastructure          | //span[contains(.,'Infrastructure')]                                                                    |
      | Deployment Targets      | (//a[contains(.,'Deployment Targets')])[1]                                                              |
      | Deployment Targets text | (//a/span[contains(.,'Deployment Targets')])[1]                                                         |
      | Add Deployment Target   | //button[contains(.,'Add Deployment Target')]                                                           |
      | Azure                   | //button[contains(.,'Azure')]                                                                           |
      | Azure Web App           | //div[contains(@class, 'EndpointCard_card') and contains(.,'Azure Web App')]                            |
      | Add                     | //div[contains(@class, 'EndpointCard_card') and contains(.,'Azure Web App')]//button[contains(.,'Add')] |
      | Save                    | //button[contains(.,'Save')]                                                                            |
      | Display Name            | //input[contains(@id,'Displayname')]                                                                    |
      | Environments            | //input[@title='Select environments']                                                                   |
      | Target Roles            | //input[@title='Roles (type to add new)']                                                               |
      | Azure web app role      | //span[./div/div/div[contains(.,'azurewebapp')]]                                                        |
      | Account                 | //div[../../div[text()='Select account']]                                                               |
      | Azure account           | //span[./div/div/div[text()='Azure']]                                                                   |
      | Azure Web App           | //div[../../div[text()='Web app']]                                                                      |
      | Azure Web App Option    | //span[./div/div/div[contains(.,'jenkinsaspnetbuiltinfeeddev')]]                                        |
      | Save                    | //input[@title='Save']                                                                                  |

    And I start recording the screen to the directory "C:\screenshots"
    And I display a note with the text "Creating the Octopus environments" for "3" seconds

    And I highlight outside the "Infrastructure" link with an offset of "5"
    And I save a screenshot to "C:\screenshots\octopus\azuretarget\005-infrastructure.png"
    And I click the "Infrastructure" link

    And I highlight outside the "Deployment Targets text" link with an offset of "2"
    And I save a screenshot to "C:\screenshots\octopus\azuretarget\010-targets-1.png"
    And I click the "Deployment Targets" link

    And I highlight outside the "Add Deployment Target" button
    And I sleep for "1" second
    And I save a screenshot to "C:\screenshots\octopus\azuretarget\015-add-environment-1.png"
    And I click the "Add Deployment Target" button

    And I click the "Azure" button

    And I scroll the "Deploy an Azure Web App" tile into view offset by "-200"
    And I highlight outside the "Deploy an Azure Web App" tile
    And I save a screenshot to "C:\screenshots\octopus\project\045-octopus-azure-add-azure-webapp.png"
    And I mouse over the "Deploy an Azure Web App" tile
    And I click the "Add" button

    And I populate the "Display Name" text box with "Azure web app - Dev"
    And I populate the "Target Roles" text box with "azurewebapp"
    And I click the "Azure web app role" option

    And I click the "Account" drop down list
    And I click the "Azure account" option

    And I click the "Azure Web App" drop down list
    And I click the "Azure Web App Option" option

    And I click the "Save" button
