require 'rails_helper'

RSpec.describe "User login" do
  context "as an unregistered user" do
    it "I can create an account and be logged in" do
      visit root_path

      click_link_or_button "Create Account"
      fill_in "First name", with: "Michelle"
      fill_in "Last name", with: "Golle"
      fill_in "Username", with: "mg"
      fill_in "Email", with: "michelle@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Create User"

      expect(page).to have_content("mg")
    end
  end

  context "as a registered user" do
    xit  "I can log in" do
      user = User.create(username: "mg", email: "michelle@gmail.com", password: "password", password_confirmation: "password")

      visit root_path

      click_link_or_button "Log In"
      fill_in "Email", with: "michelle@gmail.com"
      fill_in "Password", with: "password"
      click_link_or_button "Submit"

      expect(page).to have_content("mg")
    end
  end

  context "as an unregistered user" do
    it "I cannot log in without creating account" do
      visit root_path

      click_link_or_button "Log In"
      fill_in "Email", with: "joe@example.com"
      fill_in "Password", with: "password"
      click_link_or_button "Submit"

      expect(page).to have_content("Invalid login")

    end
  end
end
