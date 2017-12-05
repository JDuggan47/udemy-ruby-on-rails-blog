require "rails_helper"

feature "User signs in" do
  scenario "user signs in succesfully" do
    user = FactoryBot.build(:user)

    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log In"

    expect(page).to have_content "You have successly logged in!"
  end

  scenario "user signs in with invalid info" do
    user = FactoryBot.build(:user)
    visit login_path

    fill_in "Email", with: user.email
    click_on "Log In"

    expect(page).to have_content "There was something wrong with your login information"
  end
end
