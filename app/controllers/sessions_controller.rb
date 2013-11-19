class SessionsController < ApplicationController


def new
end

def create
 user = User.find_by(username: params[:username])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    flash[:notice] = "You've logged in succesfully!"
    redirect_to root_path
  else
    flash[:error] = "There's something wrong with either your username or your password"
    redirect_to register_path
  end

end

def destroy
  session[:user_id] = nil
  flash[:notice] = "You have logged out successfully!"
  redirect_to root_path
end


end