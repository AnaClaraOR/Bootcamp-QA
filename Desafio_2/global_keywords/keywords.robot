*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary    locale=pt_BR
Library    Collections

*** Variables ***
${ALERTA_SUCESSO}    //div[@class='alert alert-success']
${ALERTA_ERRO}    xpath://div[@class='alert alert-danger']

*** Keywords ***
Checa alerta de sucesso contém ${MENSAGEM_SUCESSO}
    ${mensagem_obtida}=    Get Text    ${ALERTA_SUCESSO}
    Should Contain    ${mensagem_obtida}    ${MENSAGEM_SUCESSO}
    Log To Console    ${MENSAGEM_SUCESSO}
    Log To Console    ${mensagem_obtida}

Checa alerta de erro contém ${MENSAGEM_ERRO}
    @{LISTA_ELEMENTOS}=    Get WebElements    ${ALERTA_ERRO}
    
    @{LISTA}=    Create List  
    
    FOR    ${elemento}    IN    @{LISTA_ELEMENTOS}
        Log    ${elemento}
        ${texto_do_elemento}=    Get Text    ${elemento}
        Append To List    ${LISTA}    ${texto_do_elemento}
    END
    Should Contain Any	${LISTA}    ${MENSAGEM_ERRO}

Encerra sessão
    Close Browser