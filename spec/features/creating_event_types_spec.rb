require "rails_helper"

RSpec.feature "Creating Lifestyle Event Types" do
  scenario "A user creates a new lifestyle event type" do
    visit "/"

    click_link "New Lifestyle Event Type"

    fill_in "Title", with: "Birthday"
    click_button "Create Lifestyle Event Type"

    expect(page).to have_content("The lifestyle event type has been created")
    expect(page.current_path).to eq(lifestyle_event_types_path)
  end
end
