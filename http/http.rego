package http
body := {"input":{"user":"alice","method":"get"}}
response := http.send({"raise_error":false,"method":"POST","url":"http://localhost:8181/v1/data/rules/response","body":body,"headers":{"Content-Type":"application/json"}})

