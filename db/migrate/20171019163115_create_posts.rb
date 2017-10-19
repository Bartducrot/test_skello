class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string  :title
      t.text    :content
      t.string  :photo
      t.float   :rating
      t.timestamps null: false # create_at & update_at
    end
  end
end
