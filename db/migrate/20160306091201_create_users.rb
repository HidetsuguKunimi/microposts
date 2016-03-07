class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    
      t.index :email, unique: true #rails g modelの後で、この行を手入力にて追加
    end
  end
end
