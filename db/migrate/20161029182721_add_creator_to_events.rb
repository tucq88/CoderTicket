class AddCreatorToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :user, index: true, foreign_key: true
  end

  def down
     remove_foreign_key :events, column: :user_id
   end
end
