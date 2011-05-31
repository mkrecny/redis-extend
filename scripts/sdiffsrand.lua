local keys,argv,rcall = KEYS,ARGV,redis.call
local diff = rcall('sdiff', keys[1], keys[2])
local max = tonumber(argv[1])
if max > table.getn(diff) then max = table.getn(diff) end
local output = {} 
for i=0, max-1 do table.insert(output, table.remove(diff)) end
return output