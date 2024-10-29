*** Settings ***

*** Variables ***
${URL_BG}               https://www.bgeneral.com/
${URL_SAUCEDEMO}        https://saucedemo.com/
${IMPLICITY_WAIT}       10seconds
${USERNAME}             USERNAME
${ACCESSKEY}            ACCESSKEY
#${REMOTE_URL}       http://127.0.0.1:4723
${REMOTE_URL}       http://${USERNAME}:${ACCESSKEY}@hub-cloud.browserstack.com/wd/hub
${PLATFORM_NAME}    Android
#${DEVICE_NAME}      emulator-5554
${DEVICE_NAME}      Samsung Galaxy S22 Ultra
#${APP}              /Users/mauriciopuerta/Downloads/browserstack-robotframework/appto-do-list.apk
${APP}              bs://1c663785f00a2d113067677427dd851346345c40
${AUTOMATION_NAME}  UiAutomator2
${MODAL_INITIAL_BUTTON}     xpath=//android.widget.TextView[@text="NO THANKS"]

