class AddEmailIdToVotes < ActiveRecord::Migration[8.0]
  def change
    add_column :votes, :email_id, :string
  end
end
