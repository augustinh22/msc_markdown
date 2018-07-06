\cleardoublepage
\pagestyle{scrheadings}
\cleardoublepage
\chapter{Discussion}\label{ch:discussion}

This section attempts to look more closely at the proof-of-concept results provided in \autoref{ch:proof}, and discuss finer details pertaining to the data, design decisions and methods used, including challenges faced along the way.


# Interpretation of Maps

- Discuss relevance of results in context of validation/validity

- include all 4 maps (index of persistence, total clean, total valid, number of invalid) -- discuss this as a way to better interpret the complexity of the result.

- important also to know "when" changes happen, especially over longer aggregated indices -- what was the longest duration of time a concept was observed as being stable (however defined), how frequently did the semi-concept change to a concept considered different for the intended analysis

- inclusion of some measure of confidence for observations []

- output cannot be validated in big data domains -- validation of methods and source data.

- existing water indicator -- [http://eo4sdg.org/wp-content/uploads/2017/07/SDG6.6.1\_brief\_GEO\_Week\_2017-2.pdf]this implementation offers a way to use Sentinel-2 images to extract water extent at 10m spatial resolution and higher temporal frequencey, which may be necessary for certain applications in comparison to extraction with Landsat-8 imagery.

is this relevant for monitoring/detecting spatially-explicit evidence of humanitarian crisis?


Sentinel-2 data is only available starting June 2015, so comparison to pre-conflict images are only available from Landsat, which is beyond the scope of this thesis, even if methods for intercalibration exist [@liIntercalibrationDMSPOLS2017]. However, as previously mentioned, even if Sentinel-2 data was available before 2015, the presence of intense drought starting around 2007 definitely caused land cover change, but limits the ability to attribute changes to possibly being related to conflict.

- contrast to results produced in the I3 project -- simple change between two images. These analysis methods open the door to being able to characterise temporal variability.


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

## Discuss situation of implementation in larger Framework
- SDGs
- open data
- big earth data
- data cubes and ARD
- Reproducibility


The concept of \ac{ARD} (***see*** section \ref{sec:ARD}) is relevant in the context of this thesis, since a data cube is provided allowing access to data with user-defined grids and generic semantic enrichment suitable for multiple kinds of analysis using semantic queries. Depending on how \ac{ARD} is defined, the created \ac{ODC} implementation could be considered as analysis-ready. Semi-concepts provide an automated semi-semantic layer that under current circumstances, could be considered as moving towards semantically enriched \ac{ARD}.


# Discussion of Data

### \ac{ToA} vs. \ac{BoA} vs. \ac{SURF} calibration

-- importance for analysis -- comparability


## European Space Agency Level 1C - Level 2A

While still considered open, it is important to note that the pre-processing algorithms applied to the \ac{EO} data provided by the Copernicus programme are not open, but proprietary. -- implications for transparency, re-processing, reproducibility...

At the time of writing, ESA intends to start offering world-wide Level-2A products. Can these be included in a similar implementation?

### Data
- Sentinel-2 problem with pixel alignment
- swaths vs. granules
- projections if used in other areas
- data redundancy (keeping own copy) and size


# Discussion of Methods

- why ODC

- why SIAM

- why Jupyter Notebooks

- why these specific SDG targets


## No-Data Mask Generation \label{sec:nodata_mask}

The assumption that pixels with a value of 0 in any of the six Sentinel-2 bands used as input for \ac{SIAM}™ be excluded (i.e. no-data masking) may be faulty more often than assumed, but information on pixels not containing data for each band in an image is not yet supplied with Sentinel-2 products. Even if the image footprint is supplied in the metadata, each band’s measurements at the edge of an orbit swath are most often not identical. Pixels with a measured value of 0 in any of the six bands are thus excluded from semantic enrichment. The authors have found this assumption to prove useful in reducing faulty semi-concept assignment to pixels lacking valid data in any of the six bands within an image at a given time, for example, at the edge of an orbit swath. The authors are aware that the assumption may occasionally exclude meaningful information (i.e. when a valid measurement has a value of 0). Querying to test this assumption can, however, be done within the existing implementation, since the original Sentinel-2 bands are also indexed in the data cube. This will be conducted in the future to better assess the ramifications of this assumption.


## Pre-classification

An additional benefit to using \ac{SIAM}™ for generating generic semantic concepts is that it can be applied to data from multiple optical sensors as long as they have been calibrated to \acs{ToA} reflectance. Future incorporation of additional sensors would particularly expand the temporal extent of possible queries and analysis. Other EO data can also be incorporated (e.g. digital elevation model (DEM), gridded precipitation data) to further analysis possibilities.


- (incl. challenges, successes, reconsiderations and shortcomings)

- no thermal band -- difficulty with clouds and bare-soil sometimes -- low impact on aggregated dynamics analysis in environments with low average cloud cover

- cloud or cloud shadow problem
"One critical issue in the optical data series processing is that preliminary cloud masking is required and also an accurate detection of haze conditions. In particular clouds make the optical data useless, while areas in the image affected by haze should be radiometrically corrected in order to avoid discarding of information.""

SRTM DSM inclusion for indicating terrain shadows (e.g. problems with water in the mountains).

- difficulties with shallow water due to high spectral variability [@tulbureSurfaceWaterExtent2016] -- also sometimes shallow water or smaller waterways may not be visible (e.g. under vegetation)


- big EO data
- scalable -- perhaps add some sort of benchmark

Current setups of reproducible research for \ac{EO} data cubes require significant time and financial investment, which generally limits them to larger institutions. The importance of reproducible, transferable, interoperable, automated and repeatable workflows to process, handle and analyse massive \ac{EO} data is becoming more apparent in a now data-rich world. With so much big data, it makes sense to avoid application-specific data (pre-)processing, which contradicts many big data principles.

## Benchmarks
- Report time of daily updates, and estimate average time needed per granule.
  - download
  - prep for SIAM
  - SIAM processing
  - indexing
  - ingestion
- estimate time needed to rebuild data cube at time of writing including all new downloads...)
- query times for results



a few years after  particularly irrigated agriculture, might provide insight
- list current relevant indicators/studies
- lack of data or lack of data reliability
- development of situational awareness for conflict documentation but also assessment of conflict impacts and various global initiatives


## Ingestion Tiling Scheme


## Challenges


### Method of validation/agreement

- random samples and an external dataset


### Processing Limitations
One challenge is that processing using the Python API occurs predominantly using in-memory data. This complicates implementation on the current hardware as it requires to load the complete dataset prior to analysis and is a limitation for smaller institutions. Even if many processes can be chunked, not all processes lend themselves to be divided as such, or may produce similar but differing results (e.g. in the case of data-dependency in image-wide analyses).

### Limitations of analysis
What semi-concepts are difficult?
What doesn't work?
(Less arid areas)
(conflation of shadows and water in mountainous regions -- lack of thermal band)

sampling intervals, which are severely limited by both technological and environmental factors (e.g. orbits, cloud coverage).


### Pre-Classification

Multi-dimensional methods that are robust to redundant information are required to process and classify a time-series of multi-spectral scenes.

### Pixel-based Analysis
- pixel-based vs. OBIA


### Repeatability and Reproducibility
- implementation
- Queries and results
- Python environments
- Jupyter Notebooks
- open documentation in a framework such as OSF

[@corbaneMonitoringSyrianHumanitarian2016] conducted analysis using Google Earth Engine in order to ensure reproducibility. *Called GEE an open-source platform*


### Transferability
- can similar evidence be generated in other parts of the world?
- with other data/sensors?
- other spatial resolutions or temporal acquisition frequencies?
- other kinds of semantic enrichment?
- knowledge-based vs. sample-based algorithms


intercalibration with Landsat exist [@liIntercalibrationDMSPOLS2017]
