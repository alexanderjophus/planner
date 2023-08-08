class CreateWaitingLists < ActiveRecord::Migration[4.2]
  def change
    create_table :waiting_lists do |t|
      t.references :invitation, index: true
      t.boolean :auto_rsvp, default: true

      t.timestamps
    end
  end
end
