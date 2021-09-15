require 'pg'
require_relative '../db/db_connectors.rb'
require_relative '../helpers/sanitize.rb'
require_relative '../helpers/auth.rb'

module Follower
    def self.is_following?(user_id, target_id)
        results = exec_sql("SELECT COUNT(*) FROM following WHERE follower = #{user_id} and follow_target = #{target_id}")
        if results.to_a[0]["count"] == "0"
            return false
        end
        return true
    end

    def self.post_follow(user_id, target_id)
        if (user_id != target_id)
            exec_sql("INSERT INTO following VALUES (#{user_id}, #{target_id});")
            return true
        end
        return false
    end

    def self.delete_follow(user_id, target_id)
        exec_sql("DELETE FROM following WHERE follower = #{user_id} and follow_target = #{target_id}")
        return true
    end

    def self.get_all_following_by_userId(user_id)
        results = exec_sql("SELECT * FROM following WHERE follower = #{user_id}")
        return results
    end

    def self.get_all_followers_by_userId(user_id)
        exec_sql("SELECT * FROM followers WHERE follow_target = #{user_id}")
    end

    def self.delete_follows_by_user_id(user_id)
        exec_sql("DELETE FROM followers WHERE follower = #{user_id}")
        exec_sql("DELETE FROM  WHERE follow_target = #{user_id}")
        return true
    end
end