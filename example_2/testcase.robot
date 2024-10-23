*** Settings ***
Resource    keyword.robot

*** Test Cases ***
Test open browser and login
    Open mellow matic website
    Fill in username field with "QSquad"
    Fill in password field with "Test1234"
    Click login button
    