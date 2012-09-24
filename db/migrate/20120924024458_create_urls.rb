class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :shurl
      t.string :slug

      t.timestamps
    end
  end
end
