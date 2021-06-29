package http
default valid_method=false
default valid_user=false
default allowHttp=false
SQLdata=http.send({"raise_error":false,"method":"GET","url":"http://localhost/sqlAPI/","headers":{"Content-Type":"application/json"}}).body
valid_method {
  some i
    SQLdata.methods[i]==input.method
}
valid_user{
  SQLdata.users[input.user]
}
allowHttp {
  some i
    SQLdata.users[input.user][i]==input.method
}
message[reason] {
  not valid_user
  reason := {"reason":"Inavlid user"}
}
message[reason] {
  not valid_method
  reason := {"reason":"Invalid method"}
}
message[reason] {
  valid_user
  valid_method
  not allowHttp
  reason := {"reason":"User not authorized"}
}
message[reason] {
  allowHttp
  reason := {"message":"Succefully executed the requested method"}
}
response:={"allowHttp":allowHttp,"messageHttp":message}
