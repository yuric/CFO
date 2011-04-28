# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#seedData.txt
require 'open-uri'
puts "Seed file running..."

Rawness.delete_all
open("#{Rails.root}/db/seedData.txt") do |entry|
  entry.read.each_line do |entry|
    department, money, year = entry.chomp.split("|")
    Rawness.create!(:department => department, :money => money, :year => year)
  end
end

#Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "operating_systems")
