class Users::RegistrationsController < Devise::RegistrationsController

  include Tokenable

  def index
    if params[:approved] == "false"
      @users = User.find_all_by_approved(false)
    else
      @users = User.all
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if resource.save
       format.json { render json: @user, status: :created, location: @user }
      else
       format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password )
  end

end
