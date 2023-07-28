*** Settings ***
Documentation     A resource file with reusable keywords and variables.
Library           SeleniumLibrary

*** Variables ***
${userName}                 standard_user
${invalidPassword}          invalid_pass_1234
${validPassword}            secret_sauce
${url}                      https://www.saucedemo.com/
${browser_name}             Chrome
${burgerMenuIconLocator}    react-burger-menu-btn
${cartIcon}                 shopping_cart_container
${appIconLocator}           css:.app_logo
${twitterLocator}           css:.social_twitter
${facebookLocator}          css:.social_facebook
${linkedInLocator}          css:.social_linkedin
${PivaryTxtLocator}         css:.footer_copy
${pageTitleLocator}         css:.title
${appTitle}                 Swag Labs
${privacyTxt}               © 2023 Sauce Labs. All Rights Reserved. Terms of Service | Privacy Policy

*** Keywords ***
Open the browser with the sauce demo url
    Create Webdriver    ${browser_name}
    Go To   ${url}

Close browser session
    Close Browser

Element is visible on Page
    [Arguments]     ${elementLocator}
    Element Should Be Visible       ${elementLocator}

Wait until element passed is located on Page
    [Arguments]         ${pageLocator}
    Wait Until Element Is Visible        ${pageLocator}        timeout=10

Contains TextField
    [Arguments]         ${textFieldLocator}
    Page Should Contain Textfield       ${textFieldLocator}

Contains Button
    [Arguments]    ${buttonLocator}
    Page Should Contain Button      ${buttonLocator}

Verify Eelement text
    [Arguments]    ${locator}   ${text}
    Element Text Should Be      ${locator}  ${text}

Verify Header content
    Wait until element passed is located on Page       ${appIconLocator}
    Verify Eelement text      ${appIconLocator}   ${appTitle}
    Element is visible on Page   ${burgerMenuIconLocator}
    Element is visible on Page          ${cartIcon}

Verify Footer content
    Element is visible on Page   ${twitterLocator}
    Element is visible on Page   ${facebookLocator}
    Element is visible on Page   ${linkedInLocator}
    Verify Eelement text      ${PivaryTxtLocator}   ${privacyTxt}

Verify Page sub header
    [Arguments]    ${titleLocator}  ${text}
    Verify Eelement text    ${titleLocator}     ${text}
