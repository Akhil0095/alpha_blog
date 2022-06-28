class SessionsController < ApplicationController

def new

end

def create
	
	user = User.find_by(email: params["sessions"]["username"].downcase)
	if user && user.authenticate(params["sessions"]["password"])
		session[:user_id] = user.id
		flash[:success] = "You have Successfully logged in"
		redirect_to user_path(user)

	else
		flash.now[:danger] = "There is something wrong with your login information"
		render 'new'
	end
end

def destroy
	session[:user_id] = nil
	flash[:success] = "You have successfully Logged Out"
	redirect_to root_path
end
end