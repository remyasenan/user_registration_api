class AddTokenValidityEndTimeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :token_validity_end_by, :datetime
  end
end
