*** Settings ***
Documentation       Este arquivo implementa o start e o closed do navegador


*** Keywords ***
Open
    Open Browser    http://pixel-web:3000/login     chrome
    Set Selenium Implicit Wait          10

Close
    Close Browser