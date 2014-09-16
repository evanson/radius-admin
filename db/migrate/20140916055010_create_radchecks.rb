class CreateRadchecks < ActiveRecord::Migration
  def change
    create_table :radchecks do |t|

      t.timestamps
    end
  end
end
