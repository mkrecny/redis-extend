require "redis"
require "fileutils"

class ExtendedRedis < Redis

  def initialize(options={})
    @lua_src = {}
    @udp_dir = options.delete(:udp_dir)
    reload_udp
    super(options)
  end

  def udp_list
    @lua_src.keys
  end

  def reload_udp
    return if @udp_dir.nil?
    @udp_dir = File.expand_path(@udp_dir)
    names = Dir.chdir(@udp_dir){Dir.glob("*.lua")}
    names.map!{|x| File.basename(x,".lua").to_sym}
    names.each do |x|
      @lua_src[x] = IO.read(File.join(@udp_dir,"#{x}.lua"))
    end
  end

  def udp(name,keys,values=nil)
    kk,vv = Array(keys),Array(values)
    client.call(:eval,@lua_src[name],kk.size,*(kk+vv))
  end

end