package rules
import data.dataset
default allow=false
allow=true{
    data.dataset.users[input.user][input.method]
}