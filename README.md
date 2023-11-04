# Unsupervised Learning Homework Solution

This repository contains my homework solution for the Unsupervised Learning course at HTWG Konstanz.

## Project Description

This project focused on clustering data to align as closely as possible with the true categories of animal species. The dataset `unlabeled_animal_data.csv` contains measurements of 342 animals across several different metrics. The primary goal was to segment these animals into three distinct species groups, assessing the clustering quality by comparing it with the true labels provided in the second column of the dataset.

The project applies two clustering algorithms:

-   k-means
-   DBSCAN

## Data Preprocessing

Before clustering, data preprocessing was performed, taking into account whether to reduce the dimensionality and which input values to use. This included standardizing the measurement values and potentially reducing input dimensions to achieve meaningful clusters.

## Dataset Structure

The `unlabeled_animal_data.csv` dataset is structured as follows:

1. Dataset Number
2. Label (Animal species: 1, 2, or 3) - Not used for clustering analysis.
3. Categorical Value (translated to 1, 2, or 3)
4. Measurement Value
5. Measurement Value
6. Measurement Value
7. Measurement Value
8. Categorical Value (translated to 1, 2, or 3)
9. Measurement Value

The measurement values are quantitative metrics like weight, while the categorical values have been transformed into discrete numbers suitable for algorithmic processing.
