class AddYearMonthDayToPictureStore < ActiveRecord::Migration
  def change
    add_column :picture_stores, :yaer_month_day, :string
  end
end
