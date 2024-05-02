*** Settings ***
Documentation    Testes de Login

Resource    ../resources/base.resource

Test Setup    Start session
Test Teardown    Finish session

*** Variables ***
${ipAPI}    192.168.18.69


*** Test Cases ***
Deve Logar com sucesso
    Do Login
    Wait Until Page Contains    Minhas tarefas    10

*** Keywords ***

