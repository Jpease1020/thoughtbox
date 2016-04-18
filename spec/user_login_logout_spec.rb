require 'rails_helper'

describe "a user logs in logs out", type: :feature do
  describe "the user who has an account logs in" do
    before(:each) do
      visit root_path
      click_on "Sign Up"
      expect(current_path).to eq("/users/new")

      fill_in "Email", with: "email@email.com"
      fill_in "Password", with: "password"
      fill_in "Confirm password", with: "password"
      click_on "Create"
      click_link("logout")
    end

    it "logs in the new user properly with valid info submitted" do
      click_link("login")
      fill_in("Email", with: "email@email.com")
      fill_in("Password", with: "password")
      fill_in "Confirm password", with: "password"
      click_button "Login"
      expect(current_path).to eq(dashboard_path)
    end
  end

  describe "the registered user can't log in with invalid info" do
    before(:each) do
      visit root_path
      click_on "Sign Up"
      expect(current_path).to eq("/users/new")

      fill_in "Email", with: "email@email.com"
      fill_in "Password", with: "password"
      fill_in "Confirm password", with: "password"
      click_on "Create"
      click_link("logout")
    end

    it "won't allow user to log in with invalid password" do
      visit root_path
      click_link("login")
      fill_in "Email", with: "email@email.com"
      fill_in "Password", with: "pass"
      fill_in "Confirm password", with: "pass"
      click_link "login"
      expect(current_path).to eq("/login")
      expect(page).to have_content("Welcome to the Thoughtbox Sign Up login Log In Email address Password")
    end
  end

end
