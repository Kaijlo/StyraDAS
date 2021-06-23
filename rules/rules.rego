package rules
import data.dataset
import data.global.users
default valid_method=false
default valid_user=false
default allow=false
valid_method {
  some i
    dataset.methods[i]==input.method
}
valid_user{
  dataset.users[input.user]
}
allow {
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
  not allow
  reason := {"reason":"User not authorized"}
}
message[reason] {
  allow
  reason := {"message":"Succefully executed the requested method"}
}
response:={"allow":allow,"message":message}
