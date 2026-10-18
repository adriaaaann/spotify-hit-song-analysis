-- Investigate duplicate track IDs and validate data quality

SELECT
    track_id,
    COUNT(DISTINCT(track_genre)) AS associated_genre
FROM 'data/spotify_tracks.csv'
GROUP BY track_id
HAVING associated_genre > 1
ORDER BY associated_genre DESC
LIMIT 10;

SELECT 
    track_id,
    track_name,
    artists,
    track_genre,
    popularity,
    danceability,
    energy
FROM 'data/spotify_tracks.csv'
WHERE track_id =  '6S3JlDAGk3uu3NtZbPnuhS'
ORDER BY track_genre;