class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def index
    @users = User.paginate(page: params[:page])
    @User = User.to_s.downcase
  end

  def show
    @recipient = User.find_by_email("wachiraevanson@gmail.com")
    #@user.send_message(@recipient, "Just testing gem mailboxer", "gem test")
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "#{@user.firstname} was successfully created." }
        format.json { render action: 'show', status: :created, location: @user }
        #UserMailer.user_email(@user).deliver
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "#{@user.type} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :destroy, @user
    @user.destroy
    respond_to do |format|
      #format.html { redirect_to eval("#{@user.to_s.downcase}s_url") }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:type, :firstname, :lastname, :email, :password, :password_confirmation, :status)
    end
end
