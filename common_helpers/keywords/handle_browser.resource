*** Settings ***
Documentation       Keyword for Manage browser with url

Library    SeleniumLibrary

#Resource    ../resources/variables_sets.resource

*** Variables ***
${URL_BGeneral}        https://bgeneral.com/
${CHROME_OPTIONS}    --disable-dev-shm-usage

*** Keywords ***
Open Browser With Attributes
    [Arguments]    ${URL}   ${BROWSER}   ${PAGE_TITLE}
#    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys
#    Call Method  ${options}     add_argument    --no-sandbox
#    Call Method  ${options}     add_argument    --disable-dev-shm-usage
#    Call Method  ${options}     add_argument    --disable-gpu
    seleniumlibrary.Open Browser    ${URL}    ${BROWSER}    #options=${options}
    seleniumlibrary.maximize browser window
    title should be    ${PAGE_TITLE}
    IF    '${URL}' == '${URL_BGeneral}'
        seleniumlibrary.wait until element is enabled       id=wt-cli-accept-all-btn
        seleniumlibrary.Click Element                       id=wt-cli-accept-all-btn
        seleniumlibrary.wait until page contains element    id=menu-topmenu-oficinas
        Log To Console   '### LOGGED IN WEBPAGE BGENERAL ###'
    END
