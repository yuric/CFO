class Rawness < ActiveRecord::Base
  #scope :CSMP, where(:department => "CSMP")
  #attr_accessible .....
  def self.date_value (csmp)
      
  end

end
=begin
series: [
<% { "CSMP" => Rawness.CSMP, "Biology" => Rawness.Biology }.each do |name, rawness| %>
{
  name: "<%= name %>",
  pointInterval: <%= 1.year * 1000 %>,
  pointStart: <%= x.years.ago.to_i * 1000 %>,
  data: <%=  (x.years.ago.to_date..Date.today).map {|date| rawness.date_value(date).to_f}.inspect %>
},
<% end %>
]
=end