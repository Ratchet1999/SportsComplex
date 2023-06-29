class CreateCoachings < ActiveRecord::Migration[7.0]
  def change
    create_table :coachings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :batch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
