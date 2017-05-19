--this is NOT a LOVE project: don't run it with Love, run it with Lua.
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

  --further game behaviour here
  --TIP: use os.time() to count seconds since execution
  --E.G, send hello every 2 seconds
  --if ((os.time() - lastSend) > 1) then udp:sendto("Hello!") lastSend = os.time() end
end
  print("Server closed.")
