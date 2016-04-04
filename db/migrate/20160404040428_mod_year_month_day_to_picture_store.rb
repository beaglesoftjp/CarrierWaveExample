class ModYearMonthDayToPictureStore < ActiveRecord::Migration
  def change
    add_column :picture_stores, :year_month_day, :string
    remove_column :picture_stores, :yaer_month_day
  end
end
