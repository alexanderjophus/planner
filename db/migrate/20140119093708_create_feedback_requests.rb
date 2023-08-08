class CreateFeedbackRequests < ActiveRecord::Migration[4.2]
  def change
    create_table :feedback_requests do |t|
      t.references :member, index: true
      t.references :sessions, index: true
      t.string :token
      t.boolean :submited

      t.timestamps
    end
  end
end
