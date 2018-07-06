\cleardoublepage
\pagestyle{scrheadings}
\cleardoublepage
\chapter{Discussion}\label{ch:discussion}

This section attempts to look more closely at the proof-of-concept results provided in \autoref{ch:proof}, and discusses finer details pertaining to the data, design decisions and methods used, including challenges faced along the way. It is structured in a way that separates the output of the system from the data and implementation methods.


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


The ability to compare information derived from 6+ weeks of data with 10\acs{m} spatial resolution from 3 different years for an area of 10,000\acs{km}² within 30 minutes is quite something.


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

## Challenges


# Discussion of Data

The only data used in this implementation were Sentinel-2 \ac{L1C} data, and information layers generated from them. For detecting objects larger than 8 pixels (e.g 800\acs{m}²) the 10\acs{m} resolution is likely sufficient.


## ESA Cloud-Masks

Scene related quality information is offered with Sentinel-2 products, including an automatically generated cloud cover mask. This mask is used to calculate the average cloud cover for the scene. The algorithms used to calculate this mask are proprietary and not freely or openly available.

There was a consideration at some point to include a rasterised version of the cloud masks that are provided, but the quality seemed not to be reliable and fairly inconsistent. There are many different kinds of clouds and not all of them are detectable by the algorithm being used, probably because \ac{ESA} wants to reduce false positives (i.e. incorrectly labeling a pixel as being clouded) and only provide results that are very certain to be true. Thin clouds, for example, are often not masked as clouds, but provide plenty of problems for analysis.

Further examination of the existing cloud masks must be conducted in order to rule out incorporation. Even if the masks do not include all of the cloud cover, if the pixels that are masked are, in fact, quite often correct, then they could be compared with the cloud-like semi-concepts to improve confidence. They could also be incorporated in some way to establish a layer of likelihood that the pixels labeled as being cloud-like are actually clouds, but without knowing how the \ac{ESA} algorithm works, this makes little sense.


## ESA Level-2A

Images must to be calibrated from digital numbers to at least \ac{ToA} reflectances in order to be comparable to each other. \ac{SIAM} requires data to be calibrated to at least \ac{ToA} reflectance in order to generate meaningful output. Sentinel-2 data are offered as \ac{ESA} \ac{L1C}, which means they are calibrated to \ac{ToA}. While still considered open data, the pre-processing algorithms applied to the \ac{EO} data provided by the Copernicus programme are not open, but proprietary. This has many implications for understanding the basis of scientific analysis conducted with them, because these pre-processing steps are not transparent.

Including a robust, reliable and automated method for calibrating the images to \ac{BoA} or \ac{SURF} might improve pre-classification results. This sort of calibration ultimately requires data about the atmosphere at the moment of observation, which current methods can only approximate. This sometimes lead to undesirable or misleading output that is also not necessarily comparable between different images or different geographic or temporal locations.

At the time of writing, \ac{ESA} intends to start offering world-wide \ac{L2A} products, which include data calibrated to \ac{BoA} and a \ac{SCM}. These products are also generated using proprietary algorithms, which makes it difficult to decompose what processing has occurred and to ascertain an idea of quality, reliability and different kinds of variation (e.g. does it work well over snow?; does it work well in different climate zones? what is the variation of quality or reliability through space and time within the archive?). A further step to consider would be whether or not to include the \ac{L2A} data and \ac{SCM} in a data cube, as well as to test the ability of \ac{SIAM} to handle the data supposedly calibrated to \ac{BoA}.


## Challenges

- long path names
- swaths vs. granules
- projections if used in other areas
- data redundancy (keeping own copy) and size
- Sentinel-2 problem with pixel alignment


# Discussion of Methods

- why ODC
- why SIAM
- why Jupyter Notebooks
- why these specific SDG targets


## Acquisition

Since the automated workflow was implemented in January 2018, the download hub has seemed to be fairly stable. The Hub \ac{API} has also made data access fairly uncomplicated to automate. However, downloading data is the part of the automated workflow that takes the longest amount of time, and is the least reliable due to external factors (e.g. Internet connection, Hub status).

It might make sense to avoid downloading the original Sentinel-2 data entirely by processing the data with \ac{SIAM} where they are located, and only saving the generated information layers. However, this sort of set-up creates a bit of tension with the reproducibility of results. The Sentinel-2 data source is a huge and growing body of data, which is likely to not always be available everywhere for the entire duration of acquisition, but distributed among various mirrors. The Sentinel-2 archive is also about to be completely re-processed, which will replace the existing products that Sentinel-2-based analysis conducted up to now has relied on. These results will not be reproducible unless the researchers keep a copy of the data used for their analysis.


## Re-formatting


### No-Data Mask Generation \label{sec:nodata_mask}

The assumption that pixels with a value of 0 in any of the six Sentinel-2 bands used as input for \ac{SIAM}™ be excluded (i.e. no-data masking) may be faulty more often than assumed, but information on pixels not containing data for each band in an image is not yet supplied with Sentinel-2 products. Even if the image footprint is supplied in the metadata, each band’s measurements at the edge of an orbit swath are most often not identical. Pixels with a measured value of 0 in any of the six bands are thus excluded from semantic enrichment. The authors have found this assumption to prove useful in reducing faulty semi-concept assignment to pixels lacking valid data in any of the six bands within an image at a given time, for example, at the edge of an orbit swath. The authors are aware that the assumption may occasionally exclude meaningful information (i.e. when a valid measurement has a value of 0). Querying to test this assumption can, however, be done within the existing implementation, since the original Sentinel-2 bands are also indexed in the data cube. This will be conducted in the future to better assess the ramifications of this assumption.


## Pre-classification

- Why SIAM?

Multi-dimensional methods that are robust to redundant information are required to process and classify a time-series of multi-spectral scenes.

Current setups of reproducible research for \ac{EO} data cubes require significant time and financial investment, which generally limits them to larger institutions. The importance of reproducible, transferable, interoperable, automated and repeatable workflows to process, handle and analyse massive \ac{EO} data is becoming more apparent in a now data-rich world. With so much big data, it makes sense to avoid application-specific data (pre-)processing, which contradicts many big data principles.

An additional benefit to using \ac{SIAM}™ for generating generic semantic concepts is that it can be applied to data from multiple optical sensors as long as they have been calibrated to \acs{ToA} reflectance. Future incorporation of additional sensors would particularly expand the temporal extent of possible queries and analysis. Other EO data can also be incorporated (e.g. digital elevation model (DEM), gridded precipitation data) to further analysis possibilities.


- cloud or cloud shadow problem
"One critical issue in the optical data series processing is that preliminary cloud masking is required and also an accurate detection of haze conditions. In particular clouds make the optical data useless, while areas in the image affected by haze should be radiometrically corrected in order to avoid discarding of information.""

SRTM DSM inclusion for indicating terrain shadows (e.g. problems with water in the mountains).

- difficulties with shallow water due to high spectral variability [@tulbureSurfaceWaterExtent2016] -- also sometimes shallow water or smaller waterways may not be visible (e.g. under vegetation)


### Exclusion of Thermal Decision-rules

- no thermal band -- difficulty with clouds and bare-soil sometimes -- low impact on aggregated dynamics analysis in environments with low average cloud cover


- influence on proper cloud detection

- big EO data
- scalable -- perhaps add some sort of benchmark

## Data Cube

- Why ODC?


### Ingestion Tiling Scheme

At the moment, this implementation uses a tiling scheme of 10\acs{km} by 10\acs{km} by one moment in time. The idea behind this was to keep tiles smaller than **value** and to keep the amount of data that must be loaded in-memory low.

Tests on performance for different kinds of queries that prioritise different dimensions or different numbers of variables at once (e.g 33 semi-concepts, 96 semi-concepts, vegetation mask)


### GridWorkflow

- issue with mosaicing



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


## Pixel-based Analysis
- pixel-based vs. OBIA

In the other direction, pixels are also only representations of what a sensor captures. Moving beyond the constrictions related to pixels


## Repeatability and Reproducibility
- implementation
- importance of keeping all data used
- Queries and results
- Python environments
- Jupyter Notebooks
- open documentation in a framework such as OSF

[@corbaneMonitoringSyrianHumanitarian2016] conducted analysis using Google Earth Engine in order to ensure reproducibility. *Called GEE an open-source platform*


## Transferability
- can similar evidence be generated in other parts of the world?
- with other data/sensors?
- other spatial resolutions or temporal acquisition frequencies?
- other kinds of semantic enrichment?
- knowledge-based vs. sample-based algorithms


intercalibration with Landsat exist [@liIntercalibrationDMSPOLS2017]


# Research Questions

## Context

- What are some ways that \ac{EO} contributes or can be envisioned as contributing towards spatially-explicit evidence for \acp{SDG} indicators?
- What are some current examples of free and open \ac{EO}-based indicators or evidence for indicators?

## Implementation

- Is it possible to download Sentinel-2 data and to automatically enrich it semantically?
- Can all Sentinel-2 data available for a region be automatically incorporated in a semantically enriched data cube?
- Is the current hardware sufficient for such an automated workflow and queries?
- Are semi-concepts sufficient for ad-hoc semi-automated monitoring of vegetation and water dynamics over time?
- Is the \ac{ODC} software conducive to handling relatively simple semantic queries based on semi-concepts?
- Can information generated from querying vegetation or water semi-concepts utilising time be used in a meaningful way in the context of existing indicators?
- How does this information characterise changes to water and vegetation cover for the temporal extent of the implemented data cube?
- What sort of information is needed to better assess the quality and confidence of aggregated indicator-like results?

## Results

- Can differences in vegetation dynamics in agricultural areas be detected between Syria and Turkey using this implementation?
