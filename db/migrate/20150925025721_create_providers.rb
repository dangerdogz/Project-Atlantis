class CreateProviders < ActiveRecord::Migration
  def up
    create_table :providers do |t|
      t.string :name
      t.string :email
      t.timestamps null: false
    end
  end

  def down
    drop_table :providers
  end
end
