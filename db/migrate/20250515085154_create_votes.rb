class CreateVotes < ActiveRecord::Migration[8.0]
  def change
    create_table :votes do |t|
      t.string :name
      t.string :check

      t.timestamps
    end
  end
end
