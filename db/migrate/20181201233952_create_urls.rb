class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :original
      t.string :shortened
      t.string :title
      t.integer :clicks, :default => 0

      t.timestamps
    end
  end
end
