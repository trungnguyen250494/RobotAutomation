*** Settings ***
Library   SeleniumLibrary
Resource  ../Pages/HomePage.robot
Documentation  Start learning automation


*** Variables ***

*** Test Cases ***

TC_001 Open Login Page
    Open LoginPage
