class AddAvatarIdToStudent < ActiveRecord::Migration
  def change
    add_column :students, :avatar_id, :integer
  end
end
