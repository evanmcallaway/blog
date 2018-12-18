class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

    create_table :taggings do |t|
      t.references :tag
      t.references :article
      t.timestamps
    end
  end
end
