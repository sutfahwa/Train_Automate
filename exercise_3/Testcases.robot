*** Settings ***
Library             SeleniumLibrary
Resource            ${CURDIR}/Keywords.robot

Suite Setup         Set Selenium Speed    0.5s
Suite Teardown      Close All Browsers
Test Setup          
Test Teardown  

*** Test Cases ***
Exercise3_1
    Open Web Browser
    Login Pass
    Logout
    Login Fail

Exercise3_2
    Open Web Browser
    Login Pass
    Add Project
