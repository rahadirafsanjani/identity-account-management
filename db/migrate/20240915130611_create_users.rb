class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email
      t.string :password_digest
      
      t.timestamps
    end
  end
end
