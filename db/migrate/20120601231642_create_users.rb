class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :login
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.text   :password_salt
      t.integer :remember_me
      t.string :picture
      t.string :address
      t.string :postalCode
      t.string :city
      t.string :country
      t.string :full_address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
