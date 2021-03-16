require_relative 'config/environment'

class App < Sinatra::Base

    get '/' do
        erb :index
    end

    configure do
        enable :sessions
        set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64)}
    end

    post '/checkout' do
        item=params[:item]
        session[:item]=item
        @session = session
    end
     

end