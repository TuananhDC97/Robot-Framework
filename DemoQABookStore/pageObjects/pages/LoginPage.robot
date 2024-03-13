*** Settings ***
Resource   ../../configs/SeleniumConfigs.robot
Resource   ../../configs/TestRunConfig.robot
Resource   ../locators/LoginPageLocators.robot
Resource   ../../core/element/Element.robot

Library    SeleniumLibrary

*** Keywords ***
Login To The Application [Arguments] ${userNameVal} ${passwordVal}
    [Documentation]
	...  Fill login information and click on login button  ...
    
    Set Text [Arguments] ${usernameTextBox} ${userNameVal} ${SMALL_RETRY_COUNT}
    Set Text [Arguments] ${passwordTextBox} ${passwordVal} ${SMALL_RETRY_COUNT}
    Click Element [Arguments] ${loginButton} ${SMALL_RETRY_COUNT}

The error message is shown [Arguments] ${expectedErrorMessage}
    [Documentation]
	...  Check the error message is shown  ...
    Element Text Should Be [Arguments] ${errorMessageText} ${expectedErrorMessage} ${SMALL_RETRY_COUNT}
