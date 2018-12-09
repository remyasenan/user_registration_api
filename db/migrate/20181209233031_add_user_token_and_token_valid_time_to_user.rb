class AddUserTokenAndTokenValidTimeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_token, :string
    add_column :users, :token_valid_time_in_minutes, :integer
  end
end
