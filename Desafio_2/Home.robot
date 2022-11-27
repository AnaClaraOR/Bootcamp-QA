*** Settings ***
Resource    global_keywords/keywords.robot
Resource    page_objects/login_page.robot
Resource    page_objects/home_page.robot

Suite Setup    Abre navegador na página de login
Suite Teardown    Encerra sessão

*** Test Cases ***
Cenário 1: Reset de Dados das Contas
    #Probabilidade: Médio    Impacto: Alto
    #Prioridade: Alta

    Entra com o email testeExemplosAcor@gmail.com
    Entra com a senha 123@teste
    Clica no botão Entrar
    Clica no botão de Reset
    Checa alerta de sucesso contém Dados resetados com sucesso!
    Checa se valor da conta Conta para movimentacoes foi resetado
    Checa se valor da conta Conta com movimentacao foi resetado
    Checa se valor da conta Conta para saldo foi resetado
    Checa se valor da conta Conta para extrato foi resetado

*** Keywords ***
Checa se valor da conta Conta para movimentacoes foi resetado
    ${valor}=    Get Text    ${DADO_VALOR}
    Should Be Equal    ${valor}    0.00

Checa se valor da conta Conta com movimentacao foi resetado
    ${valor}=    Get Text    ${DADO_VALOR}
    Should Be Equal    ${valor}    0.00

Checa se valor da conta Conta para saldo foi resetado
    ${valor}=    Get Text    ${DADO_VALOR}
    Should Be Equal    ${valor}    0.00

Checa se valor da conta Conta para extrato foi resetado
    ${valor}=    Get Text    ${DADO_VALOR}
    Should Be Equal    ${valor}    0.00