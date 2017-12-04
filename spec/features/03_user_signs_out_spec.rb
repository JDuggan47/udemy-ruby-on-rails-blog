require "rails_helper"

feature "User signs out" do
  scenario "user signs up successfully" do
    user = FactoryBot.create(:user)

    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log In"
    click_on "Log Out"

    expect(page).to have_content "You have logged out"
  end
end
