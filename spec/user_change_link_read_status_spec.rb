require "rails_helper"

RSpec.describe "User changes link read status", type: :feature do
  scenario "unread link changes status to read when read button is clicked", js: true do
    visit root_path
    click_link("login")
    fill_in("Email", with: "email@email.com")
    fill_in("Password", with: "password")
    fill_in "Confirm password", with: "password"
    click_button "Login"

    link = Link.create(title: "a title", url: "http://url.com")
    visit links_path

    click_on ("Mark as Read/Unread")
    visit links_path
    expect(page).to have_content('true')
  end
end
