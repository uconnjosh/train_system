require './lib/lines'
require './lib/stations'
require './lib/stops'
require 'pg'

DB = PG.connect(:dbname => 'train_system')

def main_menu
  puts "Welcome to the Transit Authority Train System"
  puts "Press 'l' to add a new transit line"
  puts "Press 'vl' to view a list of the transit lines"
  puts "Press 'st' to add a new transit station"
  puts "Press 'vs' to view a list of the transit stations"
  puts "Press 'x' to exit"
  main_answer = gets.chomp.upcase
  case main_answer
  when 'L'
    new_transit_line
  when 'VL'
    view_lines
  when 'ST'
    new_transit_station
  when 'VS'
    view_stations
  when 'SP'
    new_stop
  when 'X'
    puts 'Hasta Lluego!!!!'
  end
end

def new_transit_line
  puts 'Enter a name for the line that you would like to add'
  proposed_line = gets.chomp
  new_line = Lines.new(proposed_line)
  new_line.save
  puts 'Got It!'
  main_menu
end

def view_lines
  puts 'Here are the lines currently in the TRIMET system:'
  all_lines = Lines.all
    all_lines.each do |current_line|
      i = current_line.id.to_s
      puts "#{current_line.id}. #{current_line.color}"
    end
    puts "Type the Line ID to work with that Line"
    main_menu
  end

def new_transit_station
  puts 'Enter a name of a transit station you would like to add:'
  proposed_station = gets.chomp
  new_station = Stations.new(proposed_station)
  new_station.save

  puts 'Got It!'
  main_menu
  end

def view_stations
  puts 'Here are the stations currently in the TRIMET system:'
  all_stations = Stations.all
    all_stations.each do |current_station|
      i = current_station.id.to_s
      puts "#{current_station.id}. #{current_station.location}"
    end
    puts "Type the Station ID to work with that Station"
    station_to_view = gets.chomp.to_i
    puts "Press A to add a line to this station"
    puts "Press V to see all lines currently assigned to this station"
    response = gets.chomp.upcase
    case response
    when "A"
      puts "Type the name of the line you would like to add"
      all_stations[station_to_view].add_line(gets.chomp)
      puts "Line has been added"
    main_menu
  end

# def new_stop
#   puts "Press 'l' to view all transit lines"
#   puts "Press 's' to view all transit stations"
#   stop_answer = gets.chomp.upcase
#   case stop_answer
#   when 'l'
#     view_lines
#   when ''
#   end
# end

end

main_menu

