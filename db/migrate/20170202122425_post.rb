class Post < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.text   :description

      t.timestamps
    end
  end
end

