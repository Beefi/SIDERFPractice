*** Settings ***
Documentation   Successful user login
Library         SeleniumLibrary

*** Test Cases ***

Valid Login
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize Browser Window
    Input Text    user-name    standard_user
    Input Password    password    secret_sauce
    Click Button    login-button
    Element Text Should Be    class:title    PRODUCTS
    [Teardown]  Close Browser

Locked Out User
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize Browser Window
    Input Text    user-name    locked_out_user
    Input Password    password    secret_sauce
    Click Button    login-button
    Element Should Be Enabled    xpath://div[@class='login_wrapper']/div[@class='login_wrapper-inner']/div[@id='login_button_container']/div[@class='login-box']/form/div[@class='error-message-container error']/h3
    Element Text Should Be    xpath://div[@class='login_wrapper']/div[@class='login_wrapper-inner']/div[@id='login_button_container']/div[@class='login-box']/form/div[@class='error-message-container error']/h3    Epic sadface: Sorry, this user has been locked out.
    [Teardown]  Close Browser

Wrong Password
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize Browser Window
    Input Text    user-name    locked_out_user
    Input Password    password    wrong_pass
    Click Button    login-button
    Element Should Be Enabled    xpath://div[@class='login_wrapper']/div[@class='login_wrapper-inner']/div[@id='login_button_container']/div[@class='login-box']/form/div[@class='error-message-container error']/h3
    Element Text Should Be    xpath://div[@class='login_wrapper']/div[@class='login_wrapper-inner']/div[@id='login_button_container']/div[@class='login-box']/form/div[@class='error-message-container error']/h3    Epic sadface: Username and password do not match any user in this service
    [Teardown]  Close Browser

Problem User
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize Browser Window
    Input Text    user-name    problem_user
    Input Password    password    secret_sauce
    Click Button    login-button
    Element Text Should Be    xpath://div[@id='inventory_container']/div/div[@id='inventory_container']/div[@class='inventory_list']/div[@class='inventory_item'][1]/div[@class='inventory_item_description']/div[@class='inventory_item_label']/a[@id='item_4_title_link']/div[@class='inventory_item_name']    Sauce Labs Backpack
    Click Element    xpath://div[@id='inventory_container']/div/div[@id='inventory_container']/div[@class='inventory_list']/div[@class='inventory_item'][1]/div[@class='inventory_item_description']/div[@class='inventory_item_label']/a
    Element Text Should Be    xpath://div[@id='inventory_item_container']/div[@class='inventory_details']/div[@class='inventory_details_container']/div[@class='inventory_details_desc_container']/div[@class='inventory_details_name large_size']    Sauce Labs Fleece Jacket
    [Teardown]  Close Browser

Sort Product Name (A to Z)
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize Browser Window
    Input Text    user-name    standard_user
    Input Password    password    secret_sauce
    Click Button    login-button
    Click Element    class:product_sort_container
    Select From List By Index    class:product_sort_container   0
    Click Element At Coordinates    xpath=//div[@id='inventory_container']/div/div[@id='inventory_container']/div[@class='inventory_list']/div[@class='inventory_item'][1]/div[@class='inventory_item_description']/div[@class='inventory_item_label']/a    0    0
    Element Text Should Be    xpath://div[@id='inventory_item_container']/div[@class='inventory_details']/div[@class='inventory_details_container']/div[@class='inventory_details_desc_container']/div[@class='inventory_details_name large_size']    Sauce Labs Backpack
    [Teardown]  Close Browser

Sort Product Name (Z to A)
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize Browser Window
    Input Text    user-name    standard_user
    Input Password    password    secret_sauce
    Click Button    login-button
    Click Element    class:product_sort_container
    Select From List By Index    class:product_sort_container   1
    Click Element At Coordinates    xpath=//div[@id='inventory_container']/div/div[@id='inventory_container']/div[@class='inventory_list']/div[@class='inventory_item'][1]/div[@class='inventory_item_description']/div[@class='inventory_item_label']/a    0    0
    Element Text Should Be    xpath://div[@id='inventory_item_container']/div[@class='inventory_details']/div[@class='inventory_details_container']/div[@class='inventory_details_desc_container']/div[@class='inventory_details_name large_size']    Test.allTheThings() T-Shirt (Red)
    [Teardown]  Close Browser

Sort Product Prices (Low to High)
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize Browser Window
    Input Text    user-name    standard_user
    Input Password    password    secret_sauce
    Click Button    login-button
    Click Element    class:product_sort_container
    Select From List By Index    class:product_sort_container   2
    Click Element At Coordinates    xpath=//div[@id='inventory_container']/div/div[@id='inventory_container']/div[@class='inventory_list']/div[@class='inventory_item'][1]/div[@class='inventory_item_description']/div[@class='inventory_item_label']/a    0    0
    Element Text Should Be    xpath://div[@id='inventory_item_container']/div[@class='inventory_details']/div[@class='inventory_details_container']/div[@class='inventory_details_desc_container']/div[@class='inventory_details_name large_size']    Sauce Labs Onesie
    [Teardown]  Close Browser

Sort Product Prices (High to Low)
    Open Browser    https://www.saucedemo.com/  chrome
    Maximize Browser Window
    Input Text    user-name    standard_user
    Input Password    password    secret_sauce
    Click Button    login-button
    Click Element    class:product_sort_container
    Select From List By Index    class:product_sort_container   3
    Click Element At Coordinates    xpath=//div[@id='inventory_container']/div/div[@id='inventory_container']/div[@class='inventory_list']/div[@class='inventory_item'][1]/div[@class='inventory_item_description']/div[@class='inventory_item_label']/a    0    0
    Element Text Should Be    xpath://div[@id='inventory_item_container']/div[@class='inventory_details']/div[@class='inventory_details_container']/div[@class='inventory_details_desc_container']/div[@class='inventory_details_name large_size']    Sauce Labs Fleece Jacket
    [Teardown]  Close Browser