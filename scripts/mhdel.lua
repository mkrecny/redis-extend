local keys,argv,rcall = KEYS,ARGV,redis.call
local n,f = 0,argv[1]
for i,k in ipairs(keys) do n = n + rcall("hdel",k,f) end
return n