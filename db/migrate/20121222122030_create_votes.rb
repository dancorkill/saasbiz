class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :direction
      t.integer :post_id

      t.timestamps
    end
  end
end
