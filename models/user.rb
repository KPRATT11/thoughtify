require 'pg'
require 'bcrypt'
require_relative '../db/db_connectors.rb'
require_relative '../helpers/sanitize.rb'
require_relative '../helpers/auth.rb'

module User
    def self.digest_password(password)
        return BCrypt::Password.create(password)
    end  
    
    def self.validate_user(email, password)
        user = self.get_single_user_by_email(email)
        if !user
            return false
        end
        decrypted_pass = BCrypt::Password.new(user["password_digest"])
        if decrypted_pass == password
            return user
        else
            return false
        end
    end

    def self.get_single_user_by_email(email)
        results =  exec_sql("SELECT * FROM users WHERE email = '#{email}';")
        if results.count > 0
            return results[0]
        else
            return false
        end
    end

    def self.get_single_user_by_id(id)
        results = exec_sql("SELECT * FROM users WHERE id = '#{id}';")
        if results.count > 0
            return results[0]
        else
            return false
        end
    end

    def self.get_all_users
        return exec_sql("SELECT * FROM users")
    end

    def self.get_some_users_by_search_query(search_query)
        search_query = search_query.downcase
        split_query = search_query.split(" ")
        if split_query.length > 1
            sqlString = "SELECT * FROM users WHERE"
            split_query.each do |query|
                sqlString = sqlString + " first_name ILIKE '%#{query}%' OR last_name ILIKE '%#{query}%' OR "
            end
            sqlString = sqlString.slice(0...-3)
            results = exec_sql(sqlString)
        else
            results = exec_sql("SELECT * FROM users WHERE first_name ILIKE '%#{split_query[0]}%' or last_name ILIKE '%#{split_query[0]}%';")
        end
        return results
    end

    def self.post_user(first_name, second_name, email, password)
        # find if email exists
        if self.get_single_user_by_email(email)
            return false
        end
        first_name = first_name.downcase.capitalize
        second_name = second_name.downcase.capitalize
        digested_password = digest_password(password)
        creation_date = Time.now.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
        exec_sql("INSERT INTO users (first_name, last_name, email, password_digest, created_at) VALUES ('#{first_name}', '#{second_name}', '#{email}', '#{digested_password}', '#{creation_date}');")
        return true
    end

    def self.delete_user(id)
        exec_sql("DELETE FROM users WHERE id = #{id}")
        return true
    end

    def self.patch_user_bio_by_id(id, new_bio)
        new_bio = Sanitize.escape_quote(new_bio)
        exec_sql("UPDATE users SET bio = '#{new_bio}' WHERE id = #{id};")
        return true
        return false
    end
end
