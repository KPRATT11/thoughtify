require 'pg'

def exec_sql(command)
    p command
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'share_app'})
        result = db.exec(command)
    db.close
    return result
end