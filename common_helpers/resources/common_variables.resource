*** Settings ***

*** Variables ***
${URL_BG}               https://www.bgeneral.com/
${URL_SAUCEDEMO}        https://saucedemo.com/
${IMPLICITY_WAIT}       10seconds

${REMOTE_URL}       http://127.0.0.1:4723
${PLATFORM_NAME}    Android
${DEVICE_NAME}      emulator-5554
${APP}              /Users/mauriciopuerta/Downloads/browserstack-robotframework/appto-do-list.apk
${AUTOMATION_NAME}  UiAutomator2
${MODAL_INITIAL_BUTTON}     xpath=//android.widget.TextView[@text="NO THANKS"]

