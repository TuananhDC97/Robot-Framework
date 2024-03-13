*** Settings ***

Resource   ../../pageObjects/pages/BasePage.robot
Resource   ../../helper/apiHelper/BookHelper.robot
Resource   ../../data/UserCredentials.robot
Resource   ../../data/BookInfo.robot
Resource   ../../pageObjects/pages/BookStorePage.robot
Resource   ../../pageObjects/pages/LoginPage.robot
Resource   ../../pageObjects/pages/ProfilePage.robot


Test Setup     Set Global Token [Arguments] ${validUserNameVal} ${validPasswordVal}   
Test Teardown  Close Browser
*** Test Cases ***
Verify deleting a book successfully with UI
   [Documentation]
   ...  Verify deleting a book successfully with UI...
   ...  

   Add Book To Collection [Arguments] ${userID} ${validIsbn} ${USERTOKEN}
   Open Browser And Go To Login Page
   Login To The Application [Arguments] ${validUserNameVal} ${validPasswordVal}
   Wait For BookStore Page Load
   Go To Profile Page
   Delete A Book By Name [Arguments] ${bookName}
   Book should be removed from profile [Arguments] ${bookName}
   