class RenameAddresStreetColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :addres_street, :address_street
  end
end
