*** Settings ***

Library     AppiumLibrary
Resource    ../page_objects/variables_sets.resource

*** Variables ***
${TIMEOUT}      5
${PROM_X}               0.82
${INI_PROM_Y}           0.40
${END_PROM_Y}           0.50

*** Keywords ***
Add Task
    [Arguments]    ${TASKTEXT}
    AppiumLibrary.wait until element is visible    ${ADDTASK_BUTTON}
    AppiumLibrary.click element                     ${ADDTASK_BUTTON}
    AppiumLibrary.wait until element is visible    ${CREATETASK_INPUT}
    AppiumLibrary.input text                        ${CREATETASK_INPUT}  ${TASKTEXT}
    AppiumLibrary.click element                     ${CREATETASK_BUTTON}

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

Validate Add Task
    [Arguments]     ${text_task_expected}
    AppiumLibrary.wait until element is visible    ${TASKTEXT_LABEL}
    ${text_task_received}    AppiumLibrary.get text    ${TASKTEXT_LABEL}
    should be equal    ${text_task_received}    ${text_task_expected}
