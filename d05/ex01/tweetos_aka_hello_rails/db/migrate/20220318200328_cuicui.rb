class Cuicui < ActiveRecord::Migration
  def change
    create_table :cuicui do |t|
      t.text :content
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null :false
    end
  end
end
