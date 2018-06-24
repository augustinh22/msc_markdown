\cleardoublepage
\pagestyle{scrheadings}
\cleardoublepage
\chapter{Discussion}\label{ch:discussion}

# Interpretation of Results

- Discuss relevance of results in context of validation/validity


## Auxiliary data

- Irrigated Areas (GMIA or Irrmap)
- Syria Refugee Sites (<https://data.humdata.org/dataset/syria-refugee-sites>)
- Precipitation or drought data
- mention acquisition/ingestion, etc. or reference below

- INFORM, Index of Risk Management database
- HDX, humanitarian data exchange <https://data.hdx.rwlabs.org>
- Relief web
- ACLED
- GDELT

world-weather.online.com
unma.go


### \ac{ToA} vs. \ac{BoA} vs. \ac{SURF} calibration

-- importance for analysis -- comparability


## European Space Agency Level 1C - Level 2A

While still considered open, it is important to note that the pre-processing algorithms applied to the \ac{EO} data provided by the Copernicus programme are not open, but proprietary. -- implications for transparency, re-processing, reproducibility...

At the time of writing, ESA intends to start offering world-wide Level-2A products. Can these be included in a similar implementation?

# Discuss situation of implementation in larger Framework
- SDGs
- open data
- big earth data
- data cubes and ARD
- Reproducibility


The concept of \ac{ARD} (***see*** section \ref{sec:ARD}) is relevant in the context of this thesis, since a data cube is provided allowing access to data with user-defined grids and generic semantic enrichment suitable for multiple kinds of analysis using semantic queries. Depending on how \ac{ARD} is defined, the created \ac{ODC} implementation could be considered as analysis-ready. Semi-concepts provide an automated semi-semantic layer that under current circumstances, could be considered as moving towards semantically enriched \ac{ARD}.

# Discussion of Methods

- (incl. challenges, successes, reconsiderations and shortcomings)

- no thermal band -- difficulty with clouds and bare-soil sometimes -- low impact on aggregated dynamics analysis in environments with low average cloud cover

## Benchmarks
- Report time of daily updates, and estimate average time needed per granule.
  - download
  - prep for SIAM
  - SIAM processing
  - indexing
  - ingestion
- estimate time needed to rebuild data cube at time of writing including all new downloads...)
- query times for results




## Ingestion Tiling Scheme


## Repeatability and Reproducibility
- implementation
- Queries and results
- Python environments
- Jupyter Notebooks

[@corbaneMonitoringSyrianHumanitarian2016] conducted analysis using Google Earth Engine in order to ensure reproducibility. *Called GEE an open-source platform*


## Transferability
- can similar evidence be generated in other parts of the world?
- with other data/sensors?
- other spatial resolutions or temporal acquisition frequencies?
- other kinds of semantic enrichment?
- knowledge-based vs. sample-based algorithms


## Challenges


### Processing Limitations
One challenge is that processing using the Python API occurs predominantly using in-memory data. This complicates implementation on the current hardware as it requires to load the complete dataset prior to analysis and is a limitation for smaller institutions. Even if many processes can be chunked, not all processes lend themselves to be divided as such, or may produce similar but differing results (e.g. in the case of data-dependency in image-wide analyses).

### Limitations of analysis
What semi-concepts are difficult?
What doesn't work?
(Less arid areas)
(conflation of shadows and water in mountainous regions -- lack of thermal band)

### Data
- Sentinel-2 problem with pixel alignment
- swaths vs. granules
- projections if used in other areas
- data redundancy (keeping own copy) and size


### Pre-Classification


### Pixel-based Analysis
- pixel-based vs. OBIA






## GI_Forum Paper extract

4.1 Semantic data cube

The largest benefit of the semantic data cube implemented here is that it fully automates data acquisition, semantic enrichment and access to data ready for analysis. Generic, application-independent semantic enrichment allows queries and EO-based indicator extraction for a variety of thematic tasks, and ensures reproducible results and repeatable analysis. An additional benefit to using SIAM™ is that it can be applied to data from multiple optical sensors, as long as they have been calibrated to TOA reflectance. Future incorporation of additional sensors would particularly expand the temporal extent of possible queries and analysis. Other EO data can also be incorporated (e.g. digital elevation model (DEM), gridded precipitation data) to further analysis possibilities.



The assumption that pixels with a value of 0 in any of the six Sentinel-2 bands used as input for SIAM™ be excluded (i.e. no-data masking) may be faulty more often than assumed, but information on pixels not containing data for each band in an image is not yet supplied with Sentinel-2 products. Even if the image footprint is supplied in the metadata, each band’s measurements at the edge of an orbit swath are most often not identical. Pixels with a measured value of 0 in any of the six bands are thus excluded from semantic enrichment. The authors have found this assumption to prove useful in reducing faulty semi-concept assignment to pixels lacking valid data in any of the six bands within an image at a given time, for example, at the edge of an orbit swath. The authors are aware that the assumption may occasionally exclude meaningful information (i.e. when a valid measurement has a value of 0). Querying to test this
assumption can, however, be done within the existing implementation, since the original Sentinel-2 bands are also indexed in the data cube. This will be conducted in the future to better assess the ramifications of this assumption.

4.2 Applications
Many new applications exist or are being envisioned for EO data cubes. These applications range from creating custom mosaics or composites (i.e. most recent cloud free over a user defined time span, seasonal composites), to various time-series analyses. Much research has been invested in looking at the dynamics of water. Surface water is a feature that can be relatively well discerned from other types of land cover, whether using radar or optical data sources. Mueller et al. (2016) analysed 25 years of Landsat data using an implementation of the ODC, calculating a pixel-based normalised percentage of water detection, excluding no-data and clouds. Figure ## demonstrates a similar method applied to the semantic data cube implemented here, but using water-like semi-concepts from SIAM™ instead of the Australian water detection algorithm (i.e. Water Observation from Space). Here, pixels masked as no-data as well as cloud-like and unclassified semi-concepts have been excluded from analysis such that only pixels deemed clear observations are included and considered valid. It shows the normalised percentage of water semi-concept pixels related to other valid semi-concepts (e.g. vegetation-like) from January 31, 2016 to January 31, 2018, which is from a total of 103 observations along the dimension of time.

Another similar application was completed by a global JRC study of water, but using Google Earth Engine (Pekel et al., 2016). The results calculated in this product are not produced in an automated way, unlike analysis using the Australian ODC and ODC implementation featured in this paper, so the most recent results available are from 2015. The results are, however, global.

In the presented implementation, all of these application areas and many more can be covered based on user-generated queries without requiring re-processing the original data. The generic initial semantic enrichment in conjunction with flexible queries through time allows inferring new information layers or higher semantic levels (see Tiede et al., 2017).

One planned application of the approach presented here will complement and greatly extend an initial example based on Landsat data and SIAM™ semi-concepts by Tiede, Lüthje, & Baraldi (2014), which introduced an automated post-classification change detection related to vegetation. More specifically, it focused on irrigated agriculture in Syria following the beginning of the still on-going conflict as an
indicator of conflict related changes. This particular example could greatly benefit from access to an automated, reproducible data cube infrastructure, moving away from bi-temporal change towards incorporating data in a temporally dense way over the period of interest, either within one year, or between multiple years. Such a shift inherently moves in the direction of developing indicators based on various sources of evidence to support decision-making.

![Normalised water detection based on water semi-concepts in Syria near the border of Turkey, excluding no-data, cloud like and unclassified pixels from January 31, 2016 until January 31, 2018 (103 time observations). Method similar to Mueller et al. (2016).](source/figures/water_edit.png)
