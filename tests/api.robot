*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Get User Returns 200
    [Tags]    api    smoke
    ${resp}=    GET    ${BASE_URL}/users/1    expected_status=200
    Should Be Equal As Integers    ${resp.json()}[id]    1
    Should Be Equal    ${resp.json()}[username]    Bret

Create Post Returns 201
    [Tags]    api
    ${body}=    Create Dictionary    title=Test    body=Robot Framework    userId=1
    ${resp}=    POST    ${BASE_URL}/posts    json=${body}    expected_status=201
    Should Be Equal    ${resp.json()}[title]    Test

Unknown User Returns 404
    [Tags]    api    negative
    GET    ${BASE_URL}/users/9999    expected_status=404robot -d results tests/api.robot