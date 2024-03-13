*** Settings ***
Library    SeleniumLibrary
Resource   ../../pageObjects/pages/LoginPage.robot
Resource   ../../pageObjects/pages/BasePage.robot
Resource   ../../data/UserCredentials.robot

*** Keywords ***
the user is on the login page
    Open Browser And Go To Login Page

the user enters valid username and password
    Login To The Application [Arguments] ${validUserNameVal} ${validPasswordVal}
the user should be logged in successfully
    ${displayedUsername}=  Get User Name Label value
    Should Be Equal    ${validUserNameVal}    ${displayedUsername}