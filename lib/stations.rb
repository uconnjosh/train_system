class Stations
  attr_reader :location, :id

  def initialize(location, id=nil)
    @location = location
    @id = id
  end

  def ==(another_station)
    self.location == another_station.location
  end


  def self.all
    results = DB.exec('SELECT * FROM stations;')
    all_stations = []
    results.each do |result|
      location = result['location']
      id = result['id'].to_i
      all_stations << Stations.new(location, id)
    end
    all_stations
  end

  def save
    results = DB.exec("INSERT INTO stations (location) VALUES ('#{@location}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def add_line(chosen_line)
    current_new_line = Lines.new(chosen_line)
    new_line_id = current_new_line.id
    DB.exec("INSERT INTO stops (stations_id, lines_id) VALUES ('#{id}' '#{current_line_id}');")
  end

  def delete
    DB.exec("DELETE FROM stations WHERE (id) = #{@id}")
  end

  # def find_lines
  #   current_line_id = DB.exec("SELECT * FROM stops WHERE id = ('#{stations_id}') RETURNING lines_id;")
  #   DB.exec("SELECT * FROM lines WHERE lines_id = ('#{current_line_id}'') RETURNING";)
  # end
end


