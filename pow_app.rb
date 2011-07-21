require 'sinatra/base'
require 'pathname'

class PowApp < Sinatra::Base
  get('/') do
    @apps = Pathname.new(ENV['HOME'] + '/.pow').children.select { |c| c.directory? }
    @default = nil
    begin
      default_path = Pathname.new(File.expand_path("~/.pow/default"))
      if File.exist?(default_path) && default_path.ftype == "link"
        @default = default_path.readlink.basename
      end
    rescue #Rescue because readlink and friends might not be available on the system.
    end
    erb :index
  end
end
