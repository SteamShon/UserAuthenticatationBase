class CreateUserClasses < ActiveRecord::Migration
  def change
    create_table :user_classes do |t|
      t.integer :grade
      t.string :title
      t.timestamps
    end
  end
end
