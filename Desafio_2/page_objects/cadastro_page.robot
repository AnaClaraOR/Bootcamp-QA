*** Settings ***
Documentation    Teste de Cadastro
Library    SeleniumLibrary

*** Variables ***
${CADASTRO_URL}    https://seubarriga.wcaquino.me/cadastro
${CAMPO_NOME}    css:input[name=nome]
${CAMPO_EMAIL}    css:input[name=email]
${CAMPO_SENHA}    css:input[name=senha]
${CAMPO_EMAIL_CADASTRO}    css:input[name=email]
${BOTÃO_CADASTRAR}    css = .btn
${MENU_CADASTRO}    xpath = //a[.='Novo usuário?']

*** Keywords ***
Abre navegador na página de cadastro
    Open Browser    ${CADASTRO_URL}    chrome

Entra com o Nome ${NOME}
    Input Text    ${CAMPO_NOME}    ${NOME}

Entra com o Email ${EMAIL}
    Input Text    ${CAMPO_EMAIL}    ${EMAIL}

Entra com a senha ${SENHA}
    Input Text    ${CAMPO_SENHA}    ${SENHA}

Clica no botão Cadastrar
    Click Element    ${BOTÃO_CADASTRAR}