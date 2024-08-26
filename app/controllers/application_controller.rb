class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def test_transaction
    # transaction
    ActiveRecord::Base.transaction do
      Article.create!(title: "Test", body: "Test")
    end

  rescue StandardError => e
    Rails.logger.error e.message
    User.create!(first_name: "Test", last_name: "Test", age: 1)
  end

  def test_transaction_from_service
    result = ::TestService.test_transaction
    if result
      render json: { message: "Transaction successful" }
    else
      render status: 406, json: { message: "Transaction failed" }
    end
  end
end
