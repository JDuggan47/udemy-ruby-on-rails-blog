require 'rails_helper'

feature "index page has a link to the categories show page" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category, name: "art") }
  let!(:category2) { FactoryBot.create(:category, name: "programming") }

  scenario "should show categories listed with a link to it" do
    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log In"

    visit categories_path

    expect(page).to have_link("#{category.name}", href: category_path(category))
    expect(page).to have_link("#{category2.name}", href: category_path(category2))
  end
end
