*** Settings ***
Library     Collections


*** Variables ***
${country_lists}    ${EMPTY}
${country_count}    ${EMPTY} 


*** Test Cases ***
List test
    ${country_lists}=    Create List    Thailand    Brazil    Canada    Peru    India    Malaysia    Vietnam
    Log To Console    ${country_lists}

    ${country_count}=    Get Length    ${country_lists}
    Log To Console    country count is ${country_count}
    FOR    ${i}    IN RANGE    0    ${country_count}
        Log To Console    ${country_lists}[${i}]
    END
