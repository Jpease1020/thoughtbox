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

    xit "won't allow user to log in with invalid password" do
      click_link("login")
      fill_in "Email", with: "email@email.com"
      fill_in "Password", with: "pass"
      fill_in "Confirm password", with: "pass"
      click_button "login"
      expect(current_path).to eq("/login")
      expect(page).to have_content("Invalid Login")
    end

    xit "won't allow user to log in with invalid email" do
      click_link("Login")
      fill_in("Email", with: "Jgmailcom")
      fill_in("Password", with: "pass")
      click_button "Login"
      expect(current_path).to eq("/login")
      expect(page).to have_content("Invalid Login")
    end
  end

  describe "the user does not have an account" do
    xit "won't allow user to log in" do
      visit "/login"
      fill_in("Email", with: "J@gmail.com")
      fill_in("Password", with: "wrongpassword")
      click_button "Login"
      expect(current_path).to eq("/login")
      expect(page).to have_content("Invalid Login")
    end
  end

end
