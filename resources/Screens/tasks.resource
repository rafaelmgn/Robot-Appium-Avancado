*** Settings ***
Documentation    Elementos e ações da tela de minhas tarefas

Resource    ../base.resource

*** Variables ***
${new_task_input}    xpath=//*[@resource-id="newTask"]
${crate_button}      xpath=//*[@resource-id="createTask"]   


*** Keywords ***

Create new task
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    ${new_task_input}    5
    Input Text        ${new_task_input}    ${task_name}
    Click Element     ${crate_button} 

Shoud have task
    [Arguments]    ${task_name}
    Wait Until Element Is Visible    //*[contains(@text, "${task_name}")]    5

Remove task by name
    [Arguments]    ${task_name}
    ${element}    Set Variable       xpath=//*[@text="${task_name}"]/../..//*[@resource-id="removeTask"]
    
    Wait Until Element Is Visible    ${element}    5
    Click Element                    ${element}

    ${button}    Set Variable    xpath=//*[@resource-id="android:id/button2"][@text="SIM"]

    Wait Until Element Is Visible    ${button}    5
    Click Element                    ${button}


Finish task
    [Arguments]    ${task_name}

    ${element}    Set Variable    //*[@resource-id="taskText"][@text="${task_name}"]

    Wait Until Element Is Visible    ${element}
    Click Element    ${element}

Task should be done
    [Arguments]    ${task_name}
    
    Wait Until Element Is Visible    xpath=//*[@text="${task_name}"]/..//android.widget.ImageView