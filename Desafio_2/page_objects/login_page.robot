*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}      https://seubarriga.wcaquino.me/login
${EMAIL_LOGIN}    css:input[name=email]
${SENHA_LOGIN}    css:input[name=senha]
${BOTÃO_LOGIN}    css = .btn

*** Keywords ***
Abre navegador na página de login
    Open Browser    ${LOGIN_URL}    chrome

Entra com o email ${EMAIL}
    Input Text    ${EMAIL_LOGIN}    ${EMAIL}

Entra com a senha ${SENHA}
    Input Text    ${SENHA_LOGIN}    ${SENHA}

Clica no botão Entrar
    Click Element    ${BOTÃO_LOGIN}