class LifestyleEventsController < ApplicationController
  before_action :set_lifestyle_event, only: [:show, :edit, :update, :destroy]

  def index
    @lifestyle_events = LifestyleEvent.all
  end

  def new
    @lifestyle_event = LifestyleEvent.new
    @submit_text = "Create Lifestyle Event"
  end

  def create
    @lifestyle_event = LifestyleEvent.new(lifestyle_event_params)
    if @lifestyle_event.save
      flash[:sucess] = "The lifestyle event has been created"
      redirect_to lifestyle_events_path
    else
      flash.now[:danger] = "The lifestyle event has not been created"
      render :new
    end
  end

  def show
  end

  def edit
    @submit_text = "Update Lifestyle Event"
  end

  def update
    if @lifestyle_event.update(lifestyle_event_params)
      flash[:sucess] = "The lifestyle event has been updated"
      redirect_to @lifestyle_event
    else
      flash.now[:danger] = "The lifestyle event has not been updated"
      render :edit
    end
  end

  def destroy
    if @lifestyle_event.destroy
      flash[:sucess] = "The lifestyle event has been deleted"
      redirect_to lifestyle_events_path
    end
  end

  protected

  def resource_not_found
    message = "The lifestyle event you are looking for could not be found"
    flash[:alert] = message
    redirect_to root_path
  end

  private

  def set_lifestyle_event
    @lifestyle_event = LifestyleEvent.find(params[:id])
  end
  
  def lifestyle_event_params
    params.require(:lifestyle_event).permit(:description, :date)
  end
end
