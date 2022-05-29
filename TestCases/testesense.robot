*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/sauce.resource


*** Test Cases ***
Processo de Compra da Loja Sauce
    Nova sessão
    Efetuar Login
    Selecionar produtos e encaminhar ao carrinho
    Clicar em Checkout
    Preencher dados para envio
    Finalizar Compra
    Encerrar sessão
