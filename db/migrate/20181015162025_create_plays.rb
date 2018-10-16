class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :counter
      t.string :path
      t.timestamps null: false
    end
  end
end
