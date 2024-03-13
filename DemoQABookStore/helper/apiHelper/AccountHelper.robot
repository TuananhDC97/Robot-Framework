*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary
Library  String
Resource  ../../core/api/API.robot

*** Variables ***
${AccountAPICategory}  Account/v1/
${USERTOKEN}           "undefined"

*** Keywords ***

Generate Token [Arguments] ${userName} ${password}
    [Documentation]
    ...  Generate user token
    ...  
    Log To Console    GenerateTokenFunction
    ${endpoint}=  Set Variable  ${AccountAPICategory}GenerateToken
    &{body}=  Create Dictionary  userName=${userName}  password=${password}
    ${response}=  Send Post Request  endpoint=${endpoint}  body=${body}
    Return From Keyword  ${response}

Set Global Token [Arguments] ${userName} ${password}
    [Documentation]
    ...  Get the token for using
    ... 
    
    Log To Console    InSetGlobalToken
    Log To Console    ${USERTOKEN}
    IF  ${USERTOKEN} == "undefined"
        ${response}=  Generate Token [Arguments] ${userName} ${password}
        ${token}=  Get Value From Json  ${response.json()}  token 
        Set Global Variable    ${USERTOKEN}  ${token}
    END

    Return From Keyword  ${USERTOKEN}

Generate Token Header [Arguments] ${token}
    [Documentation]
    ...  Generate Token Header
    ...
    
    ${token}=  Get From List    ${token}    0
    ${headerValue}=  Set Variable  Bearer ${token}
    ${header}=  Create Dictionary  Content-Type=application/json   Authorization=${headerValue}  accept=application/json
    Return From Keyword  ${header}


