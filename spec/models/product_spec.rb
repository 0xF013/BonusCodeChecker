require "rails_helper"

RSpec.describe Product, :type => :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of :name }
  it { is_expected.to ensure_inclusion_of(:service_name).in_array %w(local at rtg) }
  it { is_expected.to have_many :codes }

  describe '#code_validation_strategy' do
    let(:product) { Product.new service_name: 'local' }

    it 'returns the symbol representation of the service name' do
      expect(product.code_validation_strategy).to eq :local
    end
  end
end