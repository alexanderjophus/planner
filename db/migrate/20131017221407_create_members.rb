class CreateMembers < ActiveRecord::Migration[4.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :twitter
      t.string :about_you

      t.timestamps
    end
  end
end
