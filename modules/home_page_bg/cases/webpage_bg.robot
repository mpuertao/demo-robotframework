*** Settings ***
Documentation       Test for web page banco general

Library             SeleniumLibrary

Resource            ../../../common_helpers/keywords/keywords_sets.resource
Resource            ../helpers/keywords/keywords_sets.resource

Test Setup          Open Browser With Attributes    ${URL_BGENERAL}     ${BROWSER}      ${PAGE_TITLE}
Test Teardown       Close Browser

Force Tags          regresion


*** Variables ***
${URL_BGENERAL}                 https://bgeneral.com/
${BROWSER}                      chrome
${PAGE_TITLE}                   Personas - Banco General Panamá
${type_property_usada}          Hip_seg
${type_property_new}            Hip_pref
${type_property_vac}            Hip_vac
@{property_values}              120000    140000    160000    180000
${total_to_finance_calc}        $108,000
${total_to_finance_recalc}      $171,000


*** Test Cases ***
CP1: Validate Calculator Credit Mortgage with recalculate succesful
    [Documentation]    CP1 validate login succesful with credentials valid
    [Tags]    @happypath
    When Select And Calculate Mortgage Loan    ${type_property_usada}    ${property_values}[0]
    Then Validate Amount To Finance    ${total_to_finance_calc}

CP2: Test for recalculate a mortage loan Successful
    [Tags]    @altern
    When Select And Calculate Mortgage Loan    ${type_property_usada}    ${property_values}[0]
    And ReCalculate Mortage Loan    ${type_property_new}    ${property_values}[3]
    Then Validate Amount To Finance    ${total_to_finance_recalc}
