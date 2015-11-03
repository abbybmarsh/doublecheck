class UsersController < ApplicationController
  
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  
  def index
    @users = User.all
  end
  
  def new
    @client = Client.find(params[:client_id])
    @user = User.new
  end
  
  def create
    @client = Client.find(params[:client_id])
    @user = @client.users.create(user_params)
    redirect_to client_path(@client)
  end
    
  def destroy
    @client = Client.find(params[:client_id])
    @user = @client.users.find(params[:id])
    @user.destroy
    redirect_to client_path(@client)
  end
 
  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
