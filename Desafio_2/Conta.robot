*** Settings ***
Resource    global_keywords/keywords.robot
Resource    page_objects/login_page.robot
Resource    page_objects/conta_page.robot

Suite Setup    Abre navegador na página de login
Suite Teardown    Encerra sessão

*** Test Cases ***
Cenário 1: Adicionar conta
    #Probabilidade: Baixa     Impacto: Médio
    #Prioridade: Baixa

    ${NOME_CONTA_FAKER}    FakerLibrary.Name

    Entra com o email testeExemplosAcor@gmail.com
    Entra com a senha 123@teste
    Clica no botão Entrar
    Clica no menu contas
    Clica no menu Adicionar
    Entra com o nome da Conta ${NOME_CONTA_FAKER}
    Clica no botão Salvar
    Checa alerta de sucesso contém Conta adicionada com sucesso!

Cenário 2: Adicionar conta sem sucesso
    #Probabilidade: Alta     Impacto: Baixo
    #Prioridade: Média
    
    Clica no menu contas
    Clica no menu Adicionar
    Entra com o nome da Conta Conta Repetida
    Clica no botão Salvar
    Checa alerta de erro contém Já existe uma conta com esse nome!

Cenário 3: Adicionar conta sem dados
    #Probabilidade: Baixa    Impacto: Baixo
    #Prioridade: Baixa
    
    Clica no menu contas
    Clica no menu Adicionar
    Clica no botão Salvar
    Checa alerta de erro contém Informe o nome da conta

Cenário 4: Listar conta
    #Probabilidade: Baixa    Impacto: Baixo
    #Prioridade: Baixa
    
    Clica no menu contas
    Clica no menu Listar
    
Cenário 5: Editar conta
    #Probabilidade: Alta     Impacto: Baixo
    #Prioridade: Média
    
    ${NOME_CONTA_ALTERADA_FAKER}    FakerLibrary.Name

    Clica no menu contas
    Clica no menu Listar
    Clica no ícone de Editar
    Altera a conta para ${NOME_CONTA_ALTERADA_FAKER}
    Clica no botão Salvar
    Checa alerta de sucesso contém Conta alterada com sucesso!

Cenário 6: Excluir conta
    #Probabilidade: Baixa     Impacto: Baixo
    #Prioridade: Baixa
    
    Clica no menu contas
    Clica no menu Listar
    Clica no ícone de Excluir
    Checa alerta de sucesso contém Conta removida com sucesso!

Cenário 7: Exclusão de conta sem sucesso
    #Probabilidade: Média    Impacto: Alto
    #Prioridade: Alta
    
    Clica no menu contas
    Clica no menu Listar
    Clica no ícone de Excluir da conta em uso
    Checa alerta de erro contém Conta em uso na movimentações