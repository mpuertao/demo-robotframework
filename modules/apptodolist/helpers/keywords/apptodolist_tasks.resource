*** Settings ***
Documentation    ****

Library    AppiumLibrary

Resource    ../page_objects/variables_sets.resource

*** Variables ***
${PROM_X}               0.82
${INI_PROM_Y}           0.40
${END_PROM_Y}           0.50
${TIMEOUT}      5


*** Keywords ***
Add Task
    [Arguments]     ${TEXT_TASK}
    AppiumLibrary.wait until element is visible    ${ADDTASK_BUTTON}
    AppiumLibrary.click element    ${ADDTASK_BUTTON}
    AppiumLibrary.wait until element is visible    ${INPUTTASK_INPUT}
    AppiumLibrary.input text    ${INPUTTASK_INPUT}      ${TEXT_TASK}
    AppiumLibrary.click element    ${CREATETASK_BUTTON}


Select Runway
    appiumlibrary.wait until element is visible    ${TASKSTAR_BUTTON}  timeout=${TIMEOUT}
    ${width_total}    get window width
    ${height_total}   get window height
    ${x_absolute}   evaluate    ${PROM_X} * ${width_total}

    FOR    ${PROM_Y}    IN RANGE    ${INI_PROM_Y}    ${END_PROM_Y}      0.01
        log to console      ${PROM_Y}
        log                 ${PROM_Y}
        ${y_absolute}=  Evaluate    int(${PROM_Y} * ${height_total})
        @{finger}    create list    ${x_absolute}    ${y_absolute}
        Tap With Positions    ${100}    ${finger}
    END

Validate Task Created
    [Arguments]     ${task_created_expected}
    ${task_created_received}    AppiumLibrary.get text   ${TEXTCREATED_LABEL}
    log to console    ${task_created_received}
    should be equal    ${task_created_received}     ${task_created_expected}

