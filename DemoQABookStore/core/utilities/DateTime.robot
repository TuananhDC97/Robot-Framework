*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem

*** Keywords ***

Get Current Epoch Time
     [Documentation]
	 ...  Return current epoch time  ...
    
    ${currentEpochTime}    Get Time    epoch
    Return From Keyword     ${currentEpochTime}   