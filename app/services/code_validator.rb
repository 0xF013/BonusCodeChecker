class CodeValidator

  def initialize(code_validation_factory=CodeValidationFactory.new)
    @code_validation_factory = code_validation_factory
  end

  def validate(product_id, code_value)
    product = Product.find_by id: product_id
    raise EntityNotFoundError if product.nil?
    strategy = @code_validation_factory.strategy_by_service product.code_validation_strategy.to_sym
    strategy.validate product, code_value
  end
end