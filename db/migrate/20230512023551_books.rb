class Books < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :login_userId, :integer

  end
end
