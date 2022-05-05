*** Settings ***
Resource  ../Resources/common_keywords.robot

*** Variables ***
${Browser}  Firefox
${URL}    http://automationpractice.com/index.php
${btn_SignIn}   Class:login

*** Keywords ***
Open LoginPage
        Start browser and maximize  ${URL}  ${Browser}
        Wait and click element  ${btn_SignIn}
        Close browser window