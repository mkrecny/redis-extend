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

### SDIFFSRAND key1 key2 rand
Get a random subset of size 'rand' from the difference of the two sets residing at 'key1' and 'key2'

### SINTERSCARD key1 key2
Get the cardinality/size of the intersection of the two sets residing at 'key1' and 'key2'

### SRANDSUBSTORE source destination subset
Get a random subset of size  'subset' from the set residing at 'source' and store it in a set residing at 'destination'

### SUNIONSCARD key1 key2
Get the cardinality/size of the union of the two sets residing at 'key1' and 'key2'
