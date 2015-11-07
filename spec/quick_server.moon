
port = assert tonumber(...), "missing port"

socket = require "socket"
sock = assert socket.bind "*", port

-- initial request to check if open
client = assert sock\accept!
client\close!

client = assert sock\accept!

client\settimeout 0
buffer = {}
while true
  char, err = client\receive 1
  break unless char
  table.insert buffer, char

client\send "HTTP/1.0 200 OK\nContent-Length: 0\n\n"

out = with table.concat buffer
  client\close!

print out
