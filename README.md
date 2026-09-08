# AI & Academic Performance: Data Analysis in R

## Overview

This repository contains an individual data analysis project developed as part of my Master's degree in Business Intelligence (BDEEM) at Université Marie et Louis Pasteur.

The project explores the relationship between the use of AI-based learning tools and academic performance using a dataset of student characteristics, study habits and AI usage.

The analysis was conducted in R and combines data preparation, descriptive statistics, data visualisation and linear regression.

## Research question

Is the use of AI-based learning tools associated with students' academic performance?

The analysis focuses on:

- differences in final academic scores between AI users and non-users
- the relationship between AI usage time and final academic scores
- the role of daily study time when analysing this relationship

Because the dataset is observational, the results are interpreted as associations rather than causal effects.

## Methodology

The analysis includes:

- data import and exploration
- selection of relevant variables
- handling of missing values
- descriptive statistics
- comparison of AI users and non-users
- data visualisation
- linear regression analysis
- interpretation of statistical results

## Tools

R · tidyverse · ggplot2 · dplyr

## Repository structure

- `analysis.R`: complete R script used for the project
- `Figures/`: selected visual outputs from the analysis

## Data source

The analysis uses the Student Performance & Academic Trends Dataset obtained from Kaggle.

The dataset is not included directly in this repository. The R script documents the variables and analytical workflow used in the project.

## Key findings

### AI users vs. non-users

The descriptive analysis showed very similar average final scores between students who reported using AI tools and those who did not.

![Final Academic Score by AI Tool Usage](Figures/Figure%202.jpeg)

### AI usage intensity

The relationship between AI usage time and final academic score appears very weak, with substantial variation in academic performance across different levels of AI usage.

![AI Usage Time and Final Academic Score](Figures/Figure%203.jpeg)

The regression analysis found no statistically significant association between AI usage time and final academic score after accounting for daily study time.

These results highlight the importance of distinguishing statistical association from causal interpretation when analysing observational data.

## Author

Sabilia Djamaldiev  
Master Business Intelligence  
Behavioral & Digital Economics for Effective Management (BDEEM)  
Université Marie et Louis Pasteur
