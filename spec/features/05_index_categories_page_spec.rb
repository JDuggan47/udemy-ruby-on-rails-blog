require 'rails_helper'

feature "index page has a link to the categories show page" do
  let!(:category) { FactoryBot.create(:category, name: "art") }
  let!(:category2) { FactoryBot.create(:category, name: "programming") }

  scenario "should show categories listed with a link to it" do
    visit categories_path

    expect(page).to have_link("#{category.name}", href: category_path(category))
    expect(page).to have_link("#{category2.name}", href: category_path(category2))
  end
end
