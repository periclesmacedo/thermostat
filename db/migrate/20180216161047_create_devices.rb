class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :identification_string
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
