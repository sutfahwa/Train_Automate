*** Settings ***
Library    DateTime

*** Variables ***
${fixed_date}    04/11/2024

*** Test Cases ***
Date Comparison Test
    ${current_date}=    Get Current Date    result_format=%d/%m/%Y
    Log to Console    Today's date is: ${current_date} and fixed_date is ${fixed_date}
    Should Be Equal    ${current_date}    ${fixed_date}