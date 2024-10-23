*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Test open browser and search
    Open Browser    http://webapp-qa.mellow.io/#/announce    chrome
    Input Text    id=username-input    Qsquad
    Input Text    id=password-input    Qsquad
    Click Element    id=login-btn
    