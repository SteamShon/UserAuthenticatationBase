class AddUserIdToAvatars < ActiveRecord::Migration
  def change
    add_column :avatars, :user_id, :integer   
  end
end
