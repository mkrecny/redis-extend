local subset_size = tonumber(ARGV[1]);
for i=0, subset_size-1 do
  redis('sadd', KEYS[2], redis('srandmember', KEYS[1]))
end
return {ok='OK'};
