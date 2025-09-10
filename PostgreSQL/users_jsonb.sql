-- CREATE TABLE users (
--  id SERIAL PRIMARY KEY,
--  name TEXT NOT NULL,
--  email TEXT UNIQUE NOT NULL,
--  preferences JSONB
-- );


-- INSERT INTO users (name, email, preferences) VALUES
-- ('Ali', 'ali@example.com', '{"theme": "dark", "notifications": {"email": "true", "sms": "false"}, "language": "en"}'),
-- ('Sara', 'sara@example.com', '{"theme": "light", "notifications": {"email": true, "sms": true}, "language": "fr"}'),
-- ('John', 'john@example.com', '{"theme": "dark", "notifications": {"email": false, "sms": true}, "language": "en"}');


-- SELECT name, preferences FROM users;

-- SELECT name, preferences->>'theme' AS theme FROM users;

-- SELECT * FROM users WHERE preferences->>'theme' = 'dark';

-- SELECT * FROM users WHERE preferences->'notifications'->>'sms' = 'true';

-- UPDATE users SET preferences = jsonb_set(preferences, '{language}', '"es"') WHERE name = 'Sara';

-- UPDATE users SET preferences = jsonb_set(preferences, '{timezone}', '"UTC+5"') WHERE name = 'Ali';

-- SELECT name, jsonb_object_keys(preferences) AS keys FROM users;

-- SELECT name, key, value FROM users, jsonb_each_text(preferences->'notifications');

-- CREATE INDEX idx_users_preferences ON users USING gin(preferences);

-- SELECT * FROM users WHERE preferences ->> 'language' = 'en';

-- INSERT INTO users (name, email, preferences) VALUES
-- ('Cena', 'cena@example.com', '{"theme": "blue", "notifications": {"email": "false", "sms": "true"}, "language": "de"}'),
-- ('HHH', 'hhh@example.com', '{"theme": "green", "notifications": {"email": "false", "sms": "false"}, "language": "es"}');

-- SELECT * FROM users WHERE preferences->'notifications'->>'email' = 'true';

-- UPDATE users SET preferences = jsonb_set(preferences, '{font_size}', '"14px"');

-- SELECT * FROM users WHERE preferences->>'theme' = 'dark' AND preferences->'notifications'->>'sms' = 'true';



