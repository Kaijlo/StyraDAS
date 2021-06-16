package rules
import data.dataset
default allow=false
allow=true{
    users[input.user][input.method]
}