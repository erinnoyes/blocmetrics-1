class RegisteredApplicationsController < ApplicationController
  before_action :set_registered_application, only: [:show, :edit, :delete, :destroy, :update]

  def index
    @registered_applications = RegisteredApplication.all
  end

  def show

  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new(registered_application_params)

    if @registered_application.save
      flash[:notice] = "Your application was saved."
      redirect_to action: "index"
    else
      flash.now[:alert] = "Your application could not be saved."
      render :new
    end
  end

  def edit

  end

  def update

  end

  def delete

  end

  def destroy

    if @registered_application.destroy
      flash[:notice] = "#{@registered_application.name} was deleted."
      redirect_to action: "index"
    else
      flash.now[:alert] = "Error - this application could not be deleted."
      render :show
    end

  end

  private

  def set_registered_application
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end

end