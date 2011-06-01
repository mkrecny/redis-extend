local keys,argv,rcall = KEYS,ARGV,redis.call
for i=0, tonumber(argv[1])-1 do
  rcall("sadd",keys[2],rcall("srandmember",keys[1]))
end
return {ok="OK"}
