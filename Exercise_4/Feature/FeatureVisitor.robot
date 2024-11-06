*** Settings ***
Resource    ../keyword/common_keyword.robot
Resource    ../keyword/visitor_keyword.robot
Resource    ../keyword/todo_keyword.robot

Suite Setup    Run Keyword
...            Open Mellow website

Test Setup       Run Keywords
...              Fill in username field with "qsquad"
...    AND       Fill in password field with "password"
...    AND       Click Login button
...    AND       Should show success message with "Login successfully"

Test Teardown    Click avatar button and Logout success

*** Test Cases ***

Scenario: Create visitor success
    ## Create Project ##
    Click app menu icon
    Select menu "Visitor"
    Select Visitor Menu
    Click Add Visitor button
    Should show modal title with "Add Visitor"
    Fill in guest firstname field with "TestVisitor"
    Fill in guest lastname field with "Automate"
    Fill in guest email field with "test@gmail.com"
    Fill in guest company field with "QSquad"
    Click Add guest button
    Should show success message with "Visitor successfully added."
    Should show visitor name "TestVisitor Automate" in list
    Click option button in visitor detail
    Select Remove visitor menu
    Click confirm remove visitor
    Should show success message with "Visitor successfully removed."
