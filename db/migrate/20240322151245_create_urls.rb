class CreateUrls < ActiveRecord::Migration[7.1]
  def change
    create_table :urls do |t|
      t.integer :short_url
      t.string :long_url
      t.string :string{700}

      t.timestamps
    end
  end
end
