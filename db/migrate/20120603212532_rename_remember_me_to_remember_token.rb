class RenameRememberMeToRememberToken < ActiveRecord::Migration
  def up
    rename_column :users, :remember_me, :remember_token
    add_index  :users, :remember_token
  end

  def down
  end
end
