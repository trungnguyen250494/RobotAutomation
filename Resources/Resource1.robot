*** Settings ***
Library   SeleniumLibrary

*** Variables ***

*** Keywords ***
Start browser and maximize
    [Arguments]  ${URL}    ${Browser}
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    set selenium speed  2 seconds


Close browser window
    ${Title}=  get title
    log  ${Title}
    close browser