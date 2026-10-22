SELECT
    CASE
        WHEN popularity >= 55 THEN 'hit_song'
        ELSE 'non_hit_song'
        END AS song_type,
    ROUND(AVG(energy),2)
FROM spotify_tracks_clean
GROUP BY song_type;



SELECT
    CASE
        WHEN popularity >= 55 THEN 'hit_song'
        ELSE 'non_hit_song'
        END AS song_type,
    ROUND(AVG(energy),3)
FROM spotify_tracks_clean
GROUP BY song_type;

SELECT
    CASE
        WHEN popularity >= 55 THEN 'hit_song'
        ELSE 'non_hit_song'
        END AS song_type,
    ROUND(AVG(energy),3) AS average_energy,
    ROUND(AVG(danceability),3) AS average_danceability,
    ROUND(AVG(valence),3) AS average_valence,
    ROUND(AVG(acousticness),3) AS average_acousticness,
    ROUND(AVG(instrumentalness),3) AS average_instrumentalness,
    ROUND(AVG(speechiness),3) AS average_speechiness
FROM spotify_tracks_clean
GROUP BY song_type;

SELECT
    588 - 562 AS danceability_difference,
    171 - 95 AS instrumentalness_difference;

