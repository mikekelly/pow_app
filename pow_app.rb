require 'sinatra/base'
require 'pathname'

class PowApp < Sinatra::Base
  get('/') do
    @apps = Pathname.new(ENV['HOME'] + '/.pow').children.select { |c| c.directory? }
    erb :index
  end
end
