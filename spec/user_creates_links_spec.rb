require "rails_helper"

RSpec.describe "User adds a new link", type: :feature do
  scenario "link is created, and added to the database and is displayed on the page", js: true do
    visit links_path

    fill_in "new-link-title", with: "My new link title"
    fill_in "new-link-url", with: ""
    click_on "Create Link"

    expect(Link.count).to eq(1)
  end
end
