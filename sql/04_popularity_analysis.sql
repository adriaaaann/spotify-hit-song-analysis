-- This file is used to contain queries to profile the popularity scores

SELECT
    COUNT(*) AS total_row_count,
    COUNT(popularity) AS popularity_values,
    MIN(popularity) AS min_popularity,
    MAX(popularity) AS max_popularity,
    AVG(popularity) AS average_popularity,
    MEDIAN(popularity) AS median_popularity 
FROM spotify_tracks_clean;

SELECT
    CASE
        WHEN popularity <= 19 THEN '0-19'
        WHEN popularity <= 39 THEN '20-39'
        WHEN popularity <= 59 THEN '40-59'
        WHEN popularity <= 79 THEN '60-79'
        WHEN popularity <= 100 THEN '80-100'
        END AS popularity_band,
        COUNT(*) band_count,
        ROUND(band_count/(SELECT COUNT(*) FROM spotify_tracks_clean)*100,1) AS percentage
FROM spotify_tracks_clean
GROUP BY popularity_band
ORDER BY popularity_band;

SELECT
    COUNT(*) AS hit_song_count,
     ROUND(hit_song_count/(SELECT COUNT(*) FROM spotify_tracks_clean)*100,1) AS hit_song_percentage,
     COUNT(DISTINCT(track_id)) AS unique_hit_songs
FROM spotify_tracks_clean
WHERE popularity >= 55;

SELECT
    CASE
        WHEN popularity >= 55 THEN 'hit_song'
        ELSE 'non_hit_song'
        END AS song_type,
    ROUND(AVG(danceability),2)
FROM spotify_tracks_clean
GROUP BY song_type;


