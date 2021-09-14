require 'sinatra'           
require 'sinatra/reloader'
require_relative 'models/thought.rb'
require_relative 'models/comment.rb'
require_relative 'models/follower.rb'
require_relative 'models/topic.rb'
require_relative 'models/user.rb'
require_relative 'models/vote.rb'
require_relative 'helpers/auth.rb'


#CONSTANTS
RD_POST = 307

#Include Model Modules
include User


enable :sessions

get "/" do
    redirect "/0"
end

# Thoughts
get "/:page" do
    all_thoughts = Thought.get_all_thoughts_and_votes(params[:page].to_i)
    erb(:index, locals: {
        thoughts: all_thoughts
    })
end

get "/thought/:id" do
    "display single thought and comments"
end

get "/following-thoughts/:id" do
    "display thoughts of following"
end

post "/thought/:id" do
    "create a thought"
end

delete "/thought/:id" do
    "delete a thought"
end

put "/thought/:id" do
    "update a thought"
end

# Comments -- there shouldnt be a need to display comments on there own
post "/comment/:id" do
    "add comment to post and redirect back to post"
end

delete "/comment/:id" do
    "delete a comment and redirect back to post"
end

put "/comment/:id" do
    "update a comment and redirect back to post"
end

# vote 
post "/vote/:type/:target_id" do
    "vote on target and return to page of target - probs just redirect back"
end

delete "/vote/:type/:target_id" do
    "delete vote and return to page of target"
end

# Following
post "/follow/:target_id" do
    "follow new user based on target id, get user id from current logged on"
end

delete "/follow/:target_id" do
    "delete follow based on target id"
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
get "/login" do
    erb(:user_test)
end

get "/users" do
    "display Users"
end

post "/user" do
    User.post_user(params[:name], params[:email], params[:password])
    redirect "/session", RD_POST
end

put "/user/:id" do
    "update user"
end

delete "/user" do
    if logged_in?()
        User.delete_user(current_user_id())
        session[:user_id] = nil
    end
    redirect "/"
end

get "/user/:id" do
    "display user profile"
end

get "/user/:id/following" do
    "display following for user"
end

get "/user/:id/followers" do
    "display followers"
end
