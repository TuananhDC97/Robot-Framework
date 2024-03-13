# Robot Framework Page Object Model Demo

<br>

## Robot Framework Introduction

[Robot Framework](http://robotframework.org) is a generic open source
automation framework for acceptance testing, acceptance test driven
development (ATDD), and robotic process automation (RPA). It has simple plain
text syntax and it can be extended easily with libraries implemented using
Python or Java.

Robot Framework is operating system and application independent. The core
framework is implemented using [Python](http://python.org), supports both
Python 2 and Python 3, and runs also on [Jython](http://jython.org) (JVM),
[IronPython](http://ironpython.net) (.NET) and [PyPy](http://pypy.org).
The framework has a rich ecosystem around it consisting of various generic
libraries and tools that are developed as separate projects. For more
information about Robot Framework and the ecosystem, see
http://robotframework.org.

Robot Framework project is hosted on GitHub where you can find source code,
an issue tracker, and some further documentation. Downloads are hosted on PyPI, except
for the standalone JAR distribution that is on Maven central.

Robot Framework development is sponsored by [Robot Framework Foundation](http://robotframework.org/foundation).

[GitHub](https://github.com/robotframework/robotframework)

[PyPI](https://pypi.python.org/pypi/robotframework)

[Maven central](http://search.maven.org/#search%7Cga%7C1%7Ca%3Arobotframework)

<br>

## Installation

1. Download [Python 3.12.1](https://www.python.org/downloads/release/python-3121/ "Python 3.12.1").
2. Open installer and select option `Add Python 3.12.1 to PATH` then continute to install as default.
3. Add **Scripts** folder inside the **Python** installation directory into the **PATH** variable.       //You can use `where python` command in command line to know where python located
4. Install dependencies package.
    `pip install -r requirements.txt`


## Example

Here, I have developed sample test cases for a sample web site [Demo QA Book Store](https://demoqa.com/books).

This project is developed to demontrate robot framework with selenium and page object model. Besides, we also implement some test cases for API and integrate API in UI test cases for prepare/cleaning test data.

<br>

## File organization
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
<br>

## Usage

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

## Error

1. If got error 'cannot be loaded because running scripts is disabled on this system', open PowerShell with Run as Administrator and run command below:
     Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
Then type 'Y' and press Enter
2. If got error 'There is no such driver by url'. Run command below in terminal:
     pip install webdriver-manager --upgrade

<br>

## License
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/License_icon-mit-2.svg/2000px-License_icon-mit-2.svg.png" alt="MIT License" width="100" height="100"/> [MIT License](https://opensource.org/licenses/MIT)


