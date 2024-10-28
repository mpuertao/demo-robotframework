*** Settings ***
Documentation    ***

Library    AppiumLibrary


Resource    ../resources/variables_sets.resource

*** Variables ***


*** Keywords ***
Open Mobile Application
    Open Application    remote_url=${REMOTE_URL}    automationName=${AUTOMATION_NAME}   platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}      app=${APP}
    AppiumLibrary.wait until element is visible        ${MODAL_INITIAL_BUTTON}
    AppiumLibrary.click element         ${MODAL_INITIAL_BUTTON}