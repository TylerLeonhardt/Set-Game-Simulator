class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :color
      t.string :shape
      t.string :shading
      t.integer :number

      t.timestamps null: false
    end
  end
end
