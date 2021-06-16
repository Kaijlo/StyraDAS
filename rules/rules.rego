package rules
import data.dataset
default allow=false
default testA = false
default testB = false
default testC = false
default testD = false
allow=true{
    some i
    dataset["users"][input.user][i]==input.method
}

testA {
  allow with input as {"user":"alice","method":"get"}
  }
testD {
  not allow with input as {"user":"alice","method":"delete"}
  }
testC {
  not allow with input as {"user":"alice","method":"post"}
  }
testD {
  not allow with input as {"user":"alice","method":"put"}
  }
  