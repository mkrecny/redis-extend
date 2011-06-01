local diff = redis.call("sdiff",unpack(KEYS))
local max = tonumber(ARGV[1])
if max > #diff then max = #diff end
local output = {} 
for i=0,max-1 do table.insert(output,table.remove(diff)) end
return output