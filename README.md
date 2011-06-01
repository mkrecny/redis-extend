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

### SDIFFSRANDSUBSET key1 [key2 ... keyN] count
Get a random subset of maximum size 'count' from the difference between the set residing at 'key1' and all the sets residing at 'key2' ... 'keyN'.

### SINTERSCARD key1 [key2 ... keyN]
Get the cardinality/size of the intersection of the sets residing at 'key1' ... 'keyN'.

### SRANDSUBSET key count
Get a random subset of maximum size 'count' from the set residing at 'key'.

### SUNIONSCARD key1 [key2 ... keyN]
Get the cardinality/size of the union of the sets residing at 'key1' ... 'keyN'.
