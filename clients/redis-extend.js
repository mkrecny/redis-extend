var fs = require('fs');

/*
 * JavaScript redis-extend 'client'
 * @param scripts_dir : string : location of your lua scripts dir
 */

var RedisExtend = function(scripts_dir){
  this.scripts = {}, self = this, scripts_dir = scripts_dir || __dirname+'/../scripts/';

  var scripts = fs.readdirSync(scripts_dir);
  scripts.forEach(function(s){
    var key = s.replace('.lua', '');
   self.scripts[key] = fs.readFileSync(scripts_dir+s, 'utf8');
  });
};

/*
 * Return the script command with name script_name
 * @param script_name : string : name of the command eg 'sopscard'
 */
RedisExtend.prototype.getScript = function(script_name){
  return this.scripts[script_name.toLowerCase()];
};

/*
 * Extend the node_redis client object to support redis-extend commands
 * @param redis_client : object : the redis_client - must be a node_redis client w/ support for eval
 */
RedisExtend.prototype.extend = function(redis_client){
  for (var e in this.scripts){
    if (this.scripts.hasOwnProperty(e)){
      var script = this.getScript(e);
      (function(s){redis_client[e] = function(keys, argv, callback){
        var args = [];
        args.push(s, keys.length || 0);
        args = args.concat(keys, argv || callback, callback || null); 
        redis_client.eval.apply(redis_client, args);
      };})(script);
    }
  }
};

exports.create = function(scripts_dir){
  return new RedisExtend(scripts_dir);
};

// Examples 
//var redis_client = require('../../node_redis').createClient();
//r = new RedisExtend();
//r.extend(redis_client);
//redis_client.sissubset(['foo', 'bar'], [], console.log);
//redis_client.sopscard(['foo'], ['smembers'], console.log);
//redis_client.sopsrandsubset(['foo', 'bar'], ['sunion', 1], console.log);
