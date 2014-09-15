class CreateRadpostauths < ActiveRecord::Migration
  def change
    create_table :radpostauths do |t|
      t.string :username
      t.string :pass
      t.string :reply
      t.datetime :authdate

      t.timestamps
    end
  end
end
