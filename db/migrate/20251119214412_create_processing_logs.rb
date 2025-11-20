class CreateProcessingLogs < ActiveRecord::Migration[7.2]
  def change
    create_table :processing_logs do |t|
      t.string :filename, null: false
      t.integer :status
      t.jsonb :extracted_data
      t.jsonb :errors_data
      t.string :parser_type
      t.references :customer, foreign_key: true, null: true

      t.timestamps
    end

    add_index :processing_logs, :status
    add_index :processing_logs, :created_at
    add_index :processing_logs, :filename
  end
end
