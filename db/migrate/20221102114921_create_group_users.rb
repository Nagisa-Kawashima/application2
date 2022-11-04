class CreateGroupUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_users do |t|
      # t.references :user, index: true, foreign_key: true
      # t.references :group, index: true, foreign_key: true
      t.integer :user_id
      t.integer :group_id
      t.timestamps
    end
  end
end
