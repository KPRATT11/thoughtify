require 'pg'
require_relative '../db/db_connectors.rb'
require_relative '../helpers/sanitize.rb'
require_relative '../helpers/auth.rb'

module Vote
    def self.get_has_user_voted_by_userId(user_id, target_id, target, type)
        results = exec_sql("SELECT type from votes WHERE user_id = #{user_id.to_i} AND target_id = #{target_id.to_i} AND target = ('#{target}') AND type = ('#{type}')")
        p results.to_a
        if results.to_a.length == 0
            p false
            return false
        else
            p true
            return true
        end
    end

    def self.get_some_votes_by_thought_id(post_id)
        likes = exec_sql("SELECT id, user_id, type FROM votes WHERE target = ('post') AND target_id = #{post_id} AND type = 'like'")
        dislikes = exec_sql("SELECT id, user_id, type FROM votes WHERE target = ('post') AND target_id = #{post_id} AND type = 'dislike'")
        return [likes.to_a, dislikes.to_a]
    end

    def self.get_some_votes_by_comment_id(comment_id)
        likes = exec_sql("SELECT id, user_id, type FROM votes WHERE target = ('comment') AND target_id = #{comment_id} AND type = 'like'")
        dislikes = exec_sql("SELECT id, user_id, type FROM votes WHERE target = ('comment') AND target_id = #{comment_id} AND type = 'dislike'")
        return [likes.to_a, dislikes.to_a]
    end

    def self.post_vote_for_target(user_id, type, target_id, target)
        if is_current_user?(user_id)
            exec_sql("INSERT INTO votes (user_id, target, target_id, type) VALUES
            (
                #{user_id.to_i},
                ('#{target}'),
                #{target_id.to_i},
                ('#{type}')
            )
            ")
        end
        return true
    end

    def self.delete_vote_by_user(user_id, type, target_id)
        if is_current_user?(user_id)
            exec_sql("DELETE FROM votes WHERE user_id = #{user_id.to_i} AND type = ('#{type}') and target_id = #{target_id}")
            return true
        end
        return false
    end

    def self.delete_votes_by_post_id(post_id)
        exec_sql("DELETE FROM votes WHERE target_id = #{post_id} AND target = ('post')")
        return true
    end

    def self.delete_votes_on_target_by_user_id(user_id, thought_id, target)
        if is_current_user?(user_id)
            exec_sql("DELETE FROM votes WHERE user_id = #{user_id} AND target_id = #{thought_id} AND target = '#{target}'")
        end
        return false 
    end

    def self.delete_votes_by_comment_id(comment_id)
        exec_sql("DELETE FROM votes WHERE target_id = #{comment_id}")
        return true
    end
end