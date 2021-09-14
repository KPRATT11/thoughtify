require 'pg'

def exec_sql(command)
    p command
    db = PG.connect(dbname: 'share_app')
        result = db.exec(command)
    db.close
    return result
end