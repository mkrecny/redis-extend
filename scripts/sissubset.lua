if (redis.call('scard', KEYS[2]) == #redis.call('sinter', unpack(KEYS))) then return 1 else return 0 end
