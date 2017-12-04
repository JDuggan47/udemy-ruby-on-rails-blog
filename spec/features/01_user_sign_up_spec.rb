require "rails_helper"

feature "User signs up" do
  scenario "user signs up succesfully" do
    visit signup_path

    fill_in "Username", with: "eddie123"
    fill_in "Email", with: "eddie@example.com"
    fill_in "Password", with: "password"
    click_on "Sign Up"

    expect(page).to have_content "Welcome to the Alpha Blog eddie123!"
  end

  scenario "user signs up wiht invalid info" do
    visit signup_path

    fill_in "Email", with: "example@example.com"
    click_on "Sign Up"

    expect(page).to have_content "Password can't be blank"
  end
end
