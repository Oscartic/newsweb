class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.string :title
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
