*** Settings ***
Documentation   Cadastrar um produto
        ...     Sendo um administrador de catálogo
        ...     Quero cadastrar produtos
        ...     Para que eu disponibiliza-los na loja virtual

Library         SeleniumLibrary
Resource        ../resources/actions.robot

Test Setup      BasePage.Open
Test Teardown   BasePage.Close



*** Variables ***
&{dk}       name=Donkey Kong       category=Super Nintendo      price=49.99     description=Um jogo muito divertido!



*** Test Cases ***
Cadastrar novo produto
    Dado que eu estou logado
    Quando eu faço o cadastro de um novo produto    ${dk}
    Então vejo ele no catálogo



*** Keywords ***
Dado que eu estou logado
   Login With  sapphire@ninjapixel.com  pwd123

Quando eu faço o cadastro de um novo produto
    [Arguments]        ${product}

    Click Element      class:product-add
    Input Text         css:input[name=title]                   ${product['name']}
    Click Element      css:input[placeholder=Gategoria]
    Click Element      xpath://li/span[text()='${product['category']}']
    Input Text         css:input[name=price]                   ${product['price']}
    Input Text         css:textarea[name=description]          ${product['description']}
    Sleep              5


