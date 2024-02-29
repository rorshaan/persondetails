class AddDetailsToPerson < ActiveRecord::Migration[7.0]
  def change
    add_reference :details, :person, foreign_key: true 
  end
end
