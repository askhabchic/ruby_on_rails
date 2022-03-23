class Like < ActiveRecord::Migration
  def change
    create_table :like do |t|
      t.integer :user_id
      t.integer :cuicui_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null :false
    end
  end
end
