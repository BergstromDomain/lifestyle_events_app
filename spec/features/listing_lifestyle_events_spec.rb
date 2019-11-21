require "rails_helper"

RSpec.feature "Listing Lifestyle Event" do
  before do
    @lifestyle_event1 = LifestyleEvent.create(description: "My Birthday")
    @lifestyle_event2 = LifestyleEvent.create(description: "My Wedding")
  end

  scenario "A user lists all lifestyle events" do
    visit "/"

    expect(page).to have_content(@lifestyle_event1.description)
    expect(page).to have_link(@lifestyle_event1.description)

    expect(page).to have_content(@lifestyle_event2.description)
    expect(page).to have_link(@lifestyle_event2.description)
  end

  scenario "A user has no lifestyle events" do
    LifestyleEvent.delete_all

    visit "/"

    expect(page).not_to have_content(@lifestyle_event1.description)
    expect(page).not_to have_link(@lifestyle_event1.description)

    expect(page).not_to have_content(@lifestyle_event2.description)
    expect(page).not_to have_link(@lifestyle_event2.description)

    within("h1#no-lifestyle-events") do
      expect(page).to have_content("No lifestyle events have been created")
    end
  end

end
