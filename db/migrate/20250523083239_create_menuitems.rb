class CreateMenuitems < ActiveRecord::Migration[8.0]
  def change
    create_table :menuitems do |t|
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
