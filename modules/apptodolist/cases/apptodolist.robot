*** Settings ***
Documentation    tests for app todolist section tasks

Resource    ../helpers/keywords/keywords_sets.resource

Test Setup    Open Mobile Application
Test Teardown    Close Application

*** Variables ***
${text_task}    Mao Puerta Clase 4
${text_task_expected}      Mao Puerta Clase 4

*** Test Cases ***
CP1: Add tasks
    Add Task    ${text_task}
    Select Runway
    Validate Task Created   ${text_task_expected}

*** Keywords ***
