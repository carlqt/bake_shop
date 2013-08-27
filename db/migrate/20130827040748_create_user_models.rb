class CreateUserModels < ActiveRecord::Migration
  def change
    create_table :user_models do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
