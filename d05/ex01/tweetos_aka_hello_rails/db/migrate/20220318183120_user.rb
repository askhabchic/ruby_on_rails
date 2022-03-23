class User < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :since
      t.boolean :admin
      t.string :country, null: false

      t.timestamps null: false
    end
  end
end
