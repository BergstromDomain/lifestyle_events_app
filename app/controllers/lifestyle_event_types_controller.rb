class LifestyleEventTypesController < ApplicationController
  before_action :set_lifestyle_event_type, only: [:show, :edit, :update, :destroy]

  def index
    @lifestyle_event_types = LifestyleEventType.all
  end

  def new
    @lifestyle_event_type = LifestyleEventType.new
    @submit_text = "Create Lifestyle Event Type"
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
  end

  def edit
    @submit_text = "Update Lifestyle Event Type"
  end

  def update
    if @lifestyle_event_type.update(lifestyle_event_type_params)
      flash[:sucess] = "The lifestyle event type has been updated"
      redirect_to @lifestyle_event_type
    else
      flash.now[:danger] = "The lifestyle event type has not been updated"
      render :edit
    end
  end

  def destroy
    if @lifestyle_event_type.destroy
      flash[:sucess] = "The lifestyle event type has been deleted"
      redirect_to lifestyle_event_types_path
    end
  end

  protected

    def resource_not_found
      message = "The lifestyle event type you are looking for could not be found"
      flash[:alert] = message
      redirect_to root_path
    end


  private

    def set_lifestyle_event_type
      @lifestyle_event_type = LifestyleEventType.find(params[:id])
    end

    def lifestyle_event_type_params
      params.require(:lifestyle_event_type).permit(:title)
    end
end
