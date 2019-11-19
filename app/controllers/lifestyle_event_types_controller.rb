class LifestyleEventTypesController < ApplicationController
  def index
  end

  def new
    @lifestyle_event_type = LifestyleEventType.new
  end

  def create
    @lifestyle_event_type = LifestyleEventType.new(lifestyle_event_type_params)
    @lifestyle_event_type.save
    flash[:sucess] = "The lifestyle event type has been created"
    redirect_to lifestyle_event_types_path
  end

  private

    def lifestyle_event_type_params
      params.require(:lifestyle_event_type).permit(:title)
    end

end
