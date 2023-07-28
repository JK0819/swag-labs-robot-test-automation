*** Settings ***
Documentation     All the page objects and keywords of login page
Library           SeleniumLibrary
Resource          ../pageObject/generic.robot

*** Variables ***
${usernameLocator}      user-name
${passwordLocator}      password
${loginBtnLocator}      login-button
${errorMsgLocator}      css:[data-test='error']
${swagLabTitle}         css:.login_logo
${errorMessage}         Epic sadface: Username and password do not match any user in this service

*** Keywords ***
Login Page title header
    [Arguments]    ${titleHeader}
    Wait until element passed is located on Page    ${swagLabTitle}
    Element Text Should Be  ${swagLabTitle}     ${titleHeader}

Username and password textfields are displayed
    generic.Contains TextField      ${usernameLocator}
    generic.Contains TextField      ${passwordLocator}

Login button is displayed
    generic.Contains Button     ${loginBtnLocator}

Fill the login Form
    [Arguments]     ${username}     ${password}
    Input Text          ${usernameLocator}      ${username}
    Input Password      ${passwordLocator}      ${password}
    Click Button        ${loginBtnLocator}

Verify error message is correct
   Element Text Should Be       ${errorMsgLocator}      ${errorMessage}
