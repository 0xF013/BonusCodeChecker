require "rails_helper"

RSpec.describe ValidationStrategies::LocalStrategy, :type => :service do
  describe '#validate' do
    let(:strategy) { ValidationStrategies::LocalStrategy.new }
    let(:product) { FactoryGirl.create :product }

    context 'when code not found' do
      it 'raises a not found error' do
        expect { strategy.validate product, 'some_code_value' }.to raise_error EntityNotFoundError
      end
    end

    context 'when code is not sold' do
      let(:code) { FactoryGirl.create :code, product: product, sold: false }
      it 'raises a code not sold error' do
        expect { strategy.validate product, code.value }.to raise_error CodeNotSoldError
      end
    end

    context 'when code is sold' do
      let(:code) { FactoryGirl.create :code, product: product, sold: true }
      it 'return true' do
        expect(strategy.validate product, code.value).to be true
      end
    end
  end
end