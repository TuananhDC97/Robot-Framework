import allure
from SeleniumLibrary import ScreenshotKeywords
from SeleniumLibrary.base import keyword, LibraryComponent


class AllureSeleniumPlugin(LibraryComponent):

    @keyword
    def capture_page_screenshot(self, filename='selenium-screenshot-{index}.png'):
        path = ScreenshotKeywords(ctx=self.ctx).capture_page_screenshot(filename)
        print(path)
        allure.attach.file(path, attachment_type=allure.attachment_type.PNG)