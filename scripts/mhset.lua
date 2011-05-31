local keys,argv,rcall = KEYS,ARGV,redis.call
local n,f = 0,argv[#keys+1]
for i,k in ipairs(keys) do n = n + rcall("hset",k,f,argv[i]) end
return n