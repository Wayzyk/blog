class RemoveParentFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :parent_id
  end
end
