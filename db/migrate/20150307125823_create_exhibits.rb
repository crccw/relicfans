class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
      t.belongs_to :museum, null: false
      t.string :name, index: true, null: false
      t.string :location, null: false
      t.date :start_at
      t.date :end_at
      t.string :url

      t.timestamps null: false
    end
  end
end
