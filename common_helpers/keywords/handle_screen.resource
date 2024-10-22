*** Settings ***
Documentation    Keywords for actiosn transversals of mobile testing

Library    AppiumLibrary

*** Variables ***
${USERNAME}         usuario de cada estudiante
${ACCESS_KEY}       acceskey de cada estudiante
${REMOTE_URL}       http://${USERNAME}:${ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub
#${REMOTE_URL}       http://localhost:4723
${AUTOMATIONNAME}   UIAutomator2
${PLATFORMNAME}     Android
${DEVICENAME}       Samsung Galaxy S22 Ultra
#${DEVICENAME}       emulator-5554
${PLATFORMVERSION}  12.0
${APP}              bs://1c663785f00a2d113067677427dd851346345c40
#${APP}              /Users/mauriciopuerta/Downloads/browserstack-robotframework/To-do List Pro v1.02.42.0329 - espacioapk.com.apk

*** Keywords ***
Open Mobile Application
    Open Application    ${REMOTE_URL}   automationName=${AUTOMATIONNAME}    platformName=${PLATFORMNAME}    platformVersion=${PLATFORMVERSION}  deviceName=${DEVICENAME}    app=${APP}
    AppiumLibrary.wait until element is visible    xpath=//android.widget.TextView[@text="NO THANKS"]
    AppiumLibrary.click element    xpath=//android.widget.TextView[@text="NO THANKS"]
