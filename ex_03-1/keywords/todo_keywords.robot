*** Settings ***
Library     SeleniumLibrary
Resource    ../variables/todo_variables.robot
Resource    ../variables/common_variables.robot


*** Keywords ***
Tap App list icon
    Wait Until Element Is Visible    ${appMenuIcon}
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

Tap Add Project on Modal
    Click Element    ${addProjectOnModalBtn}
    Element Should Be Visible    ${notificationSuccessToast}

Should show project name "${projectName}"
    Wait Until Element Is Visible    ${projectNameHeader}
    Element Should Contain    ${projectNameHeader}    ${projectName}

Tap + button to add task
    Wait Until Element Is Visible    ${plusTaskBtn}
    Click Element    ${plusTaskBtn}
    Element Should Be Visible    ${taskNameInput}

Fill in Task name with "${taskText}"
    Wait Until Element Is Visible    ${taskNameInput}
    Input Text    ${taskNameInput}    ${taskText}
    Textfield Value Should Be    ${TaskNameInput}    ${taskText}

Tap Add Task name button
    Click Element    ${addTaskName}
    Element Should Be Visible    ${notificationSuccessToast}

Should show Task name "${Taskname}"
    Wait Until Element Is Visible    ${taskNameOnModal}
    Element Should Contain    ${taskNameOnModal}    ${Taskname}

Tap X button to close Task modal
    Wait Until Element Is Visible    ${closeModalTask}
    Click Element    ${closeModalTask}
    Element Should Not Be Visible    ${taskNameOnModal}

Tap Task name "${taskName}" on Task list
    Wait Until Element Is Visible    ${listTask}
    ${list}=    Get Element Count
    ...    //*[@class="height-same-parent task-list-container"]//*[@class="task-item-container"]//*[@class="task-name overflow-ellipse"]
    FOR    ${i}    IN RANGE    ${list}
        ${ListTaskItem}=    Get Text
        ...    //*[@class="height-same-parent task-list-container"]//*[@class="task-item-container"][${i}+1]//*[@class="task-name overflow-ellipse"]
        IF    '${ListTaskItem}' == '${taskName}'
            Click Element
            ...    //*[@class="height-same-parent task-list-container"]//*[@class="task-item-container"][${i}+1]//*[@class="task-detail-leading-container"]
        END
    END
    Element Should Be Visible    ${taskNameOnModal}

Tap kebab icon on task "${taskName}"
    Wait Until Element Is Visible    ${listTask}
    ${list}=    Get Element Count
    ...    //*[@class="height-same-parent task-list-container"]//*[@class="task-item-container"]//*[@class="task-name overflow-ellipse"]
    FOR    ${i}    IN RANGE    ${list}
        ${ListTaskItem}=    Get Text
        ...    //*[@class="height-same-parent task-list-container"]//*[@class="task-item-container"][${i}+1]//*[@class="task-name overflow-ellipse"]
        IF    '${ListTaskItem}' == '${taskName}'
            Click Element
            ...    //*[@class="height-same-parent task-list-container"]//*[@class="task-item-container"][${i}+1]//*[@class="option-dropdown-icon kebab-icon ant-dropdown-trigger"]
        END
    END

Tap Delete task button on kebab
    Wait Until Element Is Visible    ${deleteTaskOnKebabBtn}
    Click Element    ${deleteTaskOnKebabBtn}
    Element Should Be Visible    ${confirmDeleteTaskOnModalBtn}

Tap Confirm delete task on modal
    Wait Until Element Is Visible    ${confirmDeleteTaskOnModalBtn}
    Click Element    ${confirmDeleteTaskOnModalBtn}
    Element Should Be Visible    ${notificationSuccessToast}

Should show task "${taskName}" in task list
    Wait Until Element Is Visible    ${listTask}
    ${list}=    Get Element Count
    ...    //*[@class="height-same-parent task-list-container"]//*[@class="task-item-container"]//*[@class="task-name overflow-ellipse"]
    Log    ${list}
    FOR    ${i}    IN RANGE    ${list}
        ${ListTaskItem}=    Get Text
        ...    //*[@class="height-same-parent task-list-container"]//*[@class="task-item-container"][${i}+1]//*[@class="task-name overflow-ellipse"]
        Log    ${ListTaskItem}
        IF    '${ListTaskItem}' == '${taskName}'    BREAK
    END

Tap Edit Task name button
    Wait Until Element Is Visible    ${editTaskNameBtn}
    Click Element    ${editTaskNameBtn}
    Element Should Be Visible    ${taskDescriptionInput}

Edit Task name to "${editedText}"
    Wait Until Element Is Visible    ${taskNameOnModal}
    Clear Element Text    ${taskNameOnModal}
    Input Text    ${taskNameOnModal}    ${editedText}
    Textfield Value Should Be    ${taskNameOnModal}    ${editedText}

Tap Save Task button
    Wait Until Element Is Visible    ${saveTaskBtn}
    Click Element    ${saveTaskBtn}
    Element Should Be Visible    ${notificationSuccessToast}

Delete project
    Click Element    ${editProjectBtn}
    Wait Until Element Is Visible    ${deleteProjectBtn}
    Click Element    ${deleteProjectBtn}
    Wait Until Element Is Visible    ${confirmDeleteProjectOnModalBtn}
    Click Button    ${confirmDeleteProjectOnModalBtn}
    Element Should Be Visible    ${notificationSuccessToast}
