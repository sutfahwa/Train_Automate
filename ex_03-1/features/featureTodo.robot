*** Settings ***
Resource            ../keywords/common_keywords.robot
Resource            ../keywords/todo_keywords.robot

Suite Setup         Run Keywords
...                     Open Mellow website
...                     AND    Set Selenium Timeout    10s
Suite Teardown      Close All Browsers
Test Setup          Run Keywords
...                     Fill in username field with "qsquad"
...                     AND    Fill in password field with "password"
...                     AND    Click Login button
...                     AND    Should show success message with "Login successfully"
Test Teardown       Click avatar button and Logout success


*** Test Cases ***
Create Project
    Tap App list icon
    Tap Todo button
    Tap Add Project button
    Fill in project name with "Test1"
    Fill in state with "Todo"
    Tap Add Project on Modal
    Should show project name "Test1"

# Add Task
    Tap + button to add task
    Fill in Task name with "Task1"
    Tap Add Task name button
    Should show Task name "Task1"
    Tap X button to close Task modal
    Should show task "Task1" in task list
    Tap + button to add task
    Fill in Task name with "Task2"
    Tap Add Task name button
    Should show Task name "Task2"
    Tap X button to close Task modal
    Should show task "Task2" in task list

# Edit Task
    Tap Task name "Task2" on Task list
    Tap Edit Task name button
    Edit Task name to "edited"
    Tap Save Task button
    Tap X button to close Task modal
    Should show task "edited" in task list

# Delete Task
    Tap kebab icon on task "Task1"
    Tap Delete task button on kebab
    Tap Confirm delete task on modal
# Delete Project
    Delete Project
