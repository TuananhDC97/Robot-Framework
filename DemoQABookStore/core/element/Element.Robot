*** Settings ***
Resource   ../../configs/TestRunConfig.robot
Resource   ../../configs/SeleniumConfigs.robot

Library    SeleniumLibrary
Library    String
Library    OperatingSystem


*** Keywords ***
Element Should Be Contained In The Page [Arguments] ${locator} ${retryScale}
    [Documentation]        
	...  Verify that the element should be contained in the page  ...

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Page Contains Element    ${locator}
    

Element Should Not Be Contained In The Page [Arguments] ${locator} ${retryScale}
    [Documentation]        
	...  Verify that the element should not be contained in the page  ...

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Page Does Not Contain Element   ${locator}


Element Should Be Visible [Arguments] ${locator} ${retryScale}
    [Documentation]        
	...  Verify that the element should be visible  ...

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Element Is Visible    ${locator}


Element Should Not Be Visible [Arguments] ${locator} ${retryScale}
    [Documentation]        
	...  Verify that the element should not be visible  ...

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Element Is Not Visible   ${locator}


Click Element [Arguments] ${locator} ${retryScale}
    [Documentation]        
	...  Click on a given button  ...
    
    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Scroll Element Into View By JS [Arguments] ${locator} ${retryScale} 
    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Element Is Enabled    ${locator}
    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Click Element  ${locator}


Click Element By JavaScript Executor [Arguments] ${elementXpathLocator} ${retryScale}
    [Documentation]
    ...  Click an element by xpath using javascript executor  ...

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Element Is Enabled    ${elementXpathLocator}
    ${elementXpathLocator}=    Remove String        ${elementXpathLocator}   xpath=
    Execute JavaScript  document.evaluate("${elementXpathLocator}", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
    
    
Element Text Should Be [Arguments] ${locator} ${text} ${retryScale}
    [Documentation]        
	...  Validate the text of an element  ...

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Element Is Visible    ${locator}
    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Element Text Should Be    ${locator}    ${text}    


Set Text [Arguments] ${textBoxLocator} ${text} ${retryScale}
    [Documentation]        
	...  Input text into a text box  ...

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Scroll Element Into View By JS [Arguments] ${textBoxLocator} ${retryScale}
    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Element Is Enabled    ${textBoxLocator}
    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Input Text    ${textBoxLocator}    ${text}

Get Text [Arguments] ${locator} ${retryScale}
    [Documentation]        
	...  Get text of an element ...
    
    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Element Is Visible    ${locator}
    ${text}=  Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Get Text    ${locator} 
    Return From Keyword  ${text}   

Scroll Element Into View By JS [Arguments] ${locator} ${retryScale}
    [Documentation]        
	...  Scroll element into view by js ...
    ...  

     Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Element Is Enabled    ${locator}
     ${ele}=  Get WebElement    ${locator} 
     Execute Javascript  arguments[0].scrollIntoView(true);    ARGUMENTS   ${ele}