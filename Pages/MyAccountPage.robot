*** Settings ***
Resource  ../Resources/common_keywords.robot


*** Variables ***
${header_user_info}  css:nav > div:nth-of-type(1)
${btn_log_out}  xpath=//nav[1]//a[contains(.,'Sign out')]

*** Keywords ***
Verify the account name after logged in
    [Arguments]  ${firstName}  ${lastName}
    wait until page contains element  ${header_user_info}  10s
    ${fullName}=  Catenate  ${firstName}  ${lastName}
    ${name}=  get text  ${header_user_info}
    Should Be Equal  ${fullName}  ${name}


Log out the user account
    Wait and click element  ${btn_log_out}

