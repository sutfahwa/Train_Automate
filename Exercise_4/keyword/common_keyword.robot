*** Settings ***
Library     SeleniumLibrary
Resource    ../variables/common_variables.robot

*** Keywords ***
### Login ###
Open Mellow website
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${usernameField}

Fill in username field with "${username}"
    Wait Until Element Is Visible    ${usernameField}
    Input Text    ${usernameField}    ${username}
    Textfield Value Should Be    ${usernameField}    ${username}


Fill in password field with "${password}" 
    Wait Until Element Is Visible    ${passwordField}
    Input Text    ${passwordField}    ${password}
    Textfield Value Should Be     ${passwordField}    ${password}

Click Login button
    Element Should Be Visible    ${loginBtn}
    Click Element    ${loginBtn}

Should show success message with "${message}"
    Wait Until Element Contains    ${successMessage}    ${message}
    Element Should Contain    ${successMessage}    ${message}

Click avatar button and Logout success
    Wait Until Element Is Visible    ${avatarBtn}
    Click Element    ${avatarBtn}
    Wait Until Element Is Visible    ${LogoutBtn}
    Click Element    ${LogoutBtn}

Click app menu icon
    Wait Until Element Is Visible    ${AppMenu}
    Click Element    ${AppMenu}

Select menu "${menuName}"
    ${menubtn}=    Set Variable If
    ...        "${menuName}" == "Todo"            ${TodoMenu}
    ...        "${menuName}" == "Visitor"         ${visitorMene}
    Wait Until Element Is Visible    ${menubtn}
    Click Element    ${menubtn}
