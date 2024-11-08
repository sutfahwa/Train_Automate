*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/todo_variables.robot
Resource    ../variables/common_variables.robot

*** Keywords ***
Tap App list icon
    Click Element    ${appMenuIcon}
    Element Should Be Visible    ${appMenuList}

Tap Todo button
    Click Element    ${appIconTodo}
    Element Should Be Visible    ${leftMenuBar}
    Element Should Contain    ${leftMenuBar}    Todo

Tap Add Project button
    Set Selenium Speed    0.5s
    Click Element    ${addProjectBtn}
    Wait Until Element Is Visible    ${projectNameInput}   

Fill in project name with "${projectName}"
    Input Text    ${projectNameInput}    ${projectName}
    Textfield Value Should Be    ${projectNameInput}    ${projectName}

Fill in state with "${state}"
    Input Text    ${addStateInput}    ${state}
    Textfield Value Should Be    ${addStateInput}    ${state}
    Click Element    ${addStateBtn}




