*** Settings ***
Library  RequestsLibrary
Library  Collections


*** Variables ***
${base_url}=    http://restapi.demoqa.com/customer



*** Test Cases ***
Put_CustomerRegistration
  create session          mysession           ${base_url}
  ${body}=                create dictionary   FirstName=alextest    LastName=sohntest   UserName=alexsohntest    Password=alexsohntestpassword               Email=alexsohntest@gmail.com
  ${header}=              create dictionary   Content-Type=application/json
  ${response}=            post request            mysession           /register         data=${body}    headers=${header}
  log to console          ${response.status_code}
  log to console          ${response.content}

  # Validations 
  ${status_code}=         convert to string   ${response.status_code}
  should be equal         ${status_code}      201
  ${res_body}=            convert to string   ${response.content}
  should contain          ${res_body}         OPERATION_SUCCESS
  should contain          ${res_body}         Operation completed successfully           