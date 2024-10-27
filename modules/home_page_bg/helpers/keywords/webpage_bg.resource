*** Settings ***
Documentation    ******
Library     SeleniumLibrary

Resource    ../page_objects/variables_sets.resource

*** Keywords ***
Select And Calculate Mortgage Loan
    [Arguments]                     ${type_property}    ${property-value}
    seleniumlibrary.scroll element into view        ${MORTGAGELOAN_HOMEPAGE_BUTTON}
    seleniumlibrary.Click Element                   ${MORTGAGELOAN_HOMEPAGE_BUTTON}
    seleniumlibrary.wait until element is enabled   ${TYPEPROPERTY_HOMEPAGE_SELECT}
    seleniumlibrary.Select From List By Value       ${TYPEPROPERTY_HOMEPAGE_SELECT}    ${type_property}
    seleniumlibrary.Input Text                      ${PROPERTYVALUE_HOMEPAGE_INPUT}     ${property-value}
    seleniumlibrary.Drag And Drop By Offset         ${YEARSPAYMENT_HOMEPAGE_BAR}    20    0
    seleniumlibrary.Click Element                   ${CALCULATE_HOMEPAGE_BUTTON}
    seleniumlibrary.wait until element is visible   ${AMOUNTTOFINANCE_HOMEPAGE_LABEL}

ReCalculate Mortage Loan
    [Arguments]                     ${type_property}    ${property-value}
    seleniumlibrary.Select From List By Value       ${TYPEPROPERTY_HOMEPAGE_SELECT}   ${type_property}
    seleniumlibrary.Input Text                      ${PROPERTYVALUE_HOMEPAGE_INPUT}    ${property-value}
    seleniumlibrary.click element                   ${RECALCULATE_HOMEPAGE_BUTTON}
    seleniumlibrary.wait until element is visible   ${AMOUNTTOFINANCE_HOMEPAGE_LABEL}

Validate Amount To Finance
    [Arguments]                    ${total_to_finance_expected}
    ${total_to_finance_received}   SeleniumLibrary.Get Text   ${AMOUNTTOFINANCE_HOMEPAGE_LABEL}
    log to console                 ${total_to_finance_received}
    Should Be Equal                ${total_to_finance_received}     ${total_to_finance_expected}