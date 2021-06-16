package rules
import data.dataset
default allow=false
allow=true{
    dataset.users[input.user][input.method]
}