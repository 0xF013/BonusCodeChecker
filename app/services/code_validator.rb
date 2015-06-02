class CodeValidator
  VALIDATORS = {
    local: LocalValidator.new,
    at: ATValidator.new,
    rtg: RTGValidator.new
  }

  def validate(product_id, code_value)
    product = Product.find_by(id: product_id)
    raise EntityNotFoundError if product.nil?
    validator = validator_for product.code_validation_strategy.to_sym
    validator.validate(product, code_value)
  end

  private
    def validator_for(service_name)
      VALIDATORS[service_name]
    end

end