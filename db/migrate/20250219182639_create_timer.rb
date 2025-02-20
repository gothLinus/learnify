class CreateTimer < ActiveRecord::Migration[7.2]
  def change
    create_table :timers do |t|
    t.belongs_to :card, foreign_key: true, null: false

      t.timestamps
    end
  end
end
