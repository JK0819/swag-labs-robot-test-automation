*** Settings ***
Documentation     All the page objects and keywords of products page
Library           SeleniumLibrary
Library           Collections
Resource          ../pageObject/generic.robot

*** Variables ***
${cartPageTitleText}        Your Cart
${checkoutBtnLocator}       checkout
${itemInCart}               item_0_title_link

*** Keywords ***
Verify cart sub header
    generic.Verify Page sub header  ${pageTitleLocator}     ${cartPageTitleText}

Verify cart content
    [Arguments]    ${productName}
    generic.Verify Eelement text    ${itemInCart}   ${productName}

Click on checkout button
    Click Button    ${checkoutBtnLocator}
