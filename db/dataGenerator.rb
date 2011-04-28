# generate random records for sample Demo 

# t.string :department
# t.integer :year
# t.decimal :money

# Fill Department
departments = ["CSMP", "Nursing", "Biology", "Business", "Education"]

# Fill Years
years = Array.new
startYear = 1998
while startYear < 2012
  years << startYear
  startYear += 1
end

#Fill Money Random.new.rand(20..30) } 
output = ""
aFile = File.new("seedData.txt", "w")
years.length.times do |y|

  departments.length.times do |d|
    money = "#{rand(100000)+30000}.#{rand(99)}"
    puts " Department:#{departments[d]} Spent: #{money} for the year: #{years[y]}"
    output ="#{departments[d]}|#{money}|#{years[y]}\n"
    aFile.write(output)    
  end

end
aFile.close
