*** Settings ***
Resource    ../main.robot

*** Variables ***
${url}    https://efood-gilt.vercel.app/
${browser}        edge
${counter}    0


*** Keywords ***

Open browser and login 
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window 
    
verificar status api
    Create Session    alias=status        url=https://fake-api-tau.vercel.app/api/efood/restaurantes
    ${response}    GET On Session    alias=status     url=https://fake-api-tau.vercel.app/api/efood/restaurantes    expected_status=200
    # Log To Console    ${response.json()}
    Status Should Be    200

passar todos os restaurantes 
    Create Session        alias=lista        url=https://fake-api-tau.vercel.app/api/efood/restaurantes
    ${response}    GET On Session        alias=lista        url=https://fake-api-tau.vercel.app/api/efood/restaurantes         expected_status=200
    # Log To Console    ${response.json()}
    
    FOR    ${counter}    IN RANGE        6
      ${titulos}    set variable           ${response.json()[${counter}]['titulo']}  
      log to console    ${titulos}  
        
    END
    







