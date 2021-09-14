require 'pg'
require_relative '../db/db_connectors.rb'
require_relative '../helpers/sanitize.rb'
require_relative '../helpers/auth.rb'

module Topic
    def post_new_topic(topic, post_id)
        topic = topic.downcase
        exec_sql("INSERT INTO topics VALUES ('#{topic}'), #{post_id}")
        return true
    end

    def delete_topics_from_post_id(post_id)
        exec_sql("DELETE FROM topics WHERE post_id = #{post_id}")
    end
end