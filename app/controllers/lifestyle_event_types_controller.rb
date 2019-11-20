class LifestyleEventTypesController < ApplicationController
  def index
    @lifestyle_event_types = LifestyleEventType.all
  end

  def new
    @lifestyle_event_type = LifestyleEventType.new
  end

  def create
    @lifestyle_event_type = LifestyleEventType.new(lifestyle_event_type_params)
    if @lifestyle_event_type.save
      flash[:sucess] = "The lifestyle event type has been created"
      redirect_to lifestyle_event_types_path
    else
      flash.now[:danger] = "The lifestyle event type has not been created"
      render :new
    end
  end

  def show
    @lifestyle_event_type = LifestyleEventType.find(params[:id])
  end

  protected
    def resource_not_found
      message = "The lifestyle event type you are looking for could not be found"
      flash[:alert] = message
      redirect_to root_path
    end


  private

    def lifestyle_event_type_params
      params.require(:lifestyle_event_type).permit(:title)
    end
end
