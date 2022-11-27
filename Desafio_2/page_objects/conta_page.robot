*** Settings ***
Documentation    Teste de Conta
Library    SeleniumLibrary

*** Variables ***
${MENU_CONTAS}    css = .dropdown-toggle
${MENU_CONTAS_ADICIONAR}    xpath://a[.='Adicionar']
${MENU_CONTAS_LISTAR}    xpath = //a[.='Listar']
${CAMPO_CONTA}    id=nome
${BOTÃO_SALVAR}    css = .btn
${BOTAO_EDITAR}    //tbody[1]/tr[1]//span[@class='glyphicon glyphicon-edit']
${BOTÃO_EXCLUIR}    xpath=//tr[contains(td, "${CONTA_EXCLUIR}")]//a[contains(@href, "removerConta")]
${CONTA_EXCLUIR}    Conta de exclusão 2
${BOTÃO_EXCLUIR_USO}    xpath=//tr[contains(td, "${CONTA_PARA_DELETAR}")]//a[contains(@href, "removerConta")]
${CONTA_PARA_DELETAR}    Conta com movimentacao

*** Keywords ***
Clica no menu contas
    Click Element    ${MENU_CONTAS}

Clica no menu Adicionar
    Click Element    ${MENU_CONTAS_ADICIONAR}

Entra com o nome da Conta ${CONTA}
    Input Text    ${CAMPO_CONTA}    ${CONTA}

Clica no botão Salvar
    Click Element    ${BOTÃO_SALVAR}

Clica no menu Listar
    Click Element    ${MENU_CONTAS_LISTAR}

Clica no ícone de Editar
    Click Element    ${BOTAO_EDITAR}
    
Altera a conta para ${CONTA_ALTERADA}
    Input Text    ${CAMPO_CONTA}    ${CONTA_ALTERADA}

Clica no ícone de Excluir
    Click Element    ${BOTÃO_EXCLUIR}

Clica no ícone de Excluir da conta em uso
    Click Element    ${BOTÃO_EXCLUIR_USO}