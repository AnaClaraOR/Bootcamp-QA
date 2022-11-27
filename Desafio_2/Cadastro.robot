*** Settings ***
Resource    global_keywords/keywords.robot
Resource    page_objects/cadastro_page.robot

Suite Setup    Abre navegador na página de cadastro
Suite Teardown    Encerra sessão

*** Test Cases ***
Cenário 1: Cadastro com sucesso
    #Probabilidade: Alta      Impacto: Alto
    #Prioridade: Alta

    ${NOME_FAKER}    FakerLibrary.Name
    ${EMAIL_FAKER}    FakerLibrary.Email
    ${SENHA_FAKER}    FakerLibrary.Password

    Entra com o Nome ${NOME_FAKER}
    Entra com o Email ${EMAIL_FAKER}
    Entra com a senha ${SENHA_FAKER}
    Clica no botão Cadastrar
    Checa alerta de sucesso contém Usuário inserido com sucesso

Cenário 2: Cadastro sem sucesso
    #Probabilidade: Alta      Impacto: Alto
    #Prioridade: Alta

    ${NOME_FAKER}    FakerLibrary.Name
    ${SENHA_FAKER}    FakerLibrary.Password

    Clica no Menu Novo Usuário
    Entra com o nome ${NOME_FAKER}
    Entra com o email testeExemplosAcor@gmail.com
    Entra com a senha ${SENHA_FAKER}
    Clica no botão Cadastrar
    Checa alerta de erro contém Endereço de email já utilizado

Cenário 3: Cadastro sem o preenchimento do nome
    #Probabilidade: Baixa     Impacto: Baixo
    #Prioridade: Baixa

    ${EMAIL_FAKER}    FakerLibrary.Email
    ${SENHA_FAKER}    FakerLibrary.Password

    Entra com o Email ${EMAIL_FAKER}
    Entra com a senha ${SENHA_FAKER}
    Clica no botão Cadastrar
    Checa alerta de erro contém Nome é um campo obrigatório

Cenário 4: Cadastro sem o preenchimento do email
    #Probabilidade: Média      Impacto: Baixo
    #Prioridade: Baixa

    ${NOME_FAKER}    FakerLibrary.Name
    ${SENHA_FAKER}    FakerLibrary.Password

    Entra com o Nome ${NOME_FAKER}
    Entra com a senha ${SENHA_FAKER}
    Clica no botão Cadastrar
    Checa alerta de erro contém Email é um campo obrigatório

Cenário 5: Cadastro sem o preenchimento da senha
    #Probabilidade: Baixa      Impacto: Baixo
    #Prioridade: Baixa

    ${NOME_FAKER}    FakerLibrary.Name
    ${EMAIL_FAKER}    FakerLibrary.Email

    Entra com o Nome ${NOME_FAKER}
    Entra com o Email ${EMAIL_FAKER}
    Clica no botão Cadastrar
    Checa alerta de erro contém Senha é um campo obrigatório

Cenário 6: Cadastro sem preenchimento de campos
    #Probabilidade: Média      Impacto: Baixo
    #Prioridade: Baixa

    Clica no botão Cadastrar
    Checa alerta de erro contém Nome é um campo obrigatório
    Checa alerta de erro contém Email é um campo obrigatório
    Checa alerta de erro contém Senha é um campo obrigatório

Cenário 7: Cadastro só com o preenchimento do nome
    #Probabilidade: Média     Impacto: Baixo
    #Prioridade: Baixa

    ${NOME_FAKER}    FakerLibrary.Name

    Entra com o Nome ${NOME_FAKER}
    Clica no botão Cadastrar
    Checa alerta de erro contém Email é um campo obrigatório
    Checa alerta de erro contém Senha é um campo obrigatório

Cenário 8: Cadastro só com o preenchimento do email
    #Probabilidade: Baixa     Impacto: Baixo
    #Prioridade: Baixa

    ${EMAIL_FAKER}    FakerLibrary.Email

    Entra com o Email ${EMAIL_FAKER}
    Clica no botão Cadastrar
    Checa alerta de erro contém Nome é um campo obrigatório
    Checa alerta de erro contém Senha é um campo obrigatório
    
Cenário 9: Cadastro só com o preenchimento da senha
    #Probabilidade: Baixa     Impacto: Baixo
    #Prioridade: Baixa

    ${SENHA_FAKER}    FakerLibrary.Password

    Entra com a senha ${SENHA_FAKER}
    Clica no botão Cadastrar
    Checa alerta de erro contém Nome é um campo obrigatório
    Checa alerta de erro contém Email é um campo obrigatório

*** Keywords ***
Clica no Menu Novo Usuário
    Click Element    ${MENU_CADASTRO}

Entra com o email ${EMAIL_CADASTRO}
    Input Text    ${CAMPO_EMAIL_CADASTRO}    ${EMAIL_CADASTRO}