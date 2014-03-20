class Stops
  attr_reader :stations_id, :lines_id, :id

  def initialize(stations_id, lines_id, id=nil)
    @stations_id = stations_id
    @lines_id = lines_id
    @id = id
  end

  def ==(another_stop)
    self.stations_id == another_stop.stations_id
    self.lines_id == another_stop.lines_id
  end

  def self.all
    results = DB.exec("SELECT * FROM stops;")
    all_stops = []
    results.each do |result|
      stations_id = result['stations_id'].to_i
      lines_id = result['lines_id'].to_i
      id = result['id'].to_i
      all_stops << Stops.new(stations_id, lines_id)
    end
    all_stops
  end

  def save
     results = DB.exec("INSERT INTO stops (stations_id, lines_id) VALUES ('#{@stations_id}','#{@lines_id}') RETURNING id;")
     @id = results.first['id'].to_i
  end
end




