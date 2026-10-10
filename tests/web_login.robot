*** Settings ***
Library           SeleniumLibrary
Test Setup        Open Browser    https://www.saucedemo.com    ${BROWSER}
Test Teardown     Close Browser

*** Variables ***
${BROWSER}    chrome
${USER}       standard_user
${PASS}       secret_sauce

*** Test Cases ***
Valid Login
    [Tags]    smoke
    Login With    ${USER}    ${PASS}
    Wait Until Page Contains Element    css:.inventory_list    10s

Invalid Login Shows Error
    [Template]    Login Should Fail
    locked_out_user    ${PASS}
    wrong_user         wrong_pass
    ${EMPTY}           ${PASS}

*** Keywords ***
Login With
    [Arguments]    ${username}    ${password}
    Input Text        id:user-name    ${username}
    Input Password    id:password     ${password}
    Click Button      id:login-button

Login Should Fail
    [Arguments]    ${username}    ${password}
    Login With    ${username}    ${password}
    Element Should Be Visible    css:[data-test="error"]
