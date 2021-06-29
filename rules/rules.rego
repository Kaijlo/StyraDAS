package rules
import data.dataset
default valid_method=false
default valid_user=false
default allowed=false
valid_method {
  some i
    dataset.methods[i]==input.method
}
valid_user{
  dataset.users[input.user]
}
allowed {
  some i
    dataset.users[input.user][i]==input.method
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
  not allowed
  reason := {"reason":"User not authorized"}
}
message[reason] {
  allowed
  reason := {"message":"Succefully executed the requested method"}
}
response:={"allow":allowed,"message":message}
