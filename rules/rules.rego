package rules
import data.dataset
default allow=false
allow=true{
    some i
    dataset["users"][input.user][i]==input.method
}