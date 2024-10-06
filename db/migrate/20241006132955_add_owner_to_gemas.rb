class AddOwnerToGemas < ActiveRecord::Migration[7.2]
  def change
    add_reference :gemas, :owner, null: false, foreign_key: true
  end
end
