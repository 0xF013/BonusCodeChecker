class ValidationStrategies::LocalStrategy
  def validate(product, code_value)
      code = product.codes.find_by(value: code_value)
      raise EntityNotFoundError if code.nil?
      raise CodeNotSoldError unless code.sold?
      true
  end
end