class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.references :branch, null: false, foreign_key: true
      t.references :sport, null: false, foreign_key: true

      t.datetime :batch_time
      t.timestamps
    end
  end
end
