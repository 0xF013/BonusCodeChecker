class ValidationStrategies::RTGStrategy
  def validate(product, code_value)
    # some bogus custom logic
    # in reality there would be a REST call to some API
    raise EntityNotFound if code_value == 'inexistent_code'
    raise CodeNotSold if code_value == 'unsold_code'
    true
  end
end