*** Settings ***
Resource  ../Resources/common_keywords.robot


*** Variables ***
${header_user_info}  css:nav > div:nth-of-type(1)
${btn_log_out}  xpath=//nav[1]//a[contains(.,'Sign out')]

*** Keywords ***
Verify the account name after logged in
    [Arguments]  ${full_name}
    wait until page contains element  ${header_user_info}  10s
    ${name}  =  get text  ${header_user_info}
    If  ${full_name} ==  ${name}
        [Return]  TRUE
    Else
        [Return]  FALSE
    END



Log out the user account
    Wait and click element  ${btn_log_out}

