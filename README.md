# Project Name #

Study Project: Automation Testing with Robot Framework using Python

# Author #

Le Tuan Anh

# Completion Period # 

January 2022 - April 2022

 # Description # 

This project is an automation testing suite built using Robot Framework using Python to test the functionalities of DemoQA.com. It leverages the Page Object Model (POM) for efficient test organization and maintainability.

 # Technologies Used # 

Robot Framework: Open-source framework for keyword-driven testing

Python: General-purpose programming language for test scripts

Page Object Model (POM): Design pattern for structuring test code

 # Scope # 

The project focuses on automated testing of both UI (User Interface) elements and API endpoints of DemoQA.com. This allows for comprehensive validation of the application's behavior.


# Installation # 

1. Download [Python 3.12.1](https://www.python.org/downloads/release/python-3121/ "Python 3.12.1").
2. Open installer and select option `Add Python 3.12.1 to PATH` then continute to install as default.
3. Add **Scripts** folder inside the **Python** installation directory into the **PATH** variable.       //You can use `where python` command in command line to know where python located
4. Install dependencies package.
    `pip install -r requirements.txt`

# Folder Structure # 
```
Robot-Page-Object-Model-Demo/
|- DemoQABookStore/                                               // Home folder for Demo QA Book Store automation project
  |- configs/BrowserInfo.py                                       // Browser definitions
  |- configs/EnvInfo.py                                           // Environment defintions
  |- configs/SeleniumConfigs.robot                                // Selenium configurations
  |- configs/TestRunConfig.robot                                  // Test Run configurations
  |- core/api                                                     // API method wrapper
  |- core/driver                                                  // Common driver keywords
  |- core/element                                                 // Common element keywords
  |- core/report                                                  // Plugin for Allure report
  |- core/utilities                                               // Keywords for date time, random
  |- data/*.robot                                                 // Test data
  |- helper/apiHelper/*.robot                                     // API Helper for the Demo QA BookStore application
  |- pageObjects/locators/*.robot                                 // Locators of the application
  |- pageObjects/pages/*.robot                                    // Page object keywords of the application
  |- testCases/api/*.robot                                        // API test cases of the application
  |- testCases/ui/*.robot                                         // UI test cases of the application
|- .gitignore                                                     // Excluded the unnecessary files in the repo
|- README.md                                                      // This file
```

# Usage # 

Starting from Robot Framework 3.0, tests are executed from the command line
using the ``robot`` script or by executing the ``robot`` module directly
like ``python -m robot`` or ``jython -m robot``.

The basic usage is giving a path to a test (or task) file or directory as an
argument with possible command line options before the path

     robot .\DemoQABookStore\testCases\ui\LoginTest.robot
     robot .\DemoQABookStore\testCases\ui\

Run specific test cases by tag with -i

     robot --outputdir robot_results -i smoke .\DemoQABookStore\testCases\

Run test with crossed browser

     robot --outputdir robot_results --variable browser:firefox  .\DemoQABookStore\testCases\ui\LoginTest.robot

Run test with specific environment

     robot --outputdir robot_results --variable env:uat  .\DemoQABookStore\testCases\ui\LoginTest.robot  

Run test cases in parallel with pabot

     pabot --processes 2 .\DemoQABookStore\testCases\ui

Set result folder with --outputdir

     robot --outputdir robot_results .\DemoQABookStore\testCases\ui\LoginTest.robot

Generate allure report

     allure generate --clean --output ./results/allure      //Clean report before run

     robot --listener 'allure_robotframework;./results/allure' .\DemoQABookStore\testCases\ui\LoginTest.robot      //Run test

     allure serve ./results/allure      //Open report
     

<br>

#  Error # 

1. If got error 'cannot be loaded because running scripts is disabled on this system', open PowerShell with Run as Administrator and run command below:
     Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
Then type 'Y' and press Enter
2. If got error 'There is no such driver by url'. Run command below in terminal:
     pip install webdriver-manager --upgrade

<br>

# Further Enhancements # 

This README.md file provides a basic guide to get you started with the project. Feel free to customize and adapt it further based on your specific project structure and testing needs.
