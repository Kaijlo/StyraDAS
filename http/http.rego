package http
body := {"input":{"sql":"SELECT * FROM Users.users;","db":"UserSQL"}}
response := http.send({"raise_error":false,"method":"POST","url":"http://localhost:6000","body":body,"headers":{"Content-Type":"application/json"}})

