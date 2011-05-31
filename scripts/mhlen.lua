local keys,argv,rcall = KEYS,ARGV,redis.call
local r = {}
for i,k in ipairs(keys) do r[#r+1] = rcall("hlen",k) end
return r