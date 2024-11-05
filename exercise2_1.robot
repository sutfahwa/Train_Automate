*** Variables ***
${a}    10
${b}    10
${expected_sum}    20

*** Test Cases ***
Test expected sum
    ${c}=   Evaluate  ${a} + ${b}
    Log to Console    The result of a + b is ${c}
    Should Be Equal As Numbers    ${c}    ${expected_sum}