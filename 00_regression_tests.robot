*** Settings ***
Library                                        Selenium2Library
Library                                        OperatingSystem

Test Setup                                     Setup
Test Teardown                                  Teardown                     

*** Keywords ***
Setup
    Set Environment Variable                   webdriver.chrome.driver                                     /usr/local/bin/chromedriver    
    Open Browser                               http://localhost:8080/hotel/faces/login/login.xhtml         browser=chrome  
    Maximize Browser Window  
    Set Selenium Speed                         .2
    Set Selenium Timeout                       30
    Delete All Cookies
    Wait Until Page Contains                   Login    
    Location Should be                         http://localhost:8080/hotel/faces/login/login.xhtml  
    Title Should be                            Hotel Accomodation - login page                        
   
Teardown    
    Close All Browsers 


*** Test Cases ***
Test_Login_logout
    Input Text                                 id=formLogin:login                                           jp
    Input Text                                 id=formLogin:senha                                           1010
    Click Element                              name=formLogin:j_idt27
    Wait Until Page Contains Element           xpath=//a[@class='dropdown-toggle']
    click element                              xpath=//a[@class='dropdown-toggle']
    Wait Until Page Contains Element           xpath=//i[@class='fa fa-sign-out fa-fw']
    click element                              xpath=//i[@class='fa fa-sign-out fa-fw']                 
    Wait Until Page Contains                   Login     
    Title Should be                            Hotel Accomodation - login page
                                            