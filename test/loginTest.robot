*** Settings ***
Documentation   To validate the Swag Labs Demo Login
Library     SeleniumLibrary
Resource        ../main/pageObject/generic.robot
Resource        ../main/pageObject/login.robot
Resource        ../main/pageObject/products.robot
Test Setup      Open the browser with the sauce demo url
Test Teardown   Close browser session

*** Variables ***
${loginPageTitle}       Swag Labs

*** Test Cases ***
Validate Login Page Content
    [Tags]      LOGIN   REGRESSION
    login.Login Page title header   ${loginPageTitle}
    login.Username and password textfields are displayed
    login.Login button is displayed

Validate UnSuccesful Login
    [Tags]      LOGIN   REGRESSION
    login.Fill the login Form     ${userName}    ${invalidPassword}
    generic.Wait until element passed is located on Page     ${errorMsgLocator}
    login.Verify error message is correct

Validate Successful Login
    [Tags]      LOGIN   REGRESSION
    login.Fill the login Form     ${userName}    ${validPassword}
    generic.Wait until element passed is located on Page     ${cartIcon}