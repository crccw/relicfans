class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :msg_id, limit: 8, null: false
      t.string :to_user_name, null: false
      t.string :from_user_name, null: false
      t.datetime :create_time, null: false
      t.string :msg_type, null: false
      t.string :content, limit: 1024, null: false

      t.timestamps null: false
    end
    add_index :messages, :msg_id, unique: true
  end
end
