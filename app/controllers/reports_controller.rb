class ReportsController < ApplicationController
  
  # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  def index
    @reports = Report.all
  end
  
  def new
    @client = Client.find(params[:client_id])
    @report = Report.new
  end
  
  def create
    @client = Client.find(params[:client_id])
    @report = @client.reports.create(report_params)
    redirect_to client_path(@client)
  end
    
  def destroy
    @client = Client.find(params[:client_id])
    @report = @client.reports.find(params[:id])
    @report.destroy
    redirect_to client_path(@client)
  end
 
  private
    def report_params
      params.require(:report).permit(:commenter, :body)
    end
end
