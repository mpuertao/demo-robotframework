*** Settings ***
Documentation       KW for all test for open browser with attributes

Library     SeleniumLibrary

*** Keywords ***
Setup Initial Open Browser
    Open Browser                    https://www.bgeneral.com    chrome
    Maximize Browser Window
    Title Should Be                 Personas - Banco General Panamá
    Set Selenium Implicit Wait      3
    wait until element is enabled   id=wt-cli-accept-all-btn
    click element                   id=wt-cli-accept-all-btn