require "rails_helper"

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:article) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }

  it { should validate_length_of(:title).is_at_least(3).is_at_most(50) }
  it { should validate_length_of(:title).is_at_least(3).is_at_most(50) }

  it { should have_many(:categories) }
end
