*** Settings ***
Documentation       Login
...     Sendo um administrador de catálogo
...     Quero me autenticar no sistema 
...     Para que eu possa gerenciar os meus produtos

Library  SeleniumLibrary

*** Test Cases ***
Login com sucesso
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "sapphire@ninjapixel.com" e "pwd123"
    Entao devo ser autenticado

Senha incorreta
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais com senha incorreta
    Entao devo ver uma mensagem de alerta "Usuário e/ou senha inválidos"

*** Keywords ***
Dado que eu acesso a página de login
    Open Browser    http://pixel-web:3000/login     safari

Quando eu submeto minhas credenciais "${email}" e "${pass}"
    Input Text      id:emailId      ${email}
    Input Text      id:passId       ${pass}
    Click Element   class:btn

Entao devo ser autenticado
    Wait Until Page Contains    Sapphire
    Close Browser

Quando eu submeto minhas credenciais com senha incorreta
    Input Text      id:emailId      sapphire@ninjapixel.com
    Input Text      id:passId       123456
    Click Element   class:btn

Entao devo ver uma mensagem de alerta "${message}"
    Wait Until Page Contains    ${message}
    Close Browser
