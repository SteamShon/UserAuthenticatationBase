class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.references :user_class
      t.references :student
      t.references :behavior
      t.timestamps
    end
  end
end
