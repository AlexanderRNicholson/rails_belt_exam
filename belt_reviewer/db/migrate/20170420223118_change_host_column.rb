class ChangeHostColumn < ActiveRecord::Migration
  def change
    remove_column :events, :host
    add_reference :events, :user, index: true
    add_foreign_key :events, :users
  end
end
