# frozen_string_literal: true

class CreateUrls < ActiveRecord::Migration[7.1]
  def change
    create_table :urls do |t|
      t.string :short_url, limit: 7
      t.string :long_url, limit: 2083

      t.timestamps
    end
  end
end
