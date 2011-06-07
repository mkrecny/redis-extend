local keys,argv,rcall = KEYS,ARGV,redis.call
local r = {}
local old,new
for i,k in ipairs(keys) do
  old,new = rcall("get",k),argv[i]
  if (not old) or (tonumber(old) < tonumber(new)) then
    rcall("set",k,new)
    r[#r+1] = new
  else
    r[#r+1] = old
  end
end
return r