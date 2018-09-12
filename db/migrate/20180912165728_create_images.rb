class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :callback_url
      t.string :attachment
      t.string :objects_to_annotate

      t.timestamps
    end
  end
end
