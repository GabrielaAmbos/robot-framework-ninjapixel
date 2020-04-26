*** Settings ***
Documentation       Login
...     Sendo um administrador de catálogo
...     Quero me autenticar no sistema 
...     Para que eu possa gerenciar os meus produtos

Resource     ../resources/actions.robot
Test Teardown   BasePage.Close

*** Test Cases ***
Login com sucesso
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "sapphire@ninjapixel.com" e "pwd123"
    Então devo ser autenticado

Senha incorreta
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "sapphire@ninjapixel.com" e "123abc"
    Então devo ver uma mensagem de alerta "Usuário e/ou senha inválidos"

Email nao cadastrado
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "fakeemail@ninjapixel.com" e "pwd123"
    Então devo ver uma mensagem de alerta "Usuário e/ou senha inválidos"

Email obrigatório
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "${EMPTY}" e "pwd123"
    Então devo ver uma mensagem de alerta "Opps. Informe o seu email!"

Senha nao informado
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "sapphire@ninjapixel.com" e "${EMPTY}"
    Então devo ver uma mensagem de alerta "Opps. Informe a sua senha!"

