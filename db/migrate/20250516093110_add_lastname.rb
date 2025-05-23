class AddLastname < ActiveRecord::Migration[8.0]
  def change
    add_column :votes, :last_name, :string
  end
end
