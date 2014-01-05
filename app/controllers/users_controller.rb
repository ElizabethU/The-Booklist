class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User info was successfully updated'}
      else
        format.html { render action: 'edit'}
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to users_url}
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created'}
        format.json { render action: 'show', status: :created, location: @user }
        session[:user_id] = @user.id
        @wishlist = Bookcase.new(name: "Wishlist", user_id: @user.id)
        @completed = Bookcase.new(name: "Completed Books", user_id: @user.id)
        @wishlist.save
        @completed.save
      else
        format.html { render action: 'new'}
      end
    end
  end

  def show
  end

  def index
    @users = User.all
  end

  def search
    @users = User.search(params[:search])
    if @users.empty?
      flash[:notice] = "Sorry, no people with a name or email matching #{params[:search]}"
    else
      flash[:notice] = "Here are people with names or emails matching #{params[:search]}."
    end
    render :index   
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
