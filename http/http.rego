package http
default valid_method=false
default valid_user=false
default allow=false
SQLdata=http.send({"raise_error":false,"method":"GET","url":"http://34.88.127.167/sqlAPI/"})
valid_method {
  some i
    SQLdata.methods[i]==input.method
}
valid_user{
  SQLdata.users[input.user]
}
allow {
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
  not allow
  reason := {"reason":"User not authorized"}
}
message[reason] {
  allow
  reason := {"message":"Succefully executed the requested method"}
}
response:={"allow":allow,"message":message}
