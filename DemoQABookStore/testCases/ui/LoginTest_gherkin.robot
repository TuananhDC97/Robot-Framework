*** Settings ***
Resource    ./LoginTest_steps.robot
Metadata    Feature    Login Functionality
*** Test Cases ***
User logs in with valid credentials
    Given the user is on the login page
    When the user enters valid username and password
    Then the user should be logged in successfully