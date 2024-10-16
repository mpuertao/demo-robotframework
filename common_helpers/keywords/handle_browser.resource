*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL_BGENERAL}     https://www.bgeneral.com/


*** Keywords ***
Open Browser With Attributes
    [Arguments]    ${URL}    ${BROWSER}    ${PAGE_TITLE}
    Open Browser    ${URL}    ${BROWSER}
    maximize browser window
    title should be    ${PAGE_TITLE}
    IF    '${URL}' == '${URL_BGENERAL}'
        wait until element is enabled    id=wt-cli-accept-all-btn
        Click Element    id=wt-cli-accept-all-btn
        wait until page contains element    id=menu-topmenu-oficinas
    END
