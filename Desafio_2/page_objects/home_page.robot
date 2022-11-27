*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${HOME_URL}    https://seubarriga.wcaquino.me/logar
${BOTAO_RESET}    xpath = //a[.='reset']
${DADO_VALOR}    xpath://tbody[1]/tr[1]/td[2]

*** Keywords ***
Clica no botão de Reset
    Click Element    ${BOTAO_RESET}