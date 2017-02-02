require 'rails_helper'

RSpec.describe Post, type: :model do

  context 'db structure' do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:author).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }    
  end

  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }    
    it { should validate_presence_of(:description) }    
  end
end
