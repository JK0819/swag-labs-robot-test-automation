*** Settings ***
Documentation   To validate the Swag Labs Demo Cart
Library     SeleniumLibrary
Resource        ../main/pageObject/generic.robot
Resource        ../main/pageObject/login.robot
Resource        ../main/pageObject/products.robot
Resource        ../main/pageObject/cart.robot
Test Setup      Open the browser with the sauce demo url
Test Teardown   Close browser session

*** Variable ***
${productName}      Sauce Labs Bike Light

*** Test Cases ***
Validate cart page content and checkout
    [Tags]      CART    REGRESSION
    login.Fill the login Form     ${userName}    ${validPassword}
    products.Add product to cart    ${productName}
    products.Click on cart icon
    generic.Verify Header content
    cart.Verify cart sub header
    cart.Verify cart content        ${productName}
    generic.Verify Footer content
    cart.Click on checkout button
