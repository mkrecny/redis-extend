# Redis-Extend

Redis-Extend is a collection of non-native, atomic redis commands that perform specific tasks. 
If you know lua or are interested in redis, please consider contributing an interesting and useful command - or improve the existing.

## Usage
Simply load the command from scripts/ according to 'command.lua'. The commands are described below.
src/ contains the latest redis scripting branch from http://redis.io.
    
## Commands

### MHDEL key1 [key2 ...] field
Remove the same field from several hashes, get the number of values actually removed.

### MHLEN key1 [key2 ...]
Varadic HLEN.

### MHSET key1 [key2 ... keyN] value1 [value2 ... valueN] field
Set the same field in several hashes, get the number of fields actually created (not updated).

### SISSUBSET key1 key2 
Determine if the set at 'key2' is a subset of the set at 'key1'

### SOPSCARD key1 [key2 ... keyN] operation
Get the cardinality/size of the set resulting from the 'operation' ('smembers','sinter','sunion') between the sets residing at 'key1' ... 'keyN'.

### SOPSRANDSUBSET key1 [key2 ... keyN] operation count
Get a random subset of maximum size 'count' from the 'operation' ('smembers','sinter','sunion') between the set residing at 'key1' and all the sets residing at 'key2' ... 'keyN'.
