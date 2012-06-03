class AddEncryptedPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :crypted_password, :string
  end
end
