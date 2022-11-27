*** Settings ***
Documentation    Teste de Login
Resource    global_keywords/keywords.robot
Resource    page_objects/login_page.robot
Resource    page_objects/home_page.robot

*** Test Cases ***
Cenário 1: Login sem sucesso
    #Probabilidade: Alta     Impacto: Baixo
    #Prioridade: Média

    ${EMAIL_FAKER}    FakerLibrary.Email
    ${SENHA_FAKER}    FakerLibrary.Password
    
    Abre navegador na página de login
    Entra com o email ${EMAIL_FAKER}
    Entra com a senha ${SENHA_FAKER}
    Clica no botão Entrar
    Checa alerta de erro contém Problemas com o login do usuário

Cenário 2: Login com email obrigatório
    #Probabilidade: Médio     Impacto: Médio
    #Prioridade: Média

    ${SENHA_FAKER}    FakerLibrary.Password

    Entra com a senha ${SENHA_FAKER}
    Clica no botão Entrar
    Checa alerta de erro contém Email é um campo obrigatório

Cenário 3: Login com senha obrigatória
    #Probabilidade: Médio     Impacto: Baixo
    #Prioridade: Baixa

    ${EMAIL_FAKER}    FakerLibrary.Email

    Entra com o email ${EMAIL_FAKER}
    Clica no botão Entrar
    Checa alerta de erro contém Senha é um campo obrigatório

Cenário 4: Login com campos obrigatórios
    #Probabilidade: Alta    Impacto: Baixo
    #Prioridade: Média

    Clica no botão Entrar
    Checa alerta de erro contém Email é um campo obrigatório
    Checa alerta de erro contém Senha é um campo obrigatório

Cenário 5: Login com sucesso
    #Probabilidade: Alta    Impacto: Alta
    #Prioridade: Alta

    Entra com o email testeExemplosAcor@gmail.com
    Entra com a senha 123@teste
    Clica no botão Entrar
    Checa se a URL atual é a de Área de Logado
    Checa alerta de sucesso contém Bem vindo
    Encerra sessão

*** Keywords ***
Checa se a URL atual é a de Área de Logado
    ${url}=    Get Location
    Should Be Equal    ${url}    ${HOME_URL}