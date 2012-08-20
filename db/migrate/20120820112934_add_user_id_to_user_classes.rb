class AddUserIdToUserClasses < ActiveRecord::Migration
  def change
    add_column :user_classes, :user_id, :integer
  end
end
