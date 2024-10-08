*** Settings ***
Documentation   Tests for demo in web applicattion bgeneral

Library         SeleniumLibrary

Resource        ../../../common_keywords/OpenBrowserWithAttributes.robot

Test Setup      Setup Initial Open Browser
Test Teardown   Close Browser
Force Tags  REGRESION

*** Variables ***
${type_property_seg}            Hip_seg
${type_property_new}            Hip_pref
${property_value_seg}           120000
${property_value_new}           200000
${minimun_result_seg_expected}  $12,000
${minimun_result_new_expected}  $20,000

*** Test Cases ***
CP1:Tests for calculator of loan mortgage successful
    [Tags]                              robot:skip
    ...                                 @happypath  @CP2
    Select Calculate Mortgage Loan      ${type_property_seg}     ${property_value_seg}
    Validate Calculate With Attributes  ${minimun_result_seg_expected}

CP2:Tests for recalculate Mortgage Loan Successful
    [Tags]    @happypath @CP2
    Select Calculate Mortgage Loan      ${type_property_seg}    ${property_value_seg}
    Recalculate Mortage Loan            ${type_property_new}    ${property_value_new}
    Validate Calculate With Attributes  ${minimun_result_new_expected}

*** Keywords ***
Select Calculate Mortgage Loan
    [Arguments]                     ${type_property}    ${property_value}
    wait until element is enabled   xpath=//a[@data-order-default='Calcula tu préstamo hipotecario']
    click element                   xpath=//a[@data-order-default='Calcula tu préstamo hipotecario']
    wait until element is enabled   id=type_property
    Select From List By Value       id=type_property    ${type_property}
    Input Text                      id=property-value   ${property_value}
    drag and drop by offset         name=years-payment  10  0
    click element                   xpath=//input[@type='submit' and @value='Calcula aquí']
    wait until element is visible   id=amount-finance

Validate Calculate With Attributes
    [Arguments]                     ${minimun_result_expected}
    ${minimun_result_received}      Get Text    id=minimum-result
    log to console                  ${minimun_result_received}
    Log                             ${minimun_result_received}
    should be equal                 ${minimun_result_received}      ${minimun_result_expected}

Recalculate Mortage Loan
    [Arguments]                     ${type_property}    ${property_value}
    Select From List By Value       id=type_property    ${type_property}
    Input Text                      id=property-value   ${property_value}
    click element                   xpath=//input[@type='submit' and @value='Recalcular']
    wait until element is visible   id=minimum-result

