class AddColumnSharedToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :shared, :boolean, default: false
  end
end
