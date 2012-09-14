#! /usr/bin/ruby


require 'rubygems'
require 'json'
require 'csv'

in_filename = 'elevation-via-first.csv/elevation-via-first.csv'
out_filename = 'elevation-via-first.csv/elevation-via-first.json'
data = []
CSV.open(in_filename, 'r') do |row|
  #puts row.inspect
  if row[0] != 'pointNum' then
    distance = row[1].strip.to_i
    elevation = [ row[4].strip.to_i, row[5].strip.to_i ].max

    data << {
      'x' => distance,
      'y' => elevation
    }
  end
end

json = []

while !data.empty?
  range = data.slice!(0, 10)

  sum_x = 0
  sum_y = 0
  range.each do |point|
    sum_x += point['x']
    sum_y += point['y']
  end

  avg_x = (sum_x.to_f / range.length).to_i
  avg_y = (sum_y.to_f / range.length).to_i

  json << {
    'x' => avg_x,
    'y' => avg_y,
  }
end

#puts data.inspect
#puts JSON.dump(data)
File.open(out_filename, 'w') do |f|
  JSON.dump(json, f)
end


