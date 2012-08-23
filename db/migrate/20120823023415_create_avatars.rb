class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.attachment :photo
      t.timestamps
    end
  end
end
