# it fails to download images because of User-Agent being blocked

# ---------------------------------------------------------------------------------------------------------------------
from os import path
from random import randrange
import time
import os
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options

root = "https://wallpapercave.com"
url = f"{root}/categories/anime"
wallpaper_folder = path.abspath('/home/mohitjangra/Pictures/wallpapers/anime/')

if __name__ == "__main__":
    options = Options()
    profile = webdriver.FirefoxProfile()

    if not path.exists(wallpaper_folder):
        os.mkdir(wallpaper_folder)
        print("Created wallpaper folder")
    else:
        print("wallpaper folder exists")

    # changing user agent to google's user agent to bypass connection rejection
    user_agent_firefox = "Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/118.0"
    user_agent_google = "Mediapartners-Google"
    googlebot = "Googlebot"
    profile.set_preference("general.useragent.override", user_agent_firefox)
    options.profile = profile
    # options.set_preference("browser.download.folderList", 2)
    # options.set_preference("browser.download.manager.showWhenStarting", False)
    options.set_preference("browser.download.dir", "./downloads")
    # options.set_preference(
    #     "browser.helperApps.neverAsk.saveToDisk", "application/x-gzip")
    browser = webdriver.Firefox(options)

    browser.get(url)
    start_index: int = 0
    end_index: int = 0
    anchors = browser.find_elements(By.CLASS_NAME, 'albumthumbnail')
    try:
        for index, anchor in enumerate(anchors):
            if anchor.get_dom_attribute('href') == "/akatsuki-wallpaper-hd":
                anchors = anchors[index:]
                start_index = index
                end_index = len(anchors)
                break

        for anchor in anchors:
            anchor.click()
            time.sleep(randrange(5))
            downloads = browser.find_elements(By.CLASS_NAME, "download")
            folder = browser.find_element(
                By.ID, "albuminfo").find_element(By.TAG_NAME, "h1").text
            print(folder)
            download_folder = path.join(wallpaper_folder, folder)
            options.set_preference("browser.download.dir", download_folder)

            if not path.exists(download_folder):
                os.mkdir(download_folder)
                print("Created download folder")
            else:
                print("download folder exists")

            # for download in downloads:
            #     try:
            #         time.sleep(randrange(5))
            #         download.click()
            #         print("\tImage downloaded")
            #     except Exception:
            #         download_url = root + download.get_dom_attribute("href")
            #         profile.set_preference(
            #             "general.useragent.override", googlebot)
            #         browser.get(download_url)
            #         response = requests.get(download_url, headers={
            #                                 "User-Agent": "Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/118.0"})
            #         print(response)
            # browser.back()
            time.sleep(15)
    finally:
        browser.quit()
