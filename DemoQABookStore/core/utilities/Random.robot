*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem

*** Keywords ***

Get Random Text
     [Documentation]
	...  Return random text value  ...
      
    ${randomText}    Generate Random String      8      [LETTERS]
    Return From Keyword     ${randomText}