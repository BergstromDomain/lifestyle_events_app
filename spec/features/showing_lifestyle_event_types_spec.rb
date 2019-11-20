require "rails_helper"

RSpec.feature "Listing Lifestyle Event Types" do
  before do
    @lifestyle_event_type1 = LifestyleEventType.create(title: "Birthday")
    @lifestyle_event_type2 = LifestyleEventType.create(title: "Wedding")
  end

  scenario "A user shows a lifestyle event type" do
    visit "/"
    click_link @lifestyle_event_type1.title

    expect(page).to have_content(@lifestyle_event_type1.title)
    expect(current_path).to eq(lifestyle_event_type_path(@lifestyle_event_type1))
  end
end
