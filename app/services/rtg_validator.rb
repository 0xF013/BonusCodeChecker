class RTGValidator
  def validate(product, code_value)
    raise EntityNotFound if code_value == 'inexistent code'
    raise CodeNotSold if code_value == 'unsold code'
    true
  end
end