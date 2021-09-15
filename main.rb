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
get "/create-thought" do
    erb(:create_thought)
end

get "/edit-thought/:id" do
    erb(:edit_thought)
end

get "/:page" do
    all_thoughts = Thought.get_all_thoughts_and_votes(params[:page].to_i)
    erb(:index, locals: {
        thoughts: all_thoughts
    })
end

get "/thought/:id" do
    comments = Comment.get_some_comments_by_thought(params[:id])
    thought = Thought.get_single_thought_by_id(params[:id])
    erb(:thought, locals: {comments: comments, thought: thought})
end

get "/following-thoughts/:id" do
    "display thoughts of following"
end

post "/thought" do
    title = params[:title]
    content = params[:content]

    if title.length > 0 and content.length > 0
        Thought.post_thought(current_user_id, title, content)
        redirect "/"
    end
    redirect back
end

delete "/thought/:id" do
    redirect back unless logged_in?
    Thought.delete_thought_by_id(params[:id])
    redirect "/"
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
    redirect back unless logged_in?
    p "working"
    Vote.delete_votes_on_target_by_user_id(current_user_id, params[:target_id], params[:target])
    Vote.post_vote_for_target(current_user_id, params[:type], params[:target_id], params[:target])
    redirect back
end

delete "/vote/:target_id" do
    redirect back unless logged_in?
    Vote.delete_votes_on_target_by_user_id(current_user_id, params[:target_id], params[:target])
    redirect back
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
