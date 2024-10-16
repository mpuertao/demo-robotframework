*** Settings ***

Resource    ../../../common_helpers/keywords/keywords_sets.resource
Resource    ../helpers/keywords/keywords_sets.resource

Test Setup      Open Browser With Attributes    ${URL}  ${BROWSER}  ${PAGE_TITLE}
Test Teardown   Close Browser

#Test Template   Invalid Login

*** Variables ***
${URL}          https://www.saucedemo.com/
${BROWSER}      chrome
${PAGE_TITLE}   Swag Labs


*** Test Cases ***
CP1: error user
    [Template]    Invalid Login
                    error_user  1234
                    error_user  q3rqr
                    error_user  ${EMPTY}
