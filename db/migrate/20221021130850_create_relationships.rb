class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.references :follower, null: false, foreign_key: {to_table: :users}
      t.references :followed, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end

# このような書き方もある↓
# def change
#     create_table :relationships do |t|
#       t.integer :follower_id
#       t.integer :followed_id

#       t.timestamps
#     end
#   end