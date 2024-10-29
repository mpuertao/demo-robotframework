*** Settings ***
Documentation       Keyword for Manage browser with url

Library    SeleniumLibrary

#Resource    ../resources/variables_sets.resource

*** Variables ***
${URL_BGeneral}        https://www.bgeneral.com/


*** Keywords ***
Open Browser With Attributes
    [Arguments]    ${URL}   ${BROWSER}=headlessfirefox   ${PAGE_TITLE}
    set selenium implicit wait      10seconds
    seleniumlibrary.Open Browser    ${URL}    ${BROWSER}
    seleniumlibrary.maximize browser window
    title should be    ${PAGE_TITLE}
    IF    '${URL}' == '${URL_BGeneral}'
        seleniumlibrary.wait until element is enabled       id=wt-cli-accept-all-btn
        seleniumlibrary.Click Element                       id=wt-cli-accept-all-btn
        seleniumlibrary.wait until page contains element    id=menu-topmenu-oficinas
        Log To Console   '### LOGGED IN WEBPAGE BGENERAL ###'
    END



    seleniumlibrary.wait until location contains
