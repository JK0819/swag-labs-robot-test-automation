*** Settings ***
Documentation     All the page objects and keywords of products page
Library           SeleniumLibrary
Library           Collections
Resource          ../pageObject/generic.robot

*** Variables ***
${productPageTitleText}     Products
${filterLocator}            css:.product_sort_container
${productsLoctor}           css:.inventory_item_name
${cartIconLocator}          css:.shopping_cart_link
${product1}                 Sauce Labs Backpack
${product2}                 Sauce Labs Bike Light
${product3}                 Sauce Labs Bolt T-Shirt
${product4}                 Sauce Labs Fleece Jacket
${product5}                 Sauce Labs Onesie
${product6}                 Test.allTheThings() T-Shirt (Red)

*** Keywords ***
Verify product page sub header
    generic.Verify Page sub header  ${pageTitleLocator}     ${productPageTitleText}
    generic.Element is visible on Page  ${filterLocator}

Verify products in product page
   @{expectedList} =    Create List     ${product1}     ${product2}     ${product3}     ${product4}     ${product5}     ${product6}
   ${elements} =  Get WebElements     ${productsLoctor}
   @{actualList} =   Create List
   FOR  ${element}  IN      @{elements}
      Log   ${element.text}
      Append To List    ${actualList}     ${element.text}
   END
   Lists Should Be Equal   ${expectedList}    ${actualList}

Add product to cart
    [Arguments]     ${product}
    ${elements} =  Get WebElements     ${productsLoctor}
    ${index}=   Set Variable    1
     FOR  ${element}  IN      @{elements}
         Exit For Loop If      '${product}' == '${element.text}'
         ${index}=  Evaluate   ${index} + 1
     END
    Click Button    xpath:(//*[@class='pricebar'])[${index}]/button

Click on cart icon
    Click Link    ${cartIconLocator}
