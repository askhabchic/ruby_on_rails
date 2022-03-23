class Comment < ActiveRecord::Migration
  def change
    create_table :comment do |t|
      t.text :content
      t.integer :cuicui_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null :false
    end
  end
end
