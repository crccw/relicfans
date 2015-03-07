class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
      t.belongs_to :museum
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.string :url

      t.timestamps null: false
    end
  end
end
