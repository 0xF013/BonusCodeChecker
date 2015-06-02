class CodeValidator
  def validate(product_id, code_value)
    product = Product.find_by(id: product_id)
    raise EntityNotFoundError if product.nil?
    # should be refactored into strategies when requirements grow
    if product.codes_preloaded?
      validate_preloaded product, code_value
    else
      validate_remotely product, code_value
    end
  end

  private
    def validate_preloaded(product, code_value)
      code = product.codes.find_by(value: code_value)
      raise EntityNotFoundError if code.nil?
      raise CodeNotSoldError unless code.sold?
      true
    end

    def validate_remotely(product, code_value)
      validator = RemoteValidatorFactory.validator_for product.service_name.to_sym
      validator.validate(product, code_value)
    end

end