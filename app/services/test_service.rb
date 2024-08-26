class TestService
  def self.test_transaction
    ActiveRecord::Base.transaction do
      Article.create!(
        title: "Test",
        body: "Test",
        # author: User.first
      )
    end

    true
  rescue StandardError => e
    Rails.logger.error e.message
    User.create!(first_name: "Test", last_name: "Test", age: 1)
    false
  end
end
