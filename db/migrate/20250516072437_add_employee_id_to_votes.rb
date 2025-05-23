class AddEmployeeIdToVotes < ActiveRecord::Migration[8.0]
  def change
    add_column :votes, :employee_id, :integer
  end
end
