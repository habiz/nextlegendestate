class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @properties = @user.properties.paginate(page: params[:page])
    #debugger
  end
  def new
    @user = User.new
  end
  #handles login error on the user path
  def create
    @user = User.new(user_params)
    if @user.save
      #handles successful reg
      log_in @user
      flash[:success] = 'Welcome to NextLegend Real Estate Company'
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:fname, :mail, :password, :password_confirmation)
  end

  #before_filters
  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
  flash[:danger] = "Please log in."
  redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user(@user)
  end

end
