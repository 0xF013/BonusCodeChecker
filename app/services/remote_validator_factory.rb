class RemoteValidatorFactory

  VALIDATORS = {
    at: ATValidator.new,
    rtg: RTGValidator.new
  }

  def self.validator_for(service_name)
    validator = VALIDATORS[service_name]
  end
end