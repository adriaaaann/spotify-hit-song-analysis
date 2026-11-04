# The Anatomy of a Hit Song

## Overview

An exploratory data analysis project using SQL and DuckDB to investigate Spotify tracks and explore how popularity relates to audio features, track duration, explicit content, and genre.

The project focuses on identifying patterns associated with popular tracks and understanding how different analytical approaches can reveal insights into music popularity.

## Objectives

- Profile the Spotify tracks dataset and assess data quality.
- Explore the distribution of track popularity.
- Investigate relationships between popularity and audio features.
- Compare popularity and audio characteristics across genres.
- Examine track duration and explicit-content differences.

## Dataset

- **Source:** [Spotify Tracks Dataset — Kaggle](https://www.kaggle.com/datasets/maharshipandya/-spotify-tracks-dataset)
- **Initial row count:** 114,000
- **Genres:** 114
- **Format:** CSV

The dataset is not included in this repository. Download it from Kaggle and place the CSV at `data/spotify_tracks.csv` to run the SQL scripts.

## Tools

- SQL
- DuckDB
- Git and GitHub

## Project Structure

```text
spotify-hit-song-analysis/
├── data/                               # Local dataset (not tracked)
├── sql/
│   ├── 01_data_profiling.sql
│   ├── 02_data_quality_checks.sql
│   ├── 03_missing_metadata.sql
│   ├── 04_popularity_analysis.sql
│   ├── 05_audio_feature_analysis.sql
│   └── 06_genre_popularity_analysis.sql
├── .gitignore
└── README.md
```

## Analysis and Progress

### 1. Initial Data Profiling

- Confirmed 114,000 rows and 114 genres.
- Identified 89,741 distinct track IDs.
- Calculated popularity statistics:
  - Minimum: 0
  - Maximum: 100
  - Mean: 33.24
  - Median: 35
- Identified repeated track IDs and missing metadata.

### 2. Data Quality Investigation

- Investigated repeated track IDs and their associated genre labels.
- Compared track metadata across repeated IDs.
- Identified missing track and artist metadata.
- Investigated zero-duration records and unusually long tracks.
- Created a clean analytical view excluding the unnecessary `column00` column.

### 3. Popularity Analysis

Defined a working hit threshold of **popularity >= 55**.

- Compared the distribution of popularity scores.
- Classified tracks into popularity bands.
- Compared hit and non-hit tracks.
- Identified 21,992 hit rows, representing approximately 19.3% of the dataset.

### 4. Audio Feature Analysis

Compared average audio characteristics between hit and non-hit tracks.

| Audio Feature    | Hit Tracks | Non-Hit Tracks |
| ---------------- | ---------: | -------------: |
| Danceability     |      0.588 |          0.562 |
| Energy           |      0.637 |          0.642 |
| Valence          |      0.469 |          0.475 |
| Acousticness     |      0.285 |          0.322 |
| Instrumentalness |      0.095 |          0.171 |
| Speechiness      |      0.076 |          0.087 |

Danceability showed a positive difference among hit tracks, while instrumentalness showed the largest absolute difference.

These results describe associations in the dataset and do not establish causation.

### 5. Genre Popularity Analysis

Compared average popularity and hit percentages across 114 genres.

Selected genres were investigated further using distinct track IDs to avoid repeated rows influencing the comparison.

| Genre    | Average Popularity | Hit Tracks | Hit Percentage |
| -------- | -----------------: | ---------: | -------------: |
| pop-film |              59.28 |        939 |            94% |
| pop      |              47.90 |        644 |            65% |
| chill    |              53.70 |        619 |            62% |
| k-pop    |              56.91 |        593 |            59% |

Key findings:

- Pop has a lower average popularity than k-pop but a higher hit percentage.
- Pop-film has the highest hit percentage among the four selected genres.
- Average popularity and hit percentage provide different perspectives on genre performance.
- Repeated track IDs were investigated to ensure the selected genre comparisons used unique tracks.

## Key Analytical Decisions

- **Hit definition:** Tracks with popularity scores of 55 or higher.
- **Duplicate handling:** Repeated track IDs were investigated rather than automatically deleted.
- **Genre comparisons:** Unique track IDs were used within each selected genre.
- **Data preparation:** The original dataset was preserved, with a separate analytical view used for querying.

## Project Status

In progress. Further analysis will investigate relationships between genre-specific audio features, popularity, track duration, and explicit content.
