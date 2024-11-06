*** Settings ***
Resource    ../keyword/common_keyword.robot
Resource    ../keyword/todo_keyword.robot

Suite Setup    Run Keywords
...            Open Mellow website
...    AND     Set Selenium Timeout    10s


Test Setup       Run Keywords
...              Fill in username field with "qsquad"
...    AND       Fill in password field with "password"
...    AND       Click Login button
...    AND       Should show success message with "Login successfully"

Test Teardown    Click avatar button and Logout success

*** Test Cases ***

Scenario: Edit task successfully
    ## Create Project ##
    Given Click app menu icon
    And Select menu "Todo222"
    And Click add project button
    And Fill in project name with "Test automate exercise4"
    And Add Stage "Todo" to project
    And Click Add button in Project modal
    Then Should show project "Test automate exercise4" in list

    ## Create Task ##
    Click Add task button
    Fill in task name field with "Test Create Task"
    Click create task button
    Should show success message with "Task successfully created."
    Click close modal
    Should show task "Test Create Task" in task list
    Select task "Test Create Task" in task list
    Should show task name in task detail modal with "Test Create Task"
    Click Edit task button
    Edit task name to "Task Edit"
    Select priority with "Medium"
    Click Save edit task button
    Should show success message with "Task successfully updated."
    Click close modal
    Should show task "Task Edit" in task list

Scenario: Exercise 5 Deleted All Task in Project
    ## Create Project ##
    Click app menu icon
    Select menu "Todo"
    Click add project button
    Fill in project name with "Test automate exercise5"
    Add Stage "Todo" to project
    Click Add button in Project modal
    Should show project "Test automate exercise5" in list

    ## Create Task ##
    Click Add task button
    Fill in task name field with "Test Create Task1"
    Click create task button
    Should show success message with "Task successfully created."
    Click close modal
    Should show task "Test Create Task1" in task list

    Click Add task button
    Fill in task name field with "Test Create Task2"
    Click create task button
    Should show success message with "Task successfully created."
    Click close modal
    Should show task "Test Create Task2" in task list

    Click Add task button
    Fill in task name field with "Test Create Task3"
    Click create task button
    Should show success message with "Task successfully created."
    Click close modal
    Should show task "Test Create Task3" in task list


    ## Delete ##
    Click option behind task "Test Create Task1" in task list
    Select menu delete behind task name
    Display confirm modal with title "Delete Task"
    Click confirm delete button
    Should show success message with "Task successfully deleted."

    Click option behind task "Test Create Task2" in task list
    Select menu delete behind task name
    Display confirm modal with title "Delete Task"
    Click confirm delete button
    Should show success message with "Task successfully deleted."

    Click option behind task "Test Create Task3" in task list
    Select menu delete behind task name
    Display confirm modal with title "Delete Task"
    Click confirm delete button
    Should show success message with "Task successfully deleted."
    
    Not show task in project
    




    
    