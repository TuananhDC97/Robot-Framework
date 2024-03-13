*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary
Library  String
Resource  ../../core/api/API.robot
Resource  AccountHelper.robot

*** Variables ***
${BookAPICategory}  BookStore/v1/

*** Keywords ***

Add Book To Collection [Arguments] ${userID} ${bookISBN} ${token}
   [Documentation]
   ...  Add an book to the collection...
   
   Log To Console    InAddBook
   ${endpoint}=  Set Variable  ${BookAPICategory}Books
   ${bookInfo}=  Create Dictionary  isbn=${bookISBN}
   ${listBook}=  Create List  ${bookInfo}
   &{body}=  Create Dictionary  userId=${userID}  collectionOfIsbns=${listBook}
   ${jsonString}=  Convert Json To String    ${body}
   &{header}=  Generate Token Header [Arguments] ${token}
   ${response}=  Send Post Request    endpoint=${endpoint}  body=${jsonString}  header=${header}  
   Return From Keyword  ${response}

Delete A Book From Collection [Arguments] ${userID} ${bookISBN} ${token}
   [Documentation]
   ...  Remove a book from the collection...
   ...  
   
   Log To Console    InDeleteBook
   ${endpoint}=  Set Variable  ${BookAPICategory}Book
   ${body}=  Create Dictionary  isbn=${bookISBN}  userId=${userID}
   ${jsonString}=  Convert Json To String    ${body}
   &{header}=  Generate Token Header [Arguments] ${token}
   ${response}=  Send Delete Request    endpoint=${endpoint}  body=${jsonString}  header=${header}  
   Return From Keyword  ${response}

    