*** Settings ***
Resource   ../../configs/TestRunConfig.robot
Resource   ../../configs/SeleniumConfigs.robot
Resource   ../locators/BasePageLocators.robot
Resource   ../../core/element/Element.robot
Resource   ../../core/driver/Driver.robot
Resource   BookStorePage.robot


Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections 
Library    ../../core/driver/DriverManager.py

*** Settings ***
Variables    ../../configs/EnvInfo.py

*** Keywords ***

Open Browser And Go To Login Page
    [Documentation]
	...  Open the browser and navigates to the login page  ...
    ${envInfo}=  Get From Dictionary  ${ENVIRONMENTINFO}  ${env}
    ${url}=  Get From Dictionary  ${envInfo}  baseUrl
    Open Browser [Arguments] ${url}
    Maximize Browser Window
    Set Selenium Timeout     ${SELENIUM_TIMEOUT}
    Set Log Level    DEBUG  
    Go To Login Page

Menu Item Exist [Arguments] ${menuItem}
    [Documentation]
	...  Check the menu item exist  ...

    Click Element [Arguments] ${userMenuIcon} ${SMALL_RETRY_COUNT}
    ${userMenuItemLocator}=  Format String	${userMenuItem}	${menuItem}
    Element Should Be Visible [Arguments] ${userMenuItemLocator} ${SMALL_RETRY_COUNT}

Get User Name Label value
    [Documentation]
    ...  Get username value displayed on the page...
    
    ${displayedUsername}=  Get Text [Arguments] ${userNameLabel} ${SMALL_RETRY_COUNT}
    Return From Keyword  ${displayedUsername}

Go To Profile Page
    [Documentation]
    ...  Go to profile page by clicking on Profile menu...
    ...  

    Click Element [Arguments] ${profileMenuItem} ${SMALL_RETRY_COUNT}