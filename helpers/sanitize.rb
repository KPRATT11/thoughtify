module Sanitize
    def self.escape_quote(str)
        return str.gsub("'", "''")
    end
end