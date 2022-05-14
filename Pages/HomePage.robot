*** Settings ***
Resource  ../Resources/common_keywords.robot

*** Variables ***
${Browser}  Firefox
${URL}    http://automationpractice.com/index.php
${btn_SignIn}   Class:login

*** Keywords ***
Open Browser to LoginPage
        Start browser and maximize  ${URL}  ${Browser}
        Wait and click element  ${btn_SignIn}
        set selenium implicit wait  2s
        title should be  Login - My Store