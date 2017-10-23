class CreateSnaps < ActiveRecord::Migration[5.1]
  def change
    create_table :snaps do |t|
      t.text          :content
      t.integer       :duration
      t.references    :post, foreign_key: true
      t.timestamps    null: false # create_at & update_at
    end
  end
end
