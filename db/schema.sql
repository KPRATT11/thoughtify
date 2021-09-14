DROP TABLE IF EXISTS users,topics,posts,comments,likes;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    bio TEXT,
    email TEXT,
    created_at TIMESTAMP,
    password_digest TEXT,
    color TEXT
);

CREATE TABLE topics (
    id SERIAL PRIMARY KEY,
    topic TEXT,
    post_id INTEGER
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT,
    content TEXT,
    post_date TIMESTAMP,
    user_id INTEGER
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    content TEXT,
    user_id INTEGER,
    target_id INTEGER,
    comment_date TIMESTAMP
);

CREATE TYPE enum_target AS ENUM('post','comment');
CREATE TYPE enum_type AS ENUM('like', 'dislike');

CREATE TABLE votes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    target enum_target,
    target_id INTEGER,
    type enum_type
);

CREATE TABLE following (
    follower INTEGER,
    follow_target INTEGER
);