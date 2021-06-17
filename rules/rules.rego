package rules
import data.dataset
import data.global.users
default allow=false
default testA = false
default testB = false
default testC = false
default testD = false
default testE = false

allow=true{
    some i
    users.attributes["users"][input.user][i]==input.method
}

testA {
  allow with input as {"user":"alice","method":"get"}
  }
testB {
  not allow with input as {"user":"alice","method":"delete"}
  }
testC {
  not allow with input as {"user":"alice","method":"post"}
  }
testD {
  not allow with input as {"user":"alice","method":"put"}
  }
  
testE {
  not allow with input as {"user":"alice","method":"put"}
  }
  