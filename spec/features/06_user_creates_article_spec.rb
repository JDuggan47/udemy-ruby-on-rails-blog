require "rails_helper"

feature "user gets new article form and creates article" do
  let!(:article) { FactoryBot.create(:article) }
  let!(:user) { FactoryBot.create(:user) }
  let!(:admin) { FactoryBot.create(:admin) }

  scenario "creates category succesfully" do
    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log In"

    visit new_article_path

    fill_in "Title", with: article.title
    fill_in "Description", with: article.description
    click_on "Create Article"

    expect(page).to have_content "Article was succesfully created!"
  end

  scenario "user fills out the article form incorrectly" do
    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log In"

    visit new_article_path

    fill_in "Title", with: article.title
    fill_in "Description", with: " "
    click_on "Create Article"

    expect(page).to have_content "Description can't be blank"
  end

  scenario "user must be logged in to create a new article" do
    visit new_article_path

    expect(page).to have_content "You must be logged in to perform that action"
  end
end
