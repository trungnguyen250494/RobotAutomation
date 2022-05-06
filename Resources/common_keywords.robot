*** Settings ***
Library   SeleniumLibrary

*** Variables ***

*** Keywords ***
Start browser and maximize
    [Arguments]  ${URL}    ${Browser}
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    set selenium speed  2s

Wait and input text
    [Arguments]  ${locator}  ${txt_value}
    wait until element is visible  ${locator}
    input text  ${locator}  ${txt_value}


Wait and click element
    [Arguments]  ${locator}
    wait until element is visible  ${locator}
    click element  ${locator}

Get text element
    [Arguments]  ${locator}
    wait until element is visible  ${locator}
    ${test}  get text  ${locator}
    log  ${test}
    [Return]  ${test}

Check element visible
    [Arguments]  ${locator}
    ${present} =  run keyword   element should be visible  ${locator}  10s
    [Return]  ${present}

Close browser window
    ${Title}=  get title
    log  ${Title}
    close browser