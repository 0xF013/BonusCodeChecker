class CodeValidationFactory

  # this could be replaced with a dynamic class name
  # but I like it more defined for better feedback
  # from code analysis and usage tools
  VALIDATORS = {
    local: ValidationStrategies::LocalStrategy.new,
    at: ValidationStrategies::ATStrategy.new,
    rtg: ValidationStrategies::RTGStrategy.new
  }

  def strategy_by_service(service_name)
    VALIDATORS[service_name]
  end

end