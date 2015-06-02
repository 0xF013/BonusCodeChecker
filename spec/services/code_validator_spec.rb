require "rails_helper"

class NullValidationStrategy
  def validate product_id, code_value

  end
end

RSpec.describe CodeValidator, :type => :service do
  describe '#validate' do
    let(:validator) { CodeValidator.new }
    let(:code_value) { 'some code value' }

    context 'when product not found' do
      it 'raises a specific error' do
        expect { validator.validate 15, code_value }.to raise_error EntityNotFoundError
      end
    end

    context 'when product is valid' do
      let(:product) { FactoryGirl.create :product }
      let(:code_validation_factory) { CodeValidationFactory.new }
      let(:validator) { CodeValidator.new code_validation_factory }
      let(:strategy) { NullValidationStrategy.new }

      before do
        allow(strategy).to receive(:validate)
        allow(code_validation_factory).to receive(:strategy_by_service).and_return(strategy)
        validator.validate(product.id, code_value)
      end

      it 'fetches the strategy from the factory' do
        expect(code_validation_factory).to have_received(:strategy_by_service).with(product.code_validation_strategy)
      end

      it 'calls #validate on the strategy with the correct params' do
        expect(strategy).to have_received(:validate).with(product, code_value)
      end
    end
  end
end