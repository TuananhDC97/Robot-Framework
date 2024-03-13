*** Settings ***

Library  Collections
Resource  ../../helper/apiHelper/AccountHelper.robot
Resource  ../../helper/apiHelper/BookHelper.robot
Resource  ../../data/UserCredentials.robot
Resource  ../../data/BookInfo.robot

Test Setup   Set Global Token [Arguments] ${validUserNameVal} ${validPasswordVal}
*** Test Cases ***

Verify delete valid book in collection successfully
    
    Add Book To Collection [Arguments] ${userID} ${validIsbn} ${USERTOKEN}
    ${response}=  Delete A Book From Collection [Arguments] ${userID} ${validIsbn} ${USERTOKEN}
    Status Should Be  204  ${response}

Verify delete invalid book in collection unsuccessfully
    
    ${response}=  Delete A Book From Collection [Arguments] ${userID} ${invalidIsbn} ${USERTOKEN}
    Status Should Be  400  ${response}
    ${message}=  Get Value From Json  ${response.json()}  message 
    Log To Console    ${message}
    ${expectedResult}=  Create List  ISBN supplied is not available in User\'s Collection!
    Should Be Equal    ${message}    ${expectedResult}