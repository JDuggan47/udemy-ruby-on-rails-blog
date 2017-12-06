require "rails_helper"

feature "get new category form and creates category" do
  let!(:category) { FactoryBot.create(:category, name: "movies") }
  let!(:user) { FactoryBot.create(:user) }
  let!(:admin) { FactoryBot.create(:admin) }

  scenario "creates category succesfully" do
    visit login_path

    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_on "Log In"

    visit new_category_path

    fill_in "Name", with: "Music"
    click_on "Create Category"

    expect(page).to have_content "Category was succesfully created!"
  end

  scenario "invalid category submission results in failure" do
    visit login_path

    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_on "Log In"

    visit new_category_path

    fill_in "Name", with: category.name
    click_on "Create Category"

    expect(page).to have_content "Name has already been taken"
  end

  scenario "should redirect create when admin not logged in" do
    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log In"

    visit new_category_path

    expect(page).to have_content "Only Admins Can Perform That Action"
  end
end
