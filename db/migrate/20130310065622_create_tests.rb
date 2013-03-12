class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.binary :a_binary
      t.boolean :b_boolean
      t.date :c_date
      t.datetime :d_datetime
      t.decimal :e_decimal
      t.float :f_float
      t.integer :g_integer
      t.string :h_string
      t.text :i_text
      t.time :j_time

      t.timestamps
    end
  end
end
