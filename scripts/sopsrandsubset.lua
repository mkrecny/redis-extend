function rand_subset(set,max_size)
  local limit = #set - max_size + 1
  if limit < 1 then limit = 1 end
  local r = {}
  for i=#set,limit,-1 do
    r[#r+1] = table.remove(set,math.random(i))
  end
  return r
end
return rand_subset(redis.call(ARGV[1],unpack(KEYS)),tonumber(ARGV[2]))
