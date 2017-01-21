class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(:page => params[:page], :per_page => 1)

   # @users_selected  = User.where(:is_checked => false).all
  end

  def users_with_condition
    @users_selected  = User.where(:is_checked => false).all
    # User.where.not(:is_checked => true).all
    # binding.pry
    render :layout => false 
  end

  def filter_users
  end
  def filter_users_condition
    # binding.pry
    if params[:is_checked] == "Users created with checkbox"
     @users_selected  = User.where(:is_checked => true).all
     # binding.pry
     # render :layout => false
   else
    @users_selected = User.where(:is_checked => false).all
    # binding.pry
    # render :layout => false
   end
   render :layout => false
  end
  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.role_id.blank?
      @user.is_checked = true
      @user.role_id = params[:role_id]
    end
    respond_to do |format|
      if @user.is_checked != true
        @user.is_checked = false
      end
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :role_id)
    end
end
