require "rails_helper"

RSpec.feature "Editing a Lifestyle Event Type" do
  before do
    @lifestyle_event_type = LifestyleEventType.create(title: "Graduation")
  end

  scenario "A user updates a lifestyle event type" do
    visit "/"
    click_link @lifestyle_event_type.title
    click_link "Edit Lifestyle Event Type"
    fill_in "Title", with: "Updated Graduation"
    click_button "Update Lifestyle Event Type"
    expect(page).to have_content("The lifestyle event type has been updated")
    expect(page.current_path).to eq(lifestyle_event_type_path(@lifestyle_event_type))
  end

  scenario "A user fails to update a lifestyle event type" do
    visit "/"
    click_link @lifestyle_event_type.title
    click_link "Edit Lifestyle Event Type"
    fill_in "Title", with: ""
    click_button "Update Lifestyle Event Type"
    expect(page).to have_content("The lifestyle event type has not been updated")
    expect(page.current_path).to eq(lifestyle_event_type_path(@lifestyle_event_type))
  end
end
