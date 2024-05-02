*** Settings ***
Documentation    Suite de testes do cadastro de tarefas

Resource    ../resources/base.resource
Resource    ../resources/Screens/tasks.resource

Test Setup       Start session
Test Teardown    Finish session


*** Test Cases ***
Deve cadastrar uma nova tarefa
    ${task}    Set Variable    Estudar sobre Python
    Remove task from database    ${task}

    Do Login
    Create new task    ${task}
    Shoud have task    ${task}

Deve poder remover uma tarefa indesejada
    [Tags]    remove
    ${task}    Set Variable    Comprar refrigerante
    Remove task from database    ${task}

    Do Login    
    Create new task    ${task}
    Shoud have task    ${task}

    Remove task by name     ${task}
    
    Wait Until Page Does Not Contain    ${task}

Deve poder concluir uma tarefa
    [Tags]    finish
    ${task}    Set Variable    Estudar XPath
    Remove task from database    ${task}
    
    Do Login    
    Create new task    ${task}
    Shoud have task    ${task}

    Finish task    ${task}

    Task should be done    ${task}
        