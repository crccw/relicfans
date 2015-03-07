class CreateMuseums < ActiveRecord::Migration
  def change
    create_table :museums do |t|
      t.string :name
      t.string :home_url
      t.string :exhibit_url

      t.timestamps null: false
    end
  end
end
