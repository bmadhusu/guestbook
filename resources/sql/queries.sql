-- :name save-message! :! :n
-- :doc creates a new message using the name and message keys
INSERT INTO posts
(author, name, message)
VALUES (:author, :name, :message)
RETURNING *;

-- :name get-messages :? :*
-- :doc selects all available messages
SELECT * from posts

-- :name create-user!* :! :n
INSERT INTO users
(login, password)
VALUES (:login, :password)

-- :name get-user-for-auth* :? :1
-- :doc select a user for authentication
SELECT * from users
WHERE login = :login

-- :name get-messages-by-author :? :*
-- :doc selects all messages posted by a user
SELECT * from posts
WHERE author = :author

-- :name set-profile-for-user* :<! :1
-- :doc sets a profile map for the specified user
UPDATE users
SET profile = :profile
WHERE :login = login
RETURNING *;

-- :name get-user* :? :1
-- :doc gets a user's publicly available information
SELECT login, created_at, profile FROM users
WHERE login = :login

-- :name save-file! :! :n
-- saves a file to the database
INSERT INTO media
(name, type, owner, data)
VALUES (:name, :type, :owner, :data)
ON CONFLICT (name) DO UPDATE
SET type = :type,
    data = :data
WHERE media.owner = :owner

-- :name get-file :? :1
-- Gets a file from the database
select * from media
where name = :name
