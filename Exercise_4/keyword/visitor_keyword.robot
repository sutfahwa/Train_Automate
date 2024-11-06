*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/visitor_variables.robot
Resource    ../variables/todo_variables.robot


*** Keywords ***
Select Visitor Menu
    Wait Until Element Is Visible    ${visitorMenu}
    Click Element    ${visitorMenu}

Click Add Visitor button
    Wait Until Element Is Visible    ${addVisitorBtn}
    Click Element    ${addVisitorBtn}

Should show modal title with "${modalTitleName}"
    Wait Until Element Is Visible    ${modalTitle} 
    Element Should Contain    ${modalTitle}     ${modalTitleName}

Fill in guest firstname field with "${firstname}"
    Wait Until Element Is Visible    ${guestFirstNameField}
    Input Text    ${guestFirstNameField}    ${firstname}
    Textfield Should Contain    ${guestFirstNameField}    ${firstname}

Fill in guest lastname field with "${lastname}"
    Wait Until Element Is Visible    ${guestLastNameField}
    Input Text    ${guestLastNameField}    ${lastname}
    Textfield Should Contain    ${guestLastNameField}    ${lastname}

Fill in guest email field with "${email}"
    Wait Until Element Is Visible    ${guestEmailField}
    Input Text    ${guestEmailField}    ${email}
    Textfield Should Contain    ${guestEmailField}    ${email}

Fill in guest company field with "${company}"
    Wait Until Element Is Visible    ${guestcompanyField}
    Input Text    ${guestcompanyField}    ${company}
    Textfield Should Contain    ${guestcompanyField}    ${company}

Click Add guest button
    Wait Until Element Is Visible    ${createGuestBtn}
    Click Button    ${createGuestBtn}

Should show visitor name "${visitorName}" in list
    Wait Until Element Is Visible    ${visiorList}
    ${list}=    Get Element Count    ${visiorList}
    Log    ${list}
    FOR  ${i}  IN RANGE  ${list}
        ${ListVisitor}=    Get Text   ${visiorList}\[${i}+1]${visitorNameInList} 
        Log    ${ListVisitor}
        Exit For Loop IF	'${ListVisitor}' == '${visitorName}'
    END

Click option button in visitor detail
    Wait Until Element Is Visible    ${optionBtnVisitor}
    Click Element    ${optionBtnVisitor}

Select Remove visitor menu
    Wait Until Element Is Visible    ${removeGuestMenu} 
    Click Element    ${removeGuestMenu} 

Click confirm remove visitor
    Wait Until Element Is Visible    ${confirmRemoveGuest}
    Click Element    ${confirmRemoveGuest}