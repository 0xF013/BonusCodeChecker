require "rails_helper"

RSpec.describe Code, :type => :model do
  it { is_expected.to validate_presence_of :value }
  it { is_expected.to validate_uniqueness_of :value }
  it { is_expected.to belong_to :product }
end