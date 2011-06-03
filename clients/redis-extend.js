var fs = require('fs');

/*
 * JavaScript redis-extend client
 */

var RedisExtend = function(scripts_dir){
  this.scripts = {}, self = this, scripts_dir = scripts_dir || '../scripts/';

  var scripts = fs.readdirSync(scripts_dir);
  scripts.forEach(function(s){
    var key = s.replace('.lua', '');
   self.scripts[key] = fs.readFileSync(scripts_dir+s, 'utf8');
  });
};

RedisExtend.prototype.getScript = function(script_name){
  return this.scripts[script_name.toLowerCase()];
};

RedisExtend.prototype.extend = function(redis_client, commands){
  var extensions = commands ? commands : this.scripts;  
  for (var e in extensions){
    if (extensions.hasOwnProperty(e)){
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

// Examples 
//var redis_client = require('../../node_redis').createClient();
//r = new RedisExtend();
//r.extend(redis_client);
//redis_client.sissubset(['foo', 'bar'], [], console.log);
//redis_client.sopscard(['foo'], ['smembers'], console.log);
//redis_client.sopsrandsubset(['foo', 'bar'], ['sunion', 1], console.log);
