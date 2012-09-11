class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :picture
      t.text :description

      t.timestamps
    end
  end
end
