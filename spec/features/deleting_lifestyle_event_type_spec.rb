require "rails_helper"

RSpec.feature "Deleting a Lifestyle Event Type" do
  before do
    @lifestyle_event_type = LifestyleEventType.create(title: "Graduation")
  end

  scenario "A user deletes a lifestyle event type" do
    visit "/"
    click_link @lifestyle_event_type.title
    click_link "Delete Lifestyle Event Type"
    expect(page).to have_content("The lifestyle event type has been deleted")
    expect(page.current_path).to eq(lifestyle_event_types_path)
  end
end
