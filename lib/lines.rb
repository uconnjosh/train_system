class Lines
  attr_reader :color, :id

  def initialize(color, id=nil)
    @color = color
    @id = id
  end

  def ==(another_line)
    self.color == another_line.color && self.id == another_line.id
  end

  def self.all
    results = DB.exec("SELECT * FROM line;")
    all_lines = []
    results.each do |result|
      color = result['color']
      id = result['id'].to_i
      all_lines << Lines.new(color, id)
    end
  all_lines
  end

  def save
    results = DB.exec("INSERT INTO line (color) VALUES ('#{@color}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def delete
    DB.exec("DELETE FROM line WHERE (id) = ('#{@id}');")
  end
end


