class CreateBehaviors < ActiveRecord::Migration
  def change
    create_table :behaviors do |t|
      t.string :title
      t.integer :score
      t.references :user_class
      t.timestamps
    end
  end
end
