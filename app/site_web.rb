require 'sinatra'
require "bundler/setup"






class SiteApp < Sinatra::Base

  get "/" do
      erb :index
  end

end
