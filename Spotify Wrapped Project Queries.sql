SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/user/Desktop/Spotify Wrapped Project/Spotify Wrapped Project (CSV-UTF-8).csv'
INTO TABLE statistics
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

---------------------------------------------------------------

SELECT * FROM statistics;


ALTER TABLE statistics
RENAME COLUMN date TO stream_date;

ALTER TABLE statistics
MODIFY COLUMN stream_date VARCHAR(255);

UPDATE statistics
SET stream_date = STR_TO_DATE(stream_date, '%d.%m.%Y %H:%i');

ALTER TABLE statistics
MODIFY COLUMN stream_date DATE;

---------------------------------------------------------------

CREATE VIEW top5_songs AS
SELECT artist_name, song_name, round((sum(ms_played)/60000), 0) as time_played_in_minutes
FROM statistics
WHERE stream_date >= '2025-01-01' AND ms_played > 30000
GROUP BY artist_name, song_name
ORDER BY time_played_in_minutes DESC
LIMIT 5;

---------------------------------------------------------------

CREATE VIEW top5_artists AS
SELECT artist_name,  round((sum(ms_played)/60000), 0) AS time_played_in_minutes
FROM statistics
WHERE stream_date >= '2025-01-01' AND ms_played > 30000
GROUP BY artist_name
ORDER BY time_played_in_minutes DESC
LIMIT 5;

---------------------------------------------------------------

CREATE VIEW total_stream_time AS
SELECT round(sum(ms_played/60000), 0) AS total_stream_time_in_minutes
FROM statistics
WHERE stream_date >= '2025-01-01' AND ms_played >= 30000;

---------------------------------------------------------------

CREATE VIEW stream_time_history AS
SELECT date_format(stream_date, '%m') AS month, round(sum(ms_played)/60000, 0) AS stream_time
FROM statistics
WHERE ms_played >= 30000 AND stream_date >= '2025-01-01'
GROUP BY month
ORDER BY month;

---------------------------------------------------------------

CREATE VIEW longest_listening_day AS
SELECT stream_date, round(sum(ms_played)/60000, 0) AS stream_time
FROM statistics
WHERE ms_played >= 30000 AND stream_date >= '2025-01-01'
GROUP BY stream_date
ORDER BY stream_time DESC
LIMIT 1;





