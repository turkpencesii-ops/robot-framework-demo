*** Settings ***
Library    AppiumLibrary

*** Variables ***
${APPIUM_SERVER}    http://127.0.0.1:4723

*** Test Cases ***
Open Network Settings On Android
    [Tags]    mobile    smoke
    Open Application    ${APPIUM_SERVER}
    ...    platformName=Android
    ...    appium:automationName=UiAutomator2
    ...    appium:deviceName=emulator-5554
    ...    appium:appPackage=com.android.settings
    ...    appium:appActivity=.Settings
    Wait Until Page Contains Element    xpath=//*[@text="Network & internet"]    15s
    Click Element    xpath=//*[@text="Network & internet"]
    Wait Until Page Contains Element    xpath=//*[@text="Internet"]    10s
    [Teardown]    Close Application
