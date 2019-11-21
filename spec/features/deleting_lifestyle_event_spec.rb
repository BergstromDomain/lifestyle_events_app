require "rails_helper"

RSpec.feature "Deleting a Lifestyle Event" do
  before do
    @lifestyle_event = LifestyleEvent.create(description: "My Graduation")
  end

  scenario "A user deletes a lifestyle event" do
    visit "/"
    click_link @lifestyle_event.description
    click_link "Delete Lifestyle Event"
    expect(page).to have_content("The lifestyle event has been deleted")
    expect(page.current_path).to eq(lifestyle_events_path)
  end
end
