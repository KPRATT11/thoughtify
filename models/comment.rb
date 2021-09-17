require 'pg'
require_relative 'vote'
require_relative '../db/db_connectors.rb'
require_relative '../helpers/sanitize.rb'
require_relative '../helpers/auth.rb'

module Comment
    def self.get_single_comment_by_id(comment_id)
        results = exec_sql("SELECT * FROM comments WHERE id = #{comment_id}").to_a[0 ]
    end

    def self.user_owns_comment(comment_id, user_id)
        comment = self.get_single_comment_by_id(comment_id)
        if comment["user_id"].to_i == user_id.to_i
            return true
        end
        return false
    end

    def self.get_some_comments_by_thought(thought_id)
        results = exec_sql("SELECT * FROM comments WHERE target_id = #{thought_id } ORDER BY comment_date DESC")
    end

    def self.put_comment_by_id(id, content, user_id)
        exec_sql("UPDATE comments SET content = '#{content}' where id = #{id}")
        return true
    end

    def self.delete_comment_by_id(id, user_id)
        exec_sql("DELETE FROM comments WHERE id = #{id}")
        Vote.delete_votes_by_comment_id(id)
        return true
        return false
    end

    def self.post_comment(content, target_id, user_id)
        date = Time.now.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
        content = Sanitize.escape_quote(content)
        exec_sql("INSERT INTO comments (comment_date, content, target_id, user_id) VALUES 
        (
            '#{date}',
            '#{content}',
            #{target_id},
            #{user_id}
        )")
        return true
    end

    def self.delete_comments_by_post_id(target_id)
        exec_sql("DELETE FROM comments WHERE target_id = #{target_id}")
        return true
    end
end