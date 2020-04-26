*** Settings *** 

Documentation       Este arquivo implementa funcoes e elementos da pagina login
Library     SeleniumLibrary

*** Keywords ***
Login With
    [Arguments]     ${email}        ${pass}

    Input Text      id:emailId      ${email}
    Input Text      id:passId       ${pass}
    Click Element   class:btn