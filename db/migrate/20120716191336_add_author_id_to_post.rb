class AddAuthorIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :author_id, :integer, {:default=>1,:null=>false}
    add_index :posts, :author_id
  end
end
