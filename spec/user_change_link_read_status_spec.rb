require "rails_helper"

RSpec.describe "User changes link read status", type: :feature do
  scenario "unread link" do
    it "changes chnages status to read when read button is clicked" do
      visit root_path
      click_link("login")
      fill_in("Email", with: "email@email.com")
      fill_in("Password", with: "password")
      fill_in "Confirm password", with: "password"
      click_button "Login"

      link = Link.create(title: "a titel", url: "http://url.com")
      visit links_path

      click_on "Mark as Read"

      expect(link.read).to eq('true')
  end
end
