class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :address
      t.belongs_to :user, index: true
      t.string :uniq_code

      t.timestamps
    end
  end
end
