*** Settings ***
Documentation   Test for web page banco general
Library         SeleniumLibrary
Test Setup      Open Browser    https://www.bgeneral.com/    chrome
Test Teardown   Close Browser
Force Tags      REGRESION

*** Variables ***

*** Test Cases ***
Validate Calculator Credit Mortgage with recalculate succesful
    [Tags]                      CH
    [Documentation]             CP1 validate login succesful with credentials valid
    maximize browser window
    Click Element               id=wt-cli-accept-all-btn
    Click Element               xpath=//a[@data-order-default='Calcula tu préstamo hipotecario']
    Select From List By Value   id=type_property    Hip_seg
    Input Text                  id=property-value   120000
    Drag And Drop By Offset     name=years-payment  20  0
    Click Element               xpath=//input[@type='submit' and @value='Calcula aquí']
    wait until element is visible    //*[@id="post-21492"]/div/div[1]/div/div/div/div/div[1]/div/div/section[2]/div[2]/div[2]/div/a
    ${total_to_finance}         Get Text    id=amount-finance
    Should Be Equal             ${total_to_finance}     $108,000

*** Keywords ***

