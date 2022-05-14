*** Settings ***
Library   SeleniumLibrary
Library   ReadDataExcel.py

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

Read number of rows
    [Arguments]  ${sheetname}
    ${max_row} =  fetch_number_of_rows  ${sheetname}
    [Return]  ${max_row}

Read Excel Data of cell
    [Arguments]  ${sheetname}  ${row}  ${column}
    ${cell_data} =  fetch_cell_data  ${sheetname}  ${row}  ${column}
    [Return]  ${cell_data}

Close browser window
    ${Title}=  get title
    log  ${Title}
    close browser