require "rails_helper"

feature "get new category form and creates category" do
  let!(:category) { FactoryBot.create(:category, name: "movies") }

  scenario "creates category succesfully" do
    visit  new_category_path

    fill_in "Name", with: "Music"
    click_on "Create Category"

    expect(page).to have_content "Category was succesfully created!"
  end

  scenario "invalid category submission results in failure" do
    visit  new_category_path

    fill_in "Name", with: category.name
    click_on "Create Category"

    expect(page).to have_content "Name has already been taken"
  end




end
