*** Settings ***
Documentation    ******
Library     SeleniumLibrary

*** Keywords ***
Select And Calculate Mortgage Loan
    [Arguments]                     ${type_property}    ${property-value}
    scroll element into view        xpath=//a[@data-order-default='Calcula tu préstamo hipotecario']
    Click Element                   xpath=//a[@data-order-default='Calcula tu préstamo hipotecario']
    wait until element is enabled   id=type_property
    Select From List By Value       id=type_property    ${type_property}
    Input Text                      id=property-value   ${property-value}
    Drag And Drop By Offset         name=years-payment  20  0
    Click Element                   xpath=//input[@type='submit' and @value='Calcula aquí']
    wait until element is visible    id=amount-finance

ReCalculate Mortage Loan
    [Arguments]                     ${type_property}    ${property-value}
    Select From List By Value       id=type_property    ${type_property}
    Input Text                      id=property-value   ${property-value}
    click element                   xpath=//input[@type='submit' and @value='Recalcular']
    wait until element is visible   id=amount-finance

Validate Amount To Finance
    [Arguments]                    ${total_to_finance_expected}
    ${total_to_finance_received}   Get Text   id=amount-finance
    log to console                 ${total_to_finance_received}
    Should Be Equal                ${total_to_finance_received}     ${total_to_finance_expected}