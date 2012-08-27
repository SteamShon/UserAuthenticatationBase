class AddDescAndIsDetailToBehavior < ActiveRecord::Migration
  def change
    add_column :behaviors, :is_detail, :integer
    add_column :behaviors, :desc, :string
  end
end
