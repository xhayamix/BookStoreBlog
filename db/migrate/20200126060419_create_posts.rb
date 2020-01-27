class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.integer :company_id
      t.string :create_day
      t.string :update_day

      t.timestamps
    end
  end
end
