*** Settings ***
Library     SeleniumLibrary
Resource    ../variables/common_variables.robot

*** Keywords ***

Open Mellow website
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${usernameInput}

Fill in username field with "${username}"
    Wait Until Element Is Visible    ${usernameInput}
    Input Text    ${usernameInput}    ${username}
    Textfield Value Should Be    ${usernameInput}    ${username}


Fill in password field with "${password}" 
    Wait Until Element Is Visible    ${passwordInput}
    Input Text    ${passwordInput}    ${password}
    Textfield Value Should Be     ${passwordInput}    ${password}

Click Login button
    Element Should Be Visible    ${loginBtn}
    Click Element    ${loginBtn}

Should show success message with "${message}"
    Wait Until Element Contains    ${successMessage}    ${message}
    Element Should Contain    ${successMessage}    ${message}

Click avatar button and Logout success
    Wait Until Element Is Visible    ${avatarIcon}
    Click Element    ${avatarIcon}
    Wait Until Element Is Visible    ${LogoutBtn}
    Click Element    ${LogoutBtn}
