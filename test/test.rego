package test
import data.rules
import data.http
default testA = false
default testB = false
default testC = false
default testD = false
default testE = false
testA {
  rules.allow with input as {"user":"alice","method":"get"}
  http.allow with input as {"user":"alice","method":"get"}
  }
testB {
  not rules.allow with input as {"user":"alice","method":"delete"}
  not http.allow with input as {"user":"alice","method":"delete"}
  }
testC {
  not rules.allow with input as {"user":"alice","method":"post"}
  not http.allow with input as {"user":"alice","method":"post"}
  }
testD {
  not rules.allow with input as {"user":"alice","method":"put"}
  not http.allow with input as {"user":"alice","method":"put"}
  }
  
testE {
  rules.allow with input as {"user":"dana","method":"delete"}
  http.allow with input as {"user":"dana","method":"delete"}
  }