require 'sinatra'
require 'pony'
require 'stripe'
require "bundler/setup"

set :publishable_key, ENV['PUBLISHABLE_KEY']
set :secret_key, ENV['SECRET_KEY']
Stripe.api_key = settings.secret_key


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

  post '/charge' do
    @amount = 500
    customer = Stripe::Customer.create(
      :email => params[:email],
      :card => params[:stripeToken]
    )

    charge = Stripe.Charge.create(
      :amount => params[:amount],
      :description => 'Sinatra Charge',
      :currency => 'gbp',
      :customer => customer.id
    )
    erb :charge
  end

end
