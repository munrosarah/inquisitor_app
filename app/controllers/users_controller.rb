class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show, :edit, :update]
  
  # Show an individual user's page
  def show
    @user = User.find(params[:id])
  end

  # Make a new user
  def new
    @user = User.new
  end
  
  # Create a new user
  def create
    
    # Generate a new user based on input
    @user = User.new(params[:user])
    
    # If the input is good, save, login, and redirect to the user's page
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Inquisitor App"
      redirect_to @user
    
    # If the input is bad, re-render the new page
    else
      render 'new'
    end
  end
  
  # Generate an index of all the users
  def index
    @users = User.paginate(page: params[:page])
  end
  
  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end

