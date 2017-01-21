class AddColumnToUsers < ActiveRecord::Migration
  def change
  	add_column :users,:is_checked,:boolean
  end
end
