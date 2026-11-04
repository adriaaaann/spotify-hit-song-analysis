-- Investigate duplicate track IDs and validate data quality

CREATE OR REPLACE VIEW spotify_tracks AS
SELECT *
FROM 'data/spotify_tracks.csv';

SELECT
    track_id,
    COUNT(DISTINCT(track_genre)) AS associated_genre
FROM spotify_tracks
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
WHERE track_id =  '2Ey6v4Sekh3Z0RUSISRosD'
ORDER BY track_genre;

SELECT
    track_id,
    COUNT(*) AS frequency,
    COUNT(DISTINCT(track_name)) AS associated_name_count,
    COUNT(DISTINCT(artists)) AS associated_artist_count,
    COUNT(DISTINCT(popularity)) AS associated_popularity_values,
    COUNT(DISTINCT(duration_ms)) AS associated_duration_values,
    COUNT(DISTINCT(danceability)) AS associated_danceability_scores,
    COUNT(DISTINCT(energy)) AS associated_energy_scores,
    COUNT(DISTINCT(valence)) AS associated_valence_scores,
    COUNT(DISTINCT(tempo)) AS associated_tempo_values
FROM 'data/spotify_tracks.csv'
GROUP BY track_id
HAVING frequency > 1
ORDER BY frequency DESC
LIMIT 10;

SELECT
    COUNT(*) FILTER(WHERE TRIM(track_name) = '') AS empty_track_names,
    COUNT(*) FILTER(WHERE TRIM(artists) = '') AS empty_artists_names,
    COUNT(*) FILTER(WHERE TRIM(album_name) = '') AS empty_album_names,
    COUNT(*) FILTER(WHERE TRIM(track_genre) = '') AS empty_track_genre
FROM spotify_tracks;

/*

Cleaning strategy

1. Preserve repeated track IDs because different genre
   labels provide useful information for genr e-level analysis.
   Avoid treating every repeated ID as an erroneous duplicate.

2. Investigate records with missing track names or artist
   values before deciding whether to exclude them from
   specific analyses.

3. No empty or whitespace-only values were found in
   track_name, artists, album_name, or track_genre.

4. Preserve the original CSV as the raw source.
   Exclude column00 from analytical queries or a cleaned
   view because it appears to be a sequential row index
   with no clear analytical value.

*/