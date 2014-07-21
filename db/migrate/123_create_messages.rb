class CreateMessages < ActiveRecord::Migration
  def up
    create_table :messages do |t|
      t.string :name
      t.string :message
    end
  end

  def down
    drop_table :messages
  end
end
