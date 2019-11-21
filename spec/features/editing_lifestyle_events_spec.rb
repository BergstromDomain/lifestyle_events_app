require "rails_helper"

RSpec.feature "Editing a Lifestyle Event" do
  before do
    @lifestyle_event = LifestyleEvent.create(description: "My Graduation")
  end

  scenario "A user updates a lifestyle event" do
    visit "/"
    click_link @lifestyle_event.description
    click_link "Edit Lifestyle Event"
    fill_in "Description", with: "My Updated Graduation"
    click_button "Update Lifestyle Event"
    expect(page).to have_content("The lifestyle event has been updated")
    expect(page.current_path).to eq(lifestyle_event_path(@lifestyle_event))
  end

  scenario "A user fails to update a lifestyle event" do
    visit "/"
    click_link @lifestyle_event.description
    click_link "Edit Lifestyle Event"
    fill_in "Description", with: ""
    click_button "Update Lifestyle Event"
    expect(page).to have_content("The lifestyle event has not been updated")
    expect(page.current_path).to eq(lifestyle_event_path(@lifestyle_event))
  end
end
