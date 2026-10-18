DESCRIBE 'data/spotify_tracks.csv';

SELECT * FROM read_csv_auto ('data/spotify_tracks.csv');

-- Checking Column 00
SELECT
    MIN(column00),
    MAX(column00),
    COUNT (DISTINCT(column00))
FROM 'data/spotify_tracks.csv';

SELECT COUNT (*) AS total_tracks
FROM 'data/spotify_tracks.csv';

SELECT COUNT(DISTINCT(track_genre)) AS genre_count
FROM 'data/spotify_tracks.csv';


-- Count of Unique tracks and artists
SELECT 
    COUNT(DISTINCT(track_id)) AS unique_track_ids,
    COUNT(DISTINCT(artists)) AS unique_artists
FROM 'data/spotify_tracks.csv';


SELECT 
    track_id,
    COUNT(*) as appearances
FROM 'data/spotify_tracks.csv'
GROUP BY track_id
HAVING COUNT(*) > 1
ORDER BY appearances DESC 
LIMIT 10; 

SELECT
    MIN(popularity) AS popularity_min,
    MAX(popularity) AS popularity_max,
    ROUND(AVG(popularity),2) AS popularity_average,
    MEDIAN(popularity) AS popularity_median
FROM 'data/spotify_tracks.csv';

--Check for missing values

SELECT
   count(*) - count(track_name) AS missing_track_name,
   count(*) - count(artists) AS missing_artists,
   count(*) - count(popularity) AS missing_popularity,
   count(*) - count(duration_ms) AS missing_duration_ms,
   count(*) - count(track_genre) AS missing_track_genre
FROM 'data/spotify_tracks.csv';