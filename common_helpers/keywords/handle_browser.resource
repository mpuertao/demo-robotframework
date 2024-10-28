*** Settings ***
Documentation       Keyword for Manage browser with url

Library    SeleniumLibrary

Resource    ../resources/variables_sets.resource

*** Variables ***
${URL_BGeneral}        https://bgeneral.com/
#${CHROME_OPTIONS}    --headless    --no-sandbox    --disable-dev-shm-usage      --disable-gpu    --window-size=1920x1080

*** Keywords ***
Open Browser With Attributes
    [Arguments]    ${URL}   ${BROWSER}   ${PAGE_TITLE}
    seleniumlibrary.Open Browser    ${URL}    headlesschrome
    seleniumlibrary.maximize browser window
    title should be    ${PAGE_TITLE}
    IF    '${URL}' == '${URL_BGeneral}'
        seleniumlibrary.wait until element is enabled       id=wt-cli-accept-all-btn
        seleniumlibrary.Click Element                       id=wt-cli-accept-all-btn
        seleniumlibrary.wait until page contains element    id=menu-topmenu-oficinas
        Log To Console   '### LOGGED IN WEBPAGE BGENERAL ###'
    END
