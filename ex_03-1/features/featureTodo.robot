*** Settings ***
Resource    ../keywords/common_keywords.robot
Resource    ../keywords/todo_keywords.robot

Suite Setup    Run Keywords
...            Open Mellow website
...    AND     Set Selenium Timeout    10s


Test Setup       Run Keywords
...              Fill in username field with "qsquad"
...    AND       Fill in password field with "password"
...    AND       Click Login button
...    AND       Should show success message with "Login successfully"

# Test Teardown    Click avatar button and Logout success

Suite Teardown    Close All Browsers

*** Test Cases ***
Create Project
    Tap App list icon
    Tap Todo button
    Tap Add Project button
    Fill in project name with "Test1"
    Fill in state with "Todo"