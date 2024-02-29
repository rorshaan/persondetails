class CreateDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :details do |t|
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
