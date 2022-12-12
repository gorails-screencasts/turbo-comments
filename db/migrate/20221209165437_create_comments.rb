class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :commentable, polymorphic: true, null: false
      t.text :body

      t.timestamps
    end
  end
end
