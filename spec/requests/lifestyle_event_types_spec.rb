require 'rails_helper'

RSpec.describe "Lifestyle Event Types", type: :request do

  before do
    @lifestyle_event_type = LifestyleEventType.create(title: "Birthday")
  end

  describe 'GET /lifestyle_event_types/:id' do
    context 'with existing lifestyle event type' do
      before { get "/lifestyle_event_types/#{@lifestyle_event_type.id}" }

      it "handles existing lifestyle event type" do
        expect(response.status).to eq 200
      end
    end

    context 'with non-existing lifestyle event type' do
      before { get "/lifestyle_event_types/xxxxx" }

      it "handles non-existing lifestyle event type" do
        expect(response.status).to eq 302
        flash_message = "The lifestyle event type you are looking for could not be found"
        expect(flash[:alert]).to eq flash_message
      end
    end
  end
end
