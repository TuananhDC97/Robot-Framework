*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary
Variables    ../../configs/EnvInfo.py
Resource   ../../configs/TestRunConfig.robot

*** Keywords ***
Get Base API Url
   [Documentation]
   ...  Get Base API Url...
   ...

   ${envInfo}=  Get From Dictionary  ${ENVIRONMENTINFO}  ${env}
   ${baseAPIUrl}=  Get From Dictionary  ${envInfo}  apiBaseUrl
   Return From Keyword  ${baseAPIUrl}

Send Get Request [Arguments] ${endpoint}
   [Documentation]
   ...  Send get request to server...
   ...  

   ${baseAPIUrl}=  Get Base API Url
   Create Session  mysession  ${baseAPIUrl}  verify=true
   ${response}=  GET On Session  mysession  ${endpoint}
   Return From Keyword  ${response}


Send Post Request 
...    [Arguments]   ${endpoint}   ${body}=${None}   ${header}=${None}
   [Documentation]
   ...  Send post request to server...
   ...  
   
   ${baseAPIUrl}=  Get Base API Url
   Create Session  mysession  ${baseAPIUrl}  verify=true
   ${response}=  POST On Session  mysession  ${endpoint}  data=${body}  headers=${header}  expected_status=Anything
   Return From Keyword  ${response}

Send Delete Request
...    [Arguments]   ${endpoint}   ${body}=${None}   ${header}=${None}
   [Documentation]
   ...  Send delete request to server...
   ...  

   ${baseAPIUrl}=  Get Base API Url
   Create Session  mysession  ${baseAPIUrl}  verify=true
   ${response}=  Delete On Session  mysession  ${endpoint}  data=${body}  headers=${header}  expected_status=Anything
   Return From Keyword  ${response}