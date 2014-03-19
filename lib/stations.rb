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
      all_stations << Stations.new(location)
    end
    all_stations
  end

  def save
    results = DB.exec("INSERT INTO stations (location) VALUES ('#{@location}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def delete
    DB.exec("DELETE FROM stations WHERE (id) = #{@id}")
  end
end

