class CreateClients < ActiveRecord::Migration
  def up
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.timestamps null: false
    end
  end

  def down
    drop_table :clients
  end
end
