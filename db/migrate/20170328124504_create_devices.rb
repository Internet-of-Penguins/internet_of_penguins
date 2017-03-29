class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :address
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.string :uniq_code

      t.timestamps
    end
  end
end
