*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/Resource1.robot
Documentation  Start learning automation
Test Setup  Start browser and maximize  ${URL}  ${Browser}
Test Teardown  Close browser window


*** Variables ***
${Browser}  Chrome
${URL}    http://www.thetestingworld.com/testings


*** Test Cases ***
TC_001 Input textbox
    input text   name:fld_username  user1
    input text   name:fld_email  email1@gmail.com

TC_002 Select Radio button
    select radio button  add_type  home