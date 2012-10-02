class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :description
      t.string :content_type
      t.string :file_name
      t.binary :binary_data

      t.timestamps
    end
  end
end
