require('pg')

class BountyHunting
  attr_accessor :name, :danger_level, :species, :favourite_weapon, :last_known_location
  attr_reader :id

  def initialize(options)
    @name = options["name"]
    @danger_level = options["danger_level"]
    @species = options["species"]
    @favourite_weapon = options["favourite_weapon"]
    @last_known_location = options["last_known_location"]
    @id = options["id"].to_i if options["id"]
  end

  def save
    db = PG.connect ( { dbname: 'bounty_hunting', host: 'localhost'})
    sql = "
    INSERT INTO hit_list
    (name, danger_level, species, favourite_weapon, last_known_location)
    VALUES
    ('#{@name}', '#{@danger_level}', '#{@species}', '#{@favourite_weapon}', '#{@last_known_location}') returning *;
    "
    result = db.exec(sql)
    @id = result[0]['id'].to_i
    db.close
  end

  def delete
    db = PG.connect ( { dbname: 'bounty_hunting', host: 'localhost'})
    sql = "DELETE FROM hit_list WHERE id =#{@id};"
    db.exec(sql)
    db.close
  end

  def update
    db = PG.connect ( { dbname: 'bounty_hunting', host: 'localhost'})
    sql = "UPDATE hit_list SET (name, danger_level, species, favourite_weapon, last_known_location) = ('#{@name}', '#{@danger_level}', '#{@species}', '#{@favourite_weapon}', '#{@last_known_location}') WHERE id = #{@id};
    "
    db.exec(sql)
    db.close
  end

  def self.delete(id)
    db = PG.connect ( { dbname: 'bounty_hunting', host: 'localhost'})
    sql = "DELETE FROM hit_list WHERE id =#{id};"
    db.exec(sql)
    db.close
  end

  def self.all
    db = PG.connect ( { dbname: 'bounty_hunting', host: 'localhost'})
    sql = "SELECT * FROM hit_list;"
    targets = db.exec(sql)
    db.close
    return targets.map{ |hash| BountyHunting.new(hash) }
  end

  def self.delete_all
    db = PG.connect ( { dbname: 'bounty_hunting', host: 'localhost'})
    sql = "DELETE FROM hit_list;"
    db.exec(sql)
    db.close
  end

end