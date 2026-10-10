# Robot Framework Demo – Web, API & Mobile

Test automation demo project built with **Robot Framework**, covering three layers:

| Suite | Library | What it tests |
|---|---|---|
| `tests/web_login.robot` | SeleniumLibrary | Login on saucedemo.com – positive & data-driven negative cases (`[Template]`) |
| `tests/api.robot` | RequestsLibrary | REST API (GET / POST, status codes, JSON assertions, 404 negative case) |
| `tests/mobile.robot` | AppiumLibrary | Android Settings app on emulator via Appium 3 + UiAutomator2 |

## Concepts used
- Test Setup / Teardown, explicit waits (`Wait Until ...`)
- Tags (`smoke`, `api`, `mobile`, `negative`) for selective runs
- Data-driven tests with `[Template]`
- Reusable user keywords with `[Arguments]`

## Setup
```bash
pip install robotframework robotframework-seleniumlibrary robotframework-requests robotframework-appiumlibrary
npm install -g appium
appium driver install uiautomator2
```

## Run
```bash
robot -d results tests/                 # all tests
robot -d results -i smoke tests/        # smoke tests only
robot -v BROWSER:firefox -d results tests/web_login.robot
```

Mobile tests require a running Android emulator and Appium server (`appium`).