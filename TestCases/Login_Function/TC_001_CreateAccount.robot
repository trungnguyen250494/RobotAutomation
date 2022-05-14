*** Settings ***

Documentation  A test suite with a single test for creating a valid account
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.

Library   SeleniumLibrary
Resource  ../../Pages/HomePage.robot
Resource  ../../Pages/AuthenticationPage.robot
Resource  ../../Pages/MyAccountPage.robot
Resource  ../../Resources/common_keywords.robot

*** Variables ***

*** Test Cases ***

TC_001: Create a valid account
    Open Browser to LoginPage
    Load and Input Personal Data from Excel File  Sheet1

    [Teardown]    Close Browser


