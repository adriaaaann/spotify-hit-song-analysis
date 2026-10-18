# The Anatomy of a Hit Song

## Overview

An exploratory data analysis project using SQL and DuckDB to investigate Spotify tracks and explore how popularity relates to audio features, track duration, explicit content, and genre.

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
├── data/                       # Local dataset (not tracked)
├── sql/
│   └── 01_data_profiling.sql
├── .gitignore
└── README.md
```

## Current Progress

### Initial data profiling

- Confirmed 114,000 rows and 114 genres.
- Identified 89,741 distinct track IDs.
- Calculated popularity statistics: minimum 0, maximum 100, mean 33.24, median 35.
- Detected repeated track IDs and identified missing values for further investigation.

These are preliminary profiling results. Further analysis will investigate duplicates, data quality, and relationships between track characteristics and popularity.

## Project Status

In progress.
