*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/todo_variables.robot
Resource    ../variables/common_variables.robot

*** Keywords ***

### AppTodo ####

Click add project button
    Wait Until Element Is Visible    ${AddProjectBtn}
    Click Element    ${AddProjectBtn}
    Wait Until Element Is Visible    ${modalTitle}
    Element Should Contain    ${modalTitle}    Add Project

Fill in project name with "${projectName}"
    Wait Until Element Is Visible    ${projectNameField}
    Input Text    ${projectNameField}    ${projectName}
    Textfield Value Should Be    ${projectNameField}    ${projectName}

Fill in Description with "${description}"
    Wait Until Element Is Visible    ${descriptionField}
    Input Text    ${descriptionField}    ${description}
    Textfield Value Should Be    ${descriptionField}    ${description}

Add Stage "${stageName}" to project
    Wait Until Element Is Visible    ${addStageField}
    Input Text    ${addStageField}   ${stageName}
    Textfield Value Should Be     ${addStageField}   ${stageName}
    Click Element    ${addStageBtn}

Click Add button in Project modal
    Wait Until Element Is Visible    ${AddBtnInProjectModal}
    Click Element    ${AddBtnInProjectModal}    

Should show project "${projectName}" in list
    Wait Until Element Is Visible    ${projectList}
    ${list}=    Get Element Count    xpath=//*[@id="project-menu-container"]//*[@data-type="project-item"]
    Log    ${list}
    FOR  ${i}  IN RANGE  ${list}
        ${ListProject}=    Get Text   xpath=//*[@id="project-menu-container"]//*[@data-type="project-item"][${i}+1]
        Log    ${ListProject}
        Exit For Loop IF	'${ListProject}' == '${projectName}'
    END

Click Add task button
    Wait Until Element Is Visible    ${addTaskBtn}
    Click Element    ${addTaskBtn}

Fill in task name field with "${taskName}"
    Wait Until Element Is Visible    ${taskNameField}
    Input Text     ${taskNameField}    ${taskName}
    Textfield Value Should Be    ${taskNameField}    ${taskName}

Click create task button
    Wait Until Element Is Visible    ${addTaskInLineBtn}
    Click Element    ${addTaskInLineBtn}

Click close modal
    Wait Until Element Is Visible    ${closeModalBtn}
    Click Element    ${closeModalBtn}

Should show task "${taskName}" in task list
    Wait Until Element Is Visible    ${listTask}
    ${list}=    Get Element Count    xpath=//*[@class="height-same-parent task-list-container"]//*[@class="task-item-container"]//*[@class="task-name overflow-ellipse"]
    Log    ${list}
    FOR  ${i}  IN RANGE  ${list}
        ${ListTaskItem}=    Get Text   xpath=//*[@class="height-same-parent task-list-container"]//*[@class="task-item-container"][${i}+1]//*[@class="task-name overflow-ellipse"]
        Log    ${ListTaskItem}
        Exit For Loop IF	'${ListTaskItem}' == '${taskName}'
    END


Select task "${taskName}" in task list
    Wait Until Element Is Visible    ${listTask}
    ${list}=    Get Element Count    xpath=//*[@class="height-same-parent task-list-container"]//*[@class="task-item-container"]//*[@class="task-name overflow-ellipse"]
    Log    ${list}
    FOR  ${i}  IN RANGE  ${list}
        ${ListTaskItem}=    Get Text   xpath=//*[@class="height-same-parent task-list-container"]//*[@class="task-item-container"][${i}+1]//*[@class="task-name overflow-ellipse"]
        Log    ${ListTaskItem}
        Run Keyword If    '${ListTaskItem}' == '${taskName}'  Click Element    xpath=//*[@class="height-same-parent task-list-container"]//*[@class="task-item-container"][${i}+1]//*[@class="task-name overflow-ellipse"]
    END

Should show task name in task detail modal with "${taskName}"
    Wait Until Element Is Visible    ${taskNameInModal}    
    Element Should Contain    ${taskNameInModal}    ${taskName}


Click Edit task button
    Wait Until Element Is Visible    ${editTaskBtn}
    Click Element    ${editTaskBtn} 

Edit task name to "${taskName}"
    Wait Until Element Is Visible    ${editTaskNameField} 
    Clear Element Text    ${editTaskNameField} 
    Input Text    ${editTaskNameField}    ${taskName}

Click Save edit task button
    Wait Until Element Is Visible    ${updateTaskbtn}
    Click Element    ${updateTaskbtn}

Select priority with "${priority}"
    Wait Until Element Is Visible    ${prioritySelector}
    Click Element    ${prioritySelector}
    ${priorityMenu}=    Set Variable If
    ...        "${priority}" == "High"           ${highPriority}
    ...        "${priority}" == "Medium"         ${mediumPriority}
    ...        "${priority}" == "Low"            ${lowPriority}
    Wait Until Element Is Visible    ${priorityMenu}
    Click Element    ${priorityMenu}

Click option behind task "${taskName}" in task list
    Wait Until Element Is Visible    ${listTask}
    ${list}=    Get Element Count    xpath=//*[@class="height-same-parent task-list-container"]//*[@class="task-item-container"]//*[@class="task-name overflow-ellipse"]
    Log    ${list}
    FOR  ${i}  IN RANGE  ${list}
        ${ListTaskItem}=    Get Text   xpath=//*[@class="height-same-parent task-list-container"]//*[@class="task-item-container"][${i}+1]//*[@class="task-name overflow-ellipse"]
        Log    ${ListTaskItem}
        Run Keyword If    '${ListTaskItem}' == '${taskName}'  Click Element    xpath=//*[@class="height-same-parent task-list-container"]//*[@class="task-item-container"][${i}+1]//*[@class="option-dropdown-icon kebab-icon ant-dropdown-trigger"]
    END


Select menu delete behind task name
    Wait Until Element Is Visible    ${deleteTaskInline}
    Click Element    ${deleteTaskInline}

Display confirm modal with title "${title}"
    Wait Until Element Is Visible    ${confirmModal} 
    Element Should Contain    ${confirmModal}     ${title}

Click confirm delete button
    Wait Until Element Is Visible    ${confirmDeleteBtn}
    Click Element    ${confirmDeleteBtn}

Not show task in project
    Wait Until Element Is Visible    ${noTask}
    Element Should Contain    ${noTask}    No task

