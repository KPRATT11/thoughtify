require 'sinatra/base'
$testing = true

def logged_in?
    if session[:user_id]
        return true
    else
        return false
    end
end

def current_user_id
    return 1 if $testing
    return session[:user_id]
end

def is_current_user?(id)
    return true if $testing
    return session[:user_id] == id.to_i
end