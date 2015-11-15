class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  
  def index
    @users = User.all
  end

  def new
    @user = User.new 
  end

  def show
    @labels = @user.labels
    @albums = @user.albums
    @artists = @user.artists
  end

  def create
    @users = User.all
    @user = User.new(user_params)
    if @user.save
      render "index"
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid" 
      return
    else
      render "new" and return
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:fname, :lname, :username, :email, :encrypted_password, :password, :password_confirmation, :salt, :user_id, :artist_id, :album_id, :label_id)
    end
end
