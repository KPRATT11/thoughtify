require 'sinatra'           
require 'sinatra/reloader'
require_relative 'models/user.rb'
require_relative 'helpers/auth.rb'


#CONSTANTS
RD_POST = 307

#Include Model Modules
include User


enable :sessions

#Pages
get "/" do
    if logged_in?
        'yes'
    else
        'no'
    end
end

get "/login" do
    erb(:user_test)
end

# Handle Sessions

post "/session" do
    if !logged_in?
        user = User.validate_user(params[:email], params[:password])
        if user
            session[:user_id] = user["id"]
            redirect "/"
        else
            redirect "/login"
        end
    end
    redirect "/"
end

delete "/session" do
    session[:user_id] = nil
    redirect "/"
end


# Handle Users
get "/user" do
    "display User"
end

post "/user" do
    User.post_user(params[:name], params[:email], params[:password])
    redirect "/session", RD_POST
end

delete "/user" do
    if logged_in?()
        User.delete_user(current_user_id())
        session[:user_id] = nil
    end
    redirect "/"
end
