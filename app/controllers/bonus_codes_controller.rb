class BonusCodesController < ApplicationController

  def validate
    code_validator = CodeValidator.new
    begin
      code_validator.validate(
        params.require(:product_id),
        params.require(:bonus_code)
      )
      render nothing: true, status: 200
    rescue EntityNotFoundError
      render nothing: true, status: 404
    rescue CodeNotSoldError
      render nothing: true, status: 403
    end
  end
end