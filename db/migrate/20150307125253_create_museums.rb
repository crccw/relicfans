class CreateMuseums < ActiveRecord::Migration
  def change
    create_table :museums do |t|
      t.string :name, null: false
      t.string :flag, null: false
      t.string :home_url, null: false
      t.string :exhibit_url, null: false

      t.timestamps null: false
    end
    add_index :museums, :name, unique: true
    add_index :museums, :flag, unique: true
  end
end
