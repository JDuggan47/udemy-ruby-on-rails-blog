require "rails_helper"

RSpec.describe Category, type: :model do
  subject { FactoryBot.build(:category) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_length_of(:name).is_at_least(3).is_at_most(25) }
end
