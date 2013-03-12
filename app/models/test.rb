class Test < ActiveRecord::Base
  attr_accessible :a_binary, :b_boolean, :c_date, :d_datetime, :e_decimal, :f_float, :g_integer, :h_string, :i_text, :j_time
end
