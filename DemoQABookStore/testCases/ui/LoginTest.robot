*** Setting ***
Library    SeleniumLibrary    plugins=${CURDIR}/../../core/report/AllureSeleniumPlugin.py
Resource   ../../pageObjects/pages/BasePage.robot
Resource   ../../pageObjects/pages/LoginPage.robot
Resource   ../../pageObjects/pages/BookStorePage.robot
Resource   ../../data/UserCredentials.robot
Resource   ../../data/ErrorMessage.robot
Resource   ../../configs/SeleniumConfigs.robot



Documentation    
 ...  This suite includes login tests  ...

Test Setup     Open Browser And Go To Login Page
Test Teardown  Close Browser

*** Keywords ***
Login with invalid credentials should fail [Arguments] ${username} ${password} ${expectedErrorMessage}
    [Documentation]
	...  Template for login failed with wrong credentials  ...
    Login To The Application [Arguments] ${username} ${password}
    The error message is shown [Arguments] ${expectedErrorMessage}

*** Test Cases ***
Verify that an valid user can login to the system
    [Documentation]
	...  This testcase verified an valid login scenario  ...
    [Tags]   smoke
    Login To The Application [Arguments] ${validUserNameVal} ${validPasswordVal}
    ${displayedUsername}=  Get User Name Label value
    Should Be Equal    ${validUserNameVal}    ${displayedUsername}

Verify that an invalid user cannot login to the system
    
    [Template]   Login with invalid credentials should fail [Arguments] ${username} ${password} ${expectedErrorMessage}
    anhtien12345   wrongpass        ${loginErrorMessage}
    anhtien23456   Ab1234@    ${loginErrorMessage}



