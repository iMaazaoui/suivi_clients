class UsersController < ApplicationController

	before_action :confirm_logged_in
	
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		    # Instantiate a new object using form parameters
    @user = User.new(user_params)
    # Save the object
    if @user.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "User created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
	end

	def edit
	end

	def update
	end

	def delete
	end

	def destroy
	end

	private

	def user_params
	  # same as using "params[:subject]", except that it:
	  # - raises an error if :subject is not present
	  # - allows listed attributes to be mass-assigned
	  params.require(:user).permit(:nom, :prenom, :email, :password)
	end

end
