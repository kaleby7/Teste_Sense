*** Variables ***

#Elementos da Navegação
${Url}                https://www.saucedemo.com/
${Navegador}          chrome

#Elementos da Página de Login
${Username}           id=user-name
${Password}           id=password
${Login}              id=login-button

#Elementos da Página de Compras
${Ordenar}            css:select[class='product_sort_container']
${Product}            id=add-to-cart-sauce-labs-onesie
${Product_red}        id=add-to-cart-test.allthethings()-t-shirt-(red)
${Cart}               id=shopping_cart_container

#Elemento da Página de Checkout
${Checkout}           id=checkout
${first-name}         id=first-name
${last-name}          id=last-name
${Cep}                id=postal-code
${Continue}           id=continue

#Elemento da Página de Finalização da Compra
${Finish}             id=finish

*** Keywords ***
Nova sessão
    Open Browser                        ${Url}            ${Navegador}
    Maximize Browser Window

Efetuar Login
    Input Text                          ${Username}        standard_user
    Input Text                          ${Password}        secret_sauce
    Wait Until Element Is Visible       ${Login}           timeout=5
    Click Element                       ${Login}

Selecionar produtos e encaminhar ao carrinho    
    Select From List By Label           ${Ordenar}         Price (low to high)
    Click Element                       ${Product}
    Click Element                       ${Product_red}
    Wait Until Element Is Visible       ${Cart}            timeout=5
    Click Element                       ${Cart}

Clicar em Checkout    
    Wait Until Element Is Visible       ${Checkout}        timeout=5
    Click Element                       ${Checkout}

Preencher dados para envio
    Input Text                          ${first-name}      Kaleby
    Input Text                          ${last-name}       Porfirio
    Input Text                          ${Cep}             60541-902
    Wait Until Element Is Visible       ${Continue}        timeout=10
    Click Element                       ${Continue}

Finalizar Compra   
    Wait Until Element Is Visible       ${Finish}          timeout=10
    Click Element                       ${Finish}     

Encerrar sessão
    Close Browser