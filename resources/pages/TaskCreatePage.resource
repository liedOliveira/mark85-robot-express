*** Settings ***
Documentation    Ações e elementos da página de cadastro de tarefas

Library    Browser

*** Keywords ***
Submit task form
    [Arguments]    ${task}

    Fill Text    css=input[placeholder$=tarefa]    txt=${task}[name]

    ${tags_element}    Set Variable    input[name=tags]
    
    FOR    ${tag}    IN    @{task}[tags]
            Fill Text     css=${tags_element}    txt=${tag}
            Sleep         1    
            Press Keys    css=${tags_element}    Enter
    END

    Click    css=button[type=submit] >> text=Cadastrar
    