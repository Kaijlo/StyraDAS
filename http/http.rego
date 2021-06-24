package http
body := {"input":{"user":"alice","method":"get"}}
response := http.send({"raise_error":false,"method":"POST","url":"http://localhost:6000","body":body,"headers":{"Content-Type":"application/json"}})

