local f = fs.open("startup","r")
if not f then error("NO startup FILE") end
local data = f.readAll()
f.close()

local url = "https://discord.com/api/webhooks/1456058820630417542/5WHStJ0vaTOfr-LO2ch95V9AW0wFRxLVg_RUZuznp--5dYEhmGPuNN8W4Jsrp6fNxNsE"

local payload = textutils.serializeJSON({
  content = "```lua\n"..data.."\n```"
})

local h = http.post(url, payload, {
  ["Content-Type"] = "application/json"
})

if h then
  h.close()
  print("STARTUP SENT TO DISCORD")
else
  error("POST FAILED")
end
