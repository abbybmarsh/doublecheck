class ClientsController < ApplicationController
  
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  
  def index
    @clients = Client.all
  end
  
  def show
    @client = Client.find(params[:id])
  end
  
  def new
    @client = Client.new
  end
  
  def edit
    @client = Client.find(params[:id])
  end
  
  def create
    @client = Client.new(client_params)
 
    if @client.save
      redirect_to @client
    else
      render 'new'
    end
  end
  
  def update
    @client = Client.find(params[:id])
 
    if @client.update(client_params)
      redirect_to @client
    else
      render 'edit'
    end
  end
  
  def destroy
    @client = Client.find(params[:id])
    @client.destroy
 
    redirect_to clients_path
  end
  
  def upload
    uploaded_io = params[:client][:attachment]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
    file.write(uploaded_io.read)
    end
  end
 
  private
    def client_params
      params.require(:client).permit(:name, :logo, :attachment)
    end
end
