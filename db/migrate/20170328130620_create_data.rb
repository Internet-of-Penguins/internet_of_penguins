class CreateData < ActiveRecord::Migration[5.0]
  def change
    create_table :data do |t|
      t.string :name
      t.string :value
      t.references :device, foreign_key: true

      t.timestamps
    end
  end
end
