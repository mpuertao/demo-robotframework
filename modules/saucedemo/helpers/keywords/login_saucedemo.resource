*** Settings ***
Documentation    Keywords for saucedemo

Library     SeleniumLibrary

Resource    ../../page_objects/login_saucedemo.resource

*** Variables ***


*** Keywords ***
Invalid Login
    [Arguments]    ${USERNAME}  ${PASSWORD}
    seleniumlibrary.Input Text      ${LOGIN_SAUCEDEMO_USERNAME}     ${USERNAME}
    seleniumlibrary.Input Text      ${LOGIN_SAUCEDEMO_PASSWORD}     ${PASSWORD}
    seleniumlibrary.Click Element   ${LOGIN_SAUCEDEMO_BUTTON}
