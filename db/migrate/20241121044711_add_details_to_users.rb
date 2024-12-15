class AddDetailsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :phone, :string
    add_column :users, :designation, :string
    add_column :users, :department, :string
    add_column :users, :organization, :string
    add_column :users, :scholar_idx, :string
    add_column :users, :orchid_idx, :string
  end
end
