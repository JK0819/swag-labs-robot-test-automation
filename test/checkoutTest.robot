*** Settings ***
Documentation   To validate the Swag Labs Demo Cart
Library     SeleniumLibrary
Resource        ../main/pageObject/generic.robot
Resource        ../main/pageObject/checkout.robot
Test Setup      Open the browser with the sauce demo url
Test Teardown   Close browser session

*** Variables ***
${productName}      Sauce Labs Bike Light
${firstName}        TestName
${lastName}         TestLastName
${postalCode}       12345
${checkoutTitle}    Checkout: Your Information
${overviewTitle}    Checkout: Overview

*** Test Cases ***
Validate checkout flow
    [Tags]      CHECKOUT    REGRESSION
    checkout.Navigate to checkout flow      ${productName}
    checkout.Verify checkout sub header     ${checkoutTitle}
    checkout.Fill checkout form     ${firstName}    ${lastName}     ${postalCode}
    checkout.Verify checkout overview   ${overviewTitle}
    checkout.Finish the checkout flow
    checkout.Verify Successful completion of checkout
