class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :main_url
      t.string :short_url
      t.integer :counter, default: 0
      t.timestamps
    end
  end
end
