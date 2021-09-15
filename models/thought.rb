require 'pg'
require_relative '../db/db_connectors.rb'
require_relative '../helpers/sanitize.rb'
require_relative '../helpers/auth.rb'
require_relative '../helpers/globals.rb'
require_relative 'vote.rb'
require_relative 'follower.rb'
require_relative 'comment.rb'

module Thought
    def self.user_owns_thought(thought_id, user_id)
        thought = self.get_single_thought_by_id(thought_id)
        if thought["user_id"].to_i == user_id.to_i
            p 'owns'
            return true
        end
        p 'nah'
        return false
    end

    def self.get_all_thoughts(page_num)
        offset = GLB_PAGE_SIZE * page_num
        results = exec_sql("SELECT * FROM posts ORDER BY post_date DESC LIMIT #{GLB_PAGE_SIZE} OFFSET #{offset}")
    end

    def self.get_all_thoughts_and_votes(page_num)
        results = self.get_all_thoughts(page_num)
        processed_results = []
        results.each do |result|
            votes = Vote.get_some_votes_by_thought_id(result["id"])
            result["likes"] = votes[0]
            result["dislikes"] = votes[1]
            processed_results.push(result)
        end
        return processed_results
    end

    def self.get_all_thoughts_by_following(user_id)
        results = Follower.get_all_following_by_userId(user_id).to_a
        all_user_ids = '('
        results.each do |result|
            all_user_ids += "#{result["follow_target"]}"
            all_user_ids += ","
            all_user_ids = all_user_ids.chomp()
        end
        results = exec_sql("select * from posts where user_id in #{all_user_ids}")
        return results
    end

    def self.get_single_thought_by_id(id)
        results = exec_sql("SELECT * FROM posts WHERE id = #{id}")[0]
    end

    def self.get_single_thought_and_votes_by_id(post_id)
        results = self.get_single_thought_by_id(post_id)
        #get the likes involved
    end

    def self.post_thought(user_id, thought_title, thought_content)
        thought_title = Sanitize.escape_quote(thought_title)
        thought_content = Sanitize.escape_quote(thought_content)
        date = Time.now.strftime("%d/%m/%Y %H:%M")
        if is_current_user?(user_id)
            exec_sql("INSERT INTO posts (title, content, post_date, user_id) VALUES 
            (
                '#{thought_title}',
                '#{thought_content}',
                '#{date}',
                '#{user_id}'
            );")
            return true
        end
        return false
    end

    def self.put_thought_by_id(id, user_id, thought_title, thought_content)
        thought_title = Sanitize.escape_quote(thought_title)
        thought_conent = Sanitize.escape_quote(thought_content)

        if self.user_owns_thought(id, user_id)
            exec_sql("UPDATE posts SET title = '#{thought_title}', content = '#{thought_content}' WHERE id = #{id}")
            return true
        end
        return false
    end

    def self.delete_thought_by_id(id)
        if self.user_owns_thought(id, current_user_id)
            exec_sql("DELETE FROM posts WHERE id = #{id}")
            Comment.delete_comments_by_post_id(id)
            Vote.delete_votes_by_post_id(id)
            return true
        end
        return false
    end
end