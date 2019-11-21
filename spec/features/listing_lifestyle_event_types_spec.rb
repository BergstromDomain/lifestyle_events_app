require "rails_helper"

RSpec.feature "Listing Lifestyle Event Types" do
  before do
    @lifestyle_event_type1 = LifestyleEventType.create(title: "Birthday")
    @lifestyle_event_type2 = LifestyleEventType.create(title: "Wedding")
  end

  scenario "A user lists all lifestyle event types" do
    visit "/"

    expect(page).to have_content(@lifestyle_event_type1.title)
    expect(page).to have_link(@lifestyle_event_type1.title)

    expect(page).to have_content(@lifestyle_event_type2.title)
    expect(page).to have_link(@lifestyle_event_type2.title)
  end

  scenario "A user has no lifestyle event types" do
    LifestyleEventType.delete_all

    visit "/"

    expect(page).not_to have_content(@lifestyle_event_type1.title)
    expect(page).not_to have_link(@lifestyle_event_type1.title)

    expect(page).not_to have_content(@lifestyle_event_type2.title)
    expect(page).not_to have_link(@lifestyle_event_type2.title)

    within("h1#no-lifestyle-event-types") do
      expect(page).to have_content("No lifestyle event types have been created")
    end
  end

end
