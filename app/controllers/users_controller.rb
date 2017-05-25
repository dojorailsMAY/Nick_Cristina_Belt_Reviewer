class UsersController < ApplicationController

  skip_before_action :require_login, except: [:logout, :edit, :update]

  def new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:current_user_id]= @user.id
      redirect_to "/events"
    else
      flash[:errors]= @user.errors.full_messages
      redirect_to '/users'
    end
  end

  def login
    @user = User.find_by_email(params[:email])

    if @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to '/events'
    else
      flash[:errors] = ["Invalid email or password"]
      redirect_to '/users'
    end

  end

  def logout
    session.clear
    redirect_to '/users'
  end

  def edit
  end

  def update
    @user = current_user
    @user.update(user_params)
    @user.save
      redirect_to "/users/#{@user.id}"
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
    end
end
