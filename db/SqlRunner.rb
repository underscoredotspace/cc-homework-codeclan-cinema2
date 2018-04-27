require('pg')

class SqlRunner
  def self.connect()
    PG.connect({
      dbname: 'codeclan_cinema', 
      host: 'localhost'
    })
  end

  def self.run(sql, values=[])
    begin
      db = self.connect()
      result = db.exec_params(sql, values)
    ensure
      db.close() if db != nil
    end
    return result
  end
end
