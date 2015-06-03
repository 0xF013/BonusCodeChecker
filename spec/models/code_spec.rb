require "rails_helper"

RSpec.describe Code, :type => :model do
  it { is_expected.to validate_presence_of :value }
  it { is_expected.to validate_uniqueness_of :value }
  it { is_expected.to belong_to :product }

  describe 'default values' do
    let(:code) { FactoryGirl.create :code }

    it 'sets sold to false' do
      expect(code.sold?).to be false
    end
  end
end