*** Settings ***
Resource   ../../configs/TestRunConfig.robot
Resource   ../../configs/SeleniumConfigs.robot
Resource   ../../configs/TestRunConfig.robot

Library    SeleniumLibrary
Library    String
Library    OperatingSystem
Library    DriverManager.py
Library    Collections 

*** Settings ***

Variables    ../../configs/BrowserInfo.py

*** Keywords ***

Scroll To The Top Of The Page
    [Documentation]
	...  Scroll to the top of the page
	
    Execute JavaScript    window.scrollTo(0, 0)
      
	  
Scroll To The Bottom Of The Page
    [Documentation]
	...  Scroll to the bottom of the page
	
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

Accept Alert
    [Documentation]
    ...  Wrap RobotFW accept alert method...
    ...  

    Handle Alert  ACCEPT
Open Browser [Arguments] ${url}
    [Documentation]
    ...  Start new browser
    
    Log To Console    InOpenBrowserFunction
    ${driver_path}=   DriverManager.Get Driver Path  ${BROWSER}
    Log To Console    ${driver_path}
    ${driver_info}=   Get From Dictionary  ${BROWSERINFO}  ${BROWSER}
    ${browser_name}=  Get From Dictionary  ${driver_info}  browser
    ${alias}=  Get From Dictionary  ${driver_info}  alias
    ${remote_url}=  Get From Dictionary  ${driver_info}  remote_url
    ${desired_capabilities}=  Get From Dictionary  ${driver_info}  desired_capabilities
    ${ff_profile_dir}=  Get From Dictionary  ${driver_info}  ff_profile_dir
    ${options}=  Get From Dictionary  ${driver_info}  options
    ${service_log_path}=  Get From Dictionary  ${driver_info}  service_log_path
    Open Browser      url=${url}   browser=${browser_name}   executable_path=${driver_path}   alias=${alias}   desired_capabilities=${desired_capabilities}   remote_url=${remote_url}   ff_profile_dir=${ff_profile_dir}   options=${options}   service_log_path=${service_log_path}