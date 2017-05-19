local socket = require "socket"
local udp = socket.udp()

udp:settimeout(0)
udp:setsockname("*", 26656)

--game variables here

local running = true
print("Entering server loop...")

while running do

  data, msg_or_ip, port_or_nil = udp:receiveFrom()
  if data then
    entity, cmd, parms = data:match("^(%S*) (%S*) (.*)")

    --responses to commands here
  elseif msg_or_ip ~= 'timeout' then
    error("Unknown network error: "..tostring(msg))

    socket.sleep(0.1)
  end

  print("Server closed.")
