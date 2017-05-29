class CreateMacLists < ActiveRecord::Migration[5.0]
  def change
    create_table :mac_lists do |t|
      t.string :mac_address
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
