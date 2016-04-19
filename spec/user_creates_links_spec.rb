require "rails_helper"

RSpec.describe "User adds a new link", type: :feature do
  scenario "link is created, and added to the database and is displayed on the page" do
    visit root_path
    click_link("login")
    fill_in("Email", with: "email@email.com")
    fill_in("Password", with: "password")
    fill_in "Confirm password", with: "password"
    click_button "Login"

    visit links_path
    fill_in "Title", with: "My new link title"
    fill_in "Url", with: "https://thing.com"
    click_on "Create Link"

    expect(Link.count).to eq(1)
  end
end
