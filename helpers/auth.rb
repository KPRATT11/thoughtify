require 'sinatra/base'

def logged_in?
    if session[:user_id]
        return true
    else
        return false
    end
end

def current_user_id
    return session[:user_id]
end

def is_current_user(id)
    return session[:user_id] == id.to_i
end