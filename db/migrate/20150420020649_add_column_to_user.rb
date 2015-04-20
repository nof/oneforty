class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :popular_name, :string

    add_index :users, :name, unique: true
  end
end