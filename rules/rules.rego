package rules
import data.dataset
default allow=false
allow=true{
    data.users[input.user][input.method]
}