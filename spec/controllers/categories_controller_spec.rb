require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  let!(:category) { FactoryBot.create(:category, name: "movies") }

  describe "GET#index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'GET#new' do
    it "shows the page where you can create new category" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe 'GET#show' do
    it 'shows the show page of the requested category' do
      get :show, params: { id: category.id }
      expect(response.status).to eq(200)
    end
  end

end
