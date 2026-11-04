SELECT *
FROM spotify_tracks
WHERE
    track_name IS NULL 
    OR artists IS NULL;

SELECT
    track_name,
    COUNT(*) AS frequency
FROM spotify_tracks
WHERE track_id = '1kR4gIb7nGxHPI3D2ifs59'
GROUP BY track_name;

SELECT
    MIN(popularity) AS min_popularity,
    MAX(popularity) AS max_popularity,
    MIN(danceability) AS min_danceability,
    MAX(danceability) AS max_danceability, 
    MIN(energy) AS min_energy,
    MAX(energy) AS max_energy,
    MIN(duration_ms) AS min_duration,
    MAX(duration_ms) AS max_duration
FROM spotify_tracks;

SELECT
    track_id,
    track_name,
    artists,
    album_name,
    popularity,
    duration_ms,
    track_genre
FROM spotify_tracks
WHERE duration_ms = 0 
OR duration_ms = 5237295
ORDER BY duration_ms ASC;

SELECT
    COUNT(*) AS zero_duration_tracks
FROM spotify_tracks
WHERE duration_ms = 0;

CREATE OR REPLACE VIEW spotify_tracks_clean AS
    SELECT * EXCLUDE(column00)
FROM spotify_tracks;

SELECT COUNT(*) AS column_count
FROM (DESCRIBE spotify_tracks_clean);

SELECT COUNT(*)
FROM spotify_tracks_clean;