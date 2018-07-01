class AddUserIdToNotices < ActiveRecord::Migration[5.2]
  def change
    add_column :notices, :user_id, :integer
    add_index :notices, :user_id
  end
end
