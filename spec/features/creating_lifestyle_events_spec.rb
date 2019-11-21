require "rails_helper"

RSpec.feature "Creating Lifestyle Events" do
  scenario "A user creates a new lifestyle event" do
    visit "/"
    click_link "New Lifestyle Event"
    fill_in "Description", with: "This is my birthday"
    click_button "Create Lifestyle Event"

    expect(page).to have_content("The lifestyle event has been created")
    expect(page.current_path).to eq(lifestyle_events_path)
  end

  scenario "A user fails to create a new lifestyle event" do
    visit "/"
    click_link "New Lifestyle Event"
    fill_in "Description", with: ""
    click_button "Create Lifestyle Event"

    expect(page).to have_content("The lifestyle event has not been created")
    expect(page).to have_content("Description can't be blank")
  end
end
