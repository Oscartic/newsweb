class AddNoticeIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :notice_id, :integer
    add_index :comments, :notice_id
  end
end
