class AddLevelToSponsors < ActiveRecord::Migration[4.2]
  def up
    # hidden: 0,
    # standard: 1,
    # bronze: 2,
    # silver: 3,
    # gold: 4,
    # community: 5,
    add_column :sponsors, :level, :integer, null: false, default: 1, index: true
  end

  def down
    remove_column :sponsors, :level
  end
end
