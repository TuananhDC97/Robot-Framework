*** Settings ***
Library  Collections
Resource  ../../helper/apiHelper/AccountHelper.robot
Resource  ../../data/UserCredentials.robot

*** Keywords ***
Generate token with invalid credentials [Arguments] ${username} ${password}
    [Documentation]
	...  Template for generating token with invalid credentials  ...
    ...  

    ${response}=  Generate Token [Arguments] ${username} ${password}
    
    ${token}=  Get Value From Json  ${response.json()}  token 
    ${expectedResult}=  Create List  ${null}
    Should Be Equal    ${token}    ${expectedResult}

*** Test Cases ***

Verify generate token successfully
    [Documentation]
	...  This testcase verified an valid token generation scenario  ...
    ...  
    
    ${response}=  Generate Token [Arguments] ${validUserNameVal} ${validPasswordVal}
    Status Should Be  200  ${response}
    ${token}=  Get Value From Json  ${response.json()}  token 
    Log To Console    ${token}
    Should Not Be Equal    ${token}    null

Verify generate token successfully with invalid credentials
    [Documentation]
	...  This testcase verified gererating token with invalid credentials scenario  ...
    ...  

    [Template]  Generate token with invalid credentials [Arguments] ${username} ${password}
    anhtien123   Abcd1234
    anhtien124   Abcd1234@


   



