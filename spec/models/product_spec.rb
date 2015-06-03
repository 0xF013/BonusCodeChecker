require "rails_helper"

RSpec.describe Product, :type => :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of :name }
  it { is_expected.to validate_inclusion_of(:service_name).in_array %w(local at rtg) }
  it { is_expected.to have_many :codes }

  describe '#code_validation_strategy' do
    let(:product) { FactoryGirl.build :product }

    it 'returns the symbol representation of the service name' do
      expect(product.code_validation_strategy).to eq :local
    end
  end

  describe 'default values' do
    let(:product) { FactoryGirl.create :product }

    it 'sets service_name to "local"' do
      expect(product.service_name).to eq 'local'
    end
  end

end