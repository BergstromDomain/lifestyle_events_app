require "rails_helper"

RSpec.feature "Showing Lifestyle Events" do
  before do
    @lifestyle_event1 = LifestyleEvent.create(description: "My Birthday")
    @lifestyle_event2 = LifestyleEvent.create(description: "My Wedding")
  end

  scenario "A user shows a lifestyle event" do
    visit "/"
    click_link @lifestyle_event1.description

    expect(page).to have_content(@lifestyle_event1.description)
    expect(current_path).to eq(lifestyle_event_path(@lifestyle_event1))
  end
end
