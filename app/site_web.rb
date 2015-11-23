require 'sinatra'
require 'pony'


class SiteApp < Sinatra::Base

  get "/" do
      erb :index
  end

  post '/' do
        name = params[:name]
        mail = params[:mail]
        subject = params[:subject]
        body = params[:body]
        Pony.mail(:to => 'Adrian.booth17@gmail.com', :from => "#{mail}", :subject => "#{subject}", :body => "#{body}")
        erb :index
  end

end
