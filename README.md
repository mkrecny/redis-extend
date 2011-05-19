# Redis-Extend

Redis-Extend is a collection of non-native, atomic redis commands that perform specific tasks. 
If you know lua or are interested in redis, please consider contributing an interesting and useful command - or improve the existing.

## Usage
Simply access the command from scripts.json by index. The commands are described below.
src/ contains the latest redis scripting branch from http://redis.io.
    
## Commands

### SINTERSIZE key1 key2
Get the size of the intersection of the two sets residing at 'key1' and 'key2'

### SDIFFSRAND key1 key2 rand
Get a random subset of size 'rand' from the difference of the two sets residing at 'key1' and 'key2'

### SRANDSUBSTORE source destination subset
Get a random subset of size  'subset' from the set residing at 'source' and store it in a set residing at 'destination'



