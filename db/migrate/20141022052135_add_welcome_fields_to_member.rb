class AddWelcomeFieldsToMember < ActiveRecord::Migration[4.2]
  def change
    add_column :members, :received_coach_welcome_email, :boolean, default: false
    add_column :members, :received_student_welcome_email, :boolean, default: false
  end
end
