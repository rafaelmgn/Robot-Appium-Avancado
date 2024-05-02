*** Settings ***
Documentation    Tudo deve começar nesse arquivo

Library    AppiumLibrary
Library    libs/mongo.py
Resource   ../resources/Screens/login.resource

*** Keywords ***
Start session
    Open Application    http://localhost:4723
    ...    automationName=UIAutomator2
    ...    platformName=Android
    ...    deviceName=Android Emulator
    ...    idui=emulator-5554
    ...    autoGrantPermissions=true
    ...    app=${EXECDIR}/apps/markx.apk

    Wait Until Page Contains    Endereço IP da Api    10

Finish session
    Sleep    1
    Capture Page Screenshot    ${TEST_NAME}.png
    Close Application