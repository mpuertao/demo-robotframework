*** Settings ***
Documentation    ******
Library     SeleniumLibrary

Resource    ../page_objects/variables_sets.resource

*** Keywords ***
Select And Calculate Mortgage Loan
    [Arguments]                     ${type_property}    ${property-value}
    scroll element into view        ${MORTGAGELOAN_HOMEPAGE_BUTTON}
    Click Element                   ${MORTGAGELOAN_HOMEPAGE_BUTTON}
    wait until element is enabled   ${TYPEPROPERTY_HOMEPAGE_SELECT}
    Select From List By Value       ${TYPEPROPERTY_HOMEPAGE_SELECT}    ${type_property}
    Input Text                      ${PROPERTYVALUE_HOMEPAGE_INPUT}     ${property-value}
    Drag And Drop By Offset         ${YEARSPAYMENT_HOMEPAGE_BAR}  20  0
    Click Element                   ${CALCULATE_HOMEPAGE_BUTTON}
    wait until element is visible   ${AMOUNTTOFINANCE_HOMEPAGE_LABEL}

ReCalculate Mortage Loan
    [Arguments]                     ${type_property}    ${property-value}
    Select From List By Value       ${TYPEPROPERTY_HOMEPAGE_SELECT}   ${type_property}
    Input Text                      ${PROPERTYVALUE_HOMEPAGE_INPUT}    ${property-value}
    click element                   ${RECALCULATE_HOMEPAGE_BUTTON}
    wait until element is visible   ${AMOUNTTOFINANCE_HOMEPAGE_LABEL}

Validate Amount To Finance
    [Arguments]                    ${total_to_finance_expected}
    ${total_to_finance_received}   Get Text   ${AMOUNTTOFINANCE_HOMEPAGE_LABEL}
    log to console                 ${total_to_finance_received}
    Should Be Equal                ${total_to_finance_received}     ${total_to_finance_expected}