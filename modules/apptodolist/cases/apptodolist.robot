*** Settings ***
Documentation    ******

Library     AppiumLibrary

Resource    ../helpers/keywords/keywords_sets.resource

Test Setup    Open Mobile Application
Test Teardown    Close Application

*** Variables ***
${TEXT_TASK}            Mao Puerta
${TEXT_TASK_EXPECTED}   Mao Puerta

*** Test Cases ***
CP1: Add Task Successful
    Add Task    ${TEXT_TASK}
    Select Runway
    Validate Add Task   ${TEXT_TASK_EXPECTED}

