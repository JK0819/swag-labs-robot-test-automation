*** Settings ***
Documentation     All the page objects and keywords of products page
Library           SeleniumLibrary
Library           Collections
Resource          ../pageObject/generic.robot
Resource          ../pageObject/login.robot
Resource          ../pageObject/products.robot
Resource          ../pageObject/cart.robot

*** Variables ***
${firstNameLocator}     first-name
${lastNameLocator}      last-name
${postalCodeLocator}    postal-code
${continueBtnLocator}   continue
${FinishBtnLocator}     finish
${completeLocator}      css:.complete-header
${completionText}       Thank you for your order!

*** Keywords ***
Navigate to checkout flow
    [Arguments]    ${productName}
    login.Fill the login Form     ${userName}    ${validPassword}
    products.Add product to cart    ${productName}
    products.Click on cart icon
    generic.Verify Header content
    cart.Verify cart sub header
    cart.Verify cart content        ${productName}
    generic.Verify Footer content
    cart.Click on checkout button

Verify checkout sub header
    [Arguments]    ${checkoutTitle}
    generic.Verify Page sub header  ${pageTitleLocator}     ${checkoutTitle}

Fill checkout form
    [Arguments]     ${firstName}    ${lastName}     ${postalCode}
    Input Text          ${firstNameLocator}      ${firstName}
    Input Text          ${lastNameLocator}      ${lastName}
    Input Text          ${postalCodeLocator}      ${postalCode}
    Click Button        ${continueBtnLocator}

Verify checkout overview
    [Arguments]    ${overviewTitle}
    generic.Verify Page sub header  ${pageTitleLocator}     ${overviewTitle}

Finish the checkout flow
    Click Button    ${FinishBtnLocator}

Verify Successful completion of checkout
    generic.Verify Eelement text    ${completeLocator}      ${completionText}


