*** Settings ***
Resource   ../locators/ProfilePageLocators.robot
Resource    ../../core/element/Element.robot
Resource   ../../configs/TestRunConfig.robot
Resource   ../../core/element/Element.robot
Resource   ../../core/driver/Driver.robot
Library    String

*** Keywords ***

Delete A Book By Name [Arguments] ${bookName}
   [Documentation]
   ...  Delete a book by name ...
   ...  
   
   ${deleteButtonLocator}=  Format String	${deleteButtonFormat}	${bookName}
   Click Element [Arguments] ${deleteButtonLocator} ${SMALL_RETRY_COUNT}
   Click Element [Arguments] ${okButton} ${SMALL_RETRY_COUNT}
   Accept Alert

Book should be removed from profile [Arguments] ${bookName}
   [Documentation]
   ...  Verify book is remove from profile...
   ...  
   
   ${deleteButtonLocator}=  Format String	${deleteButtonFormat}	${bookName}
   Element Should Not Be Visible [Arguments] ${deleteButtonLocator} ${SMALL_RETRY_COUNT}
