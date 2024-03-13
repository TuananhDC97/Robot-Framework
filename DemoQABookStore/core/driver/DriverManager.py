from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager

def get_driver_path(browser):
    driver_path = 'Unsupported browser'
    if browser == 'chrome':
        driver_path = ChromeDriverManager().install()
    elif browser == 'firefox':
        driver_path = GeckoDriverManager().install()
    return  driver_path