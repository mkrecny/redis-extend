return redis.call(ARGV[2], unpack(redis.call('keys', ARGV[1])))
