class AddUseCaseToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :use_case, :string, default: 'main'
  end
end
