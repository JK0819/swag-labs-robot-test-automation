*** Settings ***
Documentation   To validate the Swag Labs Demo Products page
Library     SeleniumLibrary
Resource        ../main/pageObject/generic.robot
Resource        ../main/pageObject/login.robot
Resource        ../main/pageObject/products.robot
Test Setup      Open the browser with the sauce demo url
Test Teardown   Close browser session

*** Variables ***
${productName}      Sauce Labs Fleece Jacket

*** Test Cases ***
Validate Products page content
    [Tags]      PRODUCTS
    login.Fill the login Form     ${userName}    ${validPassword}
    generic.Verify Header content
    products.Verify product page sub header
    products.Verify products in product page
    generic.Verify Footer content

Select product and proceed to cart
    [Tags]      PRODUCTS
    login.Fill the login Form     ${userName}    ${validPassword}
    products.Add product to cart    ${productName}
    products.Click on cart icon
