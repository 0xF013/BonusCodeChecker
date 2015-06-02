class BonusCodesController < ApplicationController

  def validate
    code_validator = CodeValidator.new
    begin
      code_validator.validate(
        params.require(:product_id),
        params.require(:bonus_code)
      )
      render json: {}, status: 200
    rescue EntityNotFoundError
      render json: {}, status: 404
    rescue CodeNotSoldError
      render json: {}, status: 403
    end
  end
end