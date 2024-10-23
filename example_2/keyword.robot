*** Settings ***
Library        SeleniumLibrary
Resource       veriable.robot

*** Keywords ***

Open mellow matic website
    Open Browser    ${url}    ${browser}
    Wait Until Element Is Visible    ${loginIcon} 

Fill in username field with "${username}"
    Wait Until Element Is Visible         ${usernameField}
    Input Text        ${usernameField}    ${username}

Fill in password field with "${password}"
    Wait Until Element Is Visible    ${passwordField}
    Input Text    ${passwordField}    ${password}

Click login button
    Wait Until Element Is Visible    ${loginBtn}
    Click Button    ${loginBtn}