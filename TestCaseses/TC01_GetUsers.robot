*** Setting ***
Library    RequestsLibrary
    

*** Variables ***
${BaseURL}    https://reqres.in/
${UserID}    5
*** Test Cases ***
TC1_GetUsers
    Create Session    usersSession    ${BaseURL}
    ${response}    GET On Session    usersSession    api/users/3
    Log To Console    ${response.content}
    Log To Console    ${response.status_code}
TC2_GetSinglUser
    Create Session    usersession    ${BaseURL}
    ${userResponse}    GET On Session    userSession    api/users/${UserID}
    Log To Console    ${userResponse.content}
    Log To Console    ${userResponse.status_code}
    ${actuaStatusCode}    Convert To String    ${userResponse.status_code}
    Should Be Equal    ${actuaStatusCode}    200
TC3_GetUsersWithParams
    Create Session    usersessionWithParamas    ${BaseURL}
    &{parametres}    Create Dictionary    page=3
    ${userResponse}    GET On Session    usersessionWithParamas    api/users    params=&{parametres}
    Log To Console    ${userResponse.content}
    Log To Console    ${userResponse.status_code}
    ${actuaStatusCode}    Convert To String    ${userResponse.status_code}
    Should Be Equal    ${actuaStatusCode}    200 