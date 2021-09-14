require 'pg'
require 'bcrypt'
require_relative '../db/db_connectors.rb'
require_relative '../helpers/sanitize.rb'
require_relative '../helpers/auth.rb'
require 'pry'

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

    def self.post_user(name, email, password)
        # find if email exists
        if self.find_user_by_email(email)
            return false
        end
        digested_password = digest_password(password)
        creation_date = Time.now.strftime("%d/%m/%Y %H:%M")
        exec_sql("INSERT INTO users (first_name, last_name, email, password_digest, date) VALUES ('#{first_name}', '#{second_name}', '#{email}', '#{digested_password}', '#{creation_date}');")
        return true
    end

    def self.delete_user(id)
        exec_sql("DELETE FROM users WHERE id = #{id}")
        return true
    end

    def self.patch_user_bio_by_id(new_bio, id)
        new_bio = Sanitize.escape_quote(new_bio)
        if is_current_user?(id)
            exec_sql("UPDATE users SET bio = '#{new_bio}' WHERE id = #{id};")
            return true
        end
        return false
    end
end
