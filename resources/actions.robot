*** Settings ***
Documentation       Este arquivo implementa as keyworks dos steps

Library  SeleniumLibrary
Resource    pages/LoginPage.robot
Resource    pages/BasePage.robot

*** Keywords *** 
Dado que eu acesso a página de login
    Open

Quando eu submeto minhas credenciais "${email}" e "${pass}"
   Login With  ${email}  ${pass}

Então devo ser autenticado
    Wait Until Page Contains    Sapphire

Então devo ver uma mensagem de alerta "${expect_message}"
    Wait Until Element Contains     class:alert    ${expect_message}