SELECT
    track_genre,
    ROUND(AVG(popularity),2) AS genre_popularity,
    COUNT (*) AS count_of_tracks,
    COUNT(CASE
        WHEN popularity >= 55 THEN 'hit_song'
        END) AS hit_tracks
FROM spotify_tracks_clean
GROUP BY track_genre
ORDER BY hit_tracks DESC
LIMIT 10;

SELECT
    track_genre,
    ROUND(AVG(popularity),2) AS genre_popularity,
    COUNT (*) AS count_of_tracks,
    COUNT(CASE
        WHEN popularity >= 55 THEN 'hit_song'
        END) AS hit_tracks,
    ROUND((hit_tracks/count_of_tracks*100 ),2) AS hit_percentage
FROM spotify_tracks_clean
GROUP BY track_genre
ORDER BY hit_tracks DESC
LIMIT 10;

SELECT
    track_genre,
    COUNT(*) AS total_rows,
    COUNT(DISTINCT track_id) AS unique_tracks,
    (total_rows - unique_tracks) AS difference
FROM spotify_tracks_clean
WHERE track_genre IN ('pop-film','pop','chill','k-pop')
GROUP BY track_genre;

WITH distinct_spotify_tracks AS(
    SELECT DISTINCT
        track_genre,
        track_id,
        popularity
    FROM spotify_tracks_clean
    WHERE track_genre IN ('pop-film', 'pop', 'k-pop', 'chill')  
)

SELECT 
    track_genre,
    track_id,
    COUNT(DISTINCT(popularity)) AS popularity_value_count
FROM distinct_spotify_tracks
GROUP BY track_genre, track_id
HAVING popularity_value_count >1;


WITH distinct_spotify_tracks AS(
    SELECT DISTINCT
        track_genre,
        track_id,
        popularity
    FROM spotify_tracks_clean
    WHERE track_genre IN ('pop-film', 'pop', 'k-pop', 'chill')  
)

SELECT
    track_genre,
    ROUND (AVG(popularity),2) AS unique_track_popularity,
    COUNT(*) AS unique_track_count,
    COUNT (CASE WHEN popularity >= 55 THEN 'hit_songs' END) AS unique_hit_tracks,
    ROUND (unique_hit_tracks/unique_track_count*100,2) AS hit_percentage
FROM distinct_spotify_tracks
GROUP BY track_genre
ORDER BY hit_percentage DESC;


