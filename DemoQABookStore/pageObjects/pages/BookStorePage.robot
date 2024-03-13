*** Settings ***

Resource   ../locators/BookStorePageLocators.robot
Resource   ../../core/element/Element.robot
Resource   ../../configs/TestRunConfig.robot
Resource   ../locators/BasePageLocators.robot

*** Keywords ***

Go To Login Page
   [Documentation]
   ...  Click Login button to go to login page...
   
   Click Element [Arguments] ${loginButton} ${SMALL_RETRY_COUNT}

Select Book [Arguments] ${bookName}
   [Documentation]
   ...  Select a book by name...
   ...  

   ${bookLinkLocator}=  Format String	${bookLinkFormat}	${bookName}
   Click Element [Arguments] ${bookLinkLocator} ${SMALL_RETRY_COUNT}

Wait For BookStore Page Load
   [Documentation]
   ...  Wait for BookStore page finish loading...
   ...  
   
   Wait Until Element Is Visible    ${userNameLabel}
