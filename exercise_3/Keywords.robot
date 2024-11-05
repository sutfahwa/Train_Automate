*** Settings ***
Library     SeleniumLibrary
Resource    ${CURDIR}/Variables.robot


*** Keywords ***
Open Web Browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Login Pass
    Input Text    id=username-input    ${username}
    Input Text    id=password-input    ${password}
    Click Button    id=login-btn
    Element Should Be Visible    ${locator_nav-bar}

Logout
    Click Element    ${locator_avatar-icon}
    Wait Until Element Is Visible    ${locator_profile-menu-list}
    Click Element    ${locator_logout-btn}
    Wait Until Element Is Visible    ${locator_login-container}

Login Fail
    Input Text    id=username-input    111
    Input Text    id=password-input    111
    Click Button    id=login-btn
    Element Should Be Visible    ${locator_noti-login-err}

Add Project
    Click Element    ${locator_menu-icon}
    Wait Until Element Is Visible    ${locator_app-list}
    Click Element    ${locator_Todo-icon}
    Wait Until Page Contains Element    ${locator_left-menu}
    Click Element    ${locator_add-project}
    Wait Until Element Is Visible    ${locator_project-name-input}
    Input Text    ${locator_project-name-input}    Test automate
    Input Text    ${locator_add_state-input}    Todo
    Click Element    ${locator_add-state-btn}
    Click Element    ${locator_add-project-btn}
    Wait Until Element Is Visible    ${locator_project-name}
    Wait Until Element Is Visible    ${locator_add-task-btn}
    Click Element    ${locator_add-task-btn}
    Input Text    ${locator_add-new-task-input}    Test Create Task
    Click Element    ${locator_check-for-add-new-task}
    Wait Until Element Is Visible    ${locator_task-detail-container}
