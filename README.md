# MIT 805 Group Project
## NYC TLC Trip Record Data - Congestion, Revenue, and Route Analysis

## Group members

- Shreya Bharat (19031786)
- Lerato Mokori (26834694)

## Description

The aim of this project was tot analyse the NYC Taxi and Limousine Commision (TLC) Yellow Taxi trip dataset using PySpark to answer the following research questions:

- **RQ1**: Where does congestion affect revenue the most?
- **RQ2**: Which routes are the most congested during peak travel times?

Congestion was measured as the time lost against an empirical free-flow baseline, and was then priced as the revenue lost per vehicle-hour.

## Repository structure

```
.
├── README.md
├── requirements.txt
├── data/
│   └── README.md
├── notebooks/
├── src/
├── output/
├── figures/
└── report/
```

## Dataset

- **Source** NYC TLC Trip Record Data (Yellow Taxi) - https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page
- **License** Governed by NYC.gov Terms of Use, and is publicly available to download
- **Format** Native Parquet, stored as monthly files across the four different swrvices (yellow, green, fhv, and fhvhv)

`data/working`, `data/cleaned_mothly`, and `data/filtered` are gitignored. The raw dataset size is documented, and the working dataset was too large to be commited to git. The `data/README.md` contains details on how to access the dataset. 

## Environment setup

Requires Python 3.10+, Java 17 or 21, and Apache spark 4.2.0 (installed via `pyspark` in `requirements.txt`)

```bash
python3 -m venv .venv
source .venv/bin/activate # Windows: .venv\Scripts\activate
pip install --upgrade pip
pip install -r requirements.txt
```

## How to reproduce the analysis

1. Download the working dataset using `notebooks/part1_data_collection.ipynb`
2. Clean the downloaded dataset using `notebooks/Data_cleaning_code.ipynb`
3. Conduct exploratory data analysis using `notebooks/part1_data_eda.ipynb`
4. Conduct the mapreduce tasks using `notebooks/part2_mapreduce.ipynb`
5. Run `notebooks/part2_analysis_and_visualization.ipynb` to generate results and insights

## Licence / data use

Dataset usage is governed by the NYC.gov Terms of Use. Data is used here
strictly for academic analysis, contains no personally identifiable
information, and is not redistributed in this repository.
