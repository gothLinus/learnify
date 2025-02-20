class CreateTimer < ActiveRecord::Migration[7.2]
  def change
    create_table :timers do |t|
    t.references :cards, foreign_key: true, null: false, cascade: true

      t.timestamps
    end
  end
end
