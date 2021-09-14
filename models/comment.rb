require 'pg'
require_relative '../db/db_connectors.rb'
require_relative '../helpers/sanitize.rb'
require_relative '../helpers/auth.rb'

module Comment
    def get_some_comments_by_thought(thought_id)
        results = exec_sql("SELECT * FROM comments WHERE target_id = #{thought_id }")
    end

    def put_comment_by_id()

    end

    def delete_comment_by_id(target_id, user_id)
        if is_current_user?(user_id)
            
    end

    def post_comment(content, target_id, user_id)
        date = Time.now.strftime("%d/%m/%Y %H:%M")
        content = Sanitize.escape_quote(content)
        exec_sql("INSERT INTO comments (comment_date, content, target_id, user_id) VALUES 
        (
            '#{date}',
            '#{content},
            #{target_id},
            #{user_id}
        )")
        return true
    end

end