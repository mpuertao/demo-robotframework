*** Settings ***
Documentation    *****

Library     SeleniumLibrary
Resource    ../../page_objects/login_saucedemo.resource

*** Variables ***


*** Keywords ***
Invalid Login
    [Arguments]    ${USERNAME}  ${PASSWORD}
    Input Text      ${LOGIN_SAUCEDEMO_USERNAME}     ${USERNAME}
    Input Text      ${LOGIN_SAUCEDEMO_PASSWORD}     ${PASSWORD}
    Click Element   ${LOGIN_SAUCEDEMO_BUTTON}
    Sleep           1
