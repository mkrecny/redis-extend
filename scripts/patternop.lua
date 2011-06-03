return redis.call(ARGV[1], unpack(redis.call('keys', ARGV[2])))
