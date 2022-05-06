*** Settings ***
Library   SeleniumLibrary
Resource  ../../Pages/HomePage.robot
Resource  ../../Pages/AuthenticationPage.robot
Documentation  Start learning automation


*** Variables ***

*** Test Cases ***

TC_001: Create a valid account
    Open LoginPage
    Enter email address to create an account  trungtn@yopmail.com
    Select Title  Female
    Input mandatory fields  Trung  Nguyen  test@1234
    Select Date of Birth  25  4  1994

