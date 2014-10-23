class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.text :comment
      t.timestamp :time_created
      t.time :expiration_date
      t.integer :hx_votes

      t.timestamps
    end
  end
end
