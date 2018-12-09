class User < ApplicationRecord
  include Tokenable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def after_database_authentication
    @token = Tokenable.generate_token
    current_user.user_token = @token
    current_user.token_valid_time_in_minutes = 60
    current_user.token_validity_end_by = Time.now + 60*60
    current_user.save
    format.json { render json: @token }
  end

  validates :username, :email, :encrypted_password, presence: true
  belongs_to :group
end
