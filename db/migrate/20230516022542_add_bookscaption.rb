class AddBookscaption < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :item_caption, :string
  end
end
