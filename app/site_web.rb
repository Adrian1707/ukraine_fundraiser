require 'sinatra'


class SiteApp < Sinatra::Base
  # set :root, File.dirname(__FILE__)
  # set :static, true
  # set :public_folder, Proc.new { File.join(root, "static") }


  get "/" do
     send_file File.join(settings.public_folder, 'index.html')
  end

end
