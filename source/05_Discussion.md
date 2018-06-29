\cleardoublepage
\pagestyle{scrheadings}
\cleardoublepage
\chapter{Discussion}\label{ch:discussion}


# Interpretation of Results

- Discuss relevance of results in context of validation/validity

- include all 4 maps (index of persistence, total clean, total valid, number of invalid) -- discuss this as a way to better interpret the complexity of the result.

- important also to know "when" changes happen, especially over longer aggregated indices -- what was the longest duration of time a concept was observed as being stable (however defined), how frequently did the semi-concept change to a concept considered different for the intended analysis

- inclusion of some measure of confidence for observations []

- output cannot be validated in big data domains -- validation of methods and source data.

- existing water indicator -- [http://eo4sdg.org/wp-content/uploads/2017/07/SDG6.6.1\_brief\_GEO\_Week\_2017-2.pdf]this implementation offers a way to use Sentinel-2 images to extract water extent at 10m spatial resolution and higher temporal frequencey, which may be necessary for certain applications in comparison to extraction with Landsat-8 imagery.

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

- why ODC

- why SIAM

- why Jupyter Notebooks

- why these specific SDG targets



- (incl. challenges, successes, reconsiderations and shortcomings)

- no thermal band -- difficulty with clouds and bare-soil sometimes -- low impact on aggregated dynamics analysis in environments with low average cloud cover

- cloud or cloud shadow problem

SRTM DSM inclusion for indicating terrain shadows (e.g. problems with water in the mountains).

- difficulties with shallow water due to high spectral variability [@tulbureSurfaceWaterExtent2016] -- also sometimes shallow water or smaller waterways may not be visible (e.g. under vegetation)


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

sampling intervals, which are severely limited by both technological and environmental factors (e.g. orbits, cloud coverage).

### Data
- Sentinel-2 problem with pixel alignment
- swaths vs. granules
- projections if used in other areas
- data redundancy (keeping own copy) and size


### Pre-Classification

Multi-dimensional methods that are robust to redundant information are required to process and classify a time-series of multi-spectral scenes.

### Pixel-based Analysis
- pixel-based vs. OBIA



## GI_Forum Paper extract

4.1 Semantic data cube

The largest benefit of the semantic data cube implemented here is that it fully automates data acquisition, semantic enrichment and access to data ready for analysis. Generic, application-independent semantic enrichment allows queries and EO-based indicator extraction for a variety of thematic tasks, and ensures reproducible results and repeatable analysis. An additional benefit to using SIAM™ is that it can be applied to data from multiple optical sensors, as long as they have been calibrated to TOA reflectance. Future incorporation of additional sensors would particularly expand the temporal extent of possible queries and analysis. Other EO data can also be incorporated (e.g. digital elevation model (DEM), gridded precipitation data) to further analysis possibilities.


The assumption that pixels with a value of 0 in any of the six Sentinel-2 bands used as input for SIAM™ be excluded (i.e. no-data masking) may be faulty more often than assumed, but information on pixels not containing data for each band in an image is not yet supplied with Sentinel-2 products. Even if the image footprint is supplied in the metadata, each band’s measurements at the edge of an orbit swath are most often not identical. Pixels with a measured value of 0 in any of the six bands are thus excluded from semantic enrichment. The authors have found this assumption to prove useful in reducing faulty semi-concept assignment to pixels lacking valid data in any of the six bands within an image at a given time, for example, at the edge of an orbit swath. The authors are aware that the assumption may occasionally exclude meaningful information (i.e. when a valid measurement has a value of 0). Querying to test this assumption can, however, be done within the existing implementation, since the original Sentinel-2 bands are also indexed in the data cube. This will be conducted in the future to better assess the ramifications of this assumption.

4.2 Applications
Many new applications exist or are being envisioned for EO data cubes. These applications range from creating custom mosaics or composites (i.e. most recent cloud free over a user defined time span, seasonal composites), to various time-series analyses. Much research has been invested in looking at the dynamics of water. Surface water is a feature that can be relatively well discerned from other types of land cover, whether using radar or optical data sources.


More specifically, it focused on irrigated agriculture in Syria following the beginning of the still on-going conflict as an
indicator of conflict related changes. This particular example could greatly benefit from access to an automated, reproducible data cube infrastructure, moving away from bi-temporal change towards incorporating data in a temporally dense way over the period of interest, either within one year, or between multiple years. Such a shift inherently moves in the direction of developing indicators based on various sources of evidence to support decision-making.


#### Taken from elsewhere...

Lower spatial, but higher temporal and spectral resolution and the larger areas covered require a higher degree of automation in information extraction using automated-prior-knowledge based classification procedures ready for Big Earth Data as well as a shift from "direct" information extraction to indicator approaches

Highly automated large-scale indicator extraction
Combination of prior-knowledge based parameter free classification procedures in combination with automatic change detection methods – aiming for fully automated workflows ready for big data.

With regards to Earth Observation, the “free, full and open data” policy promoted by Copernicus and GEOSS, has enabled the emergence of the “Big Earth Observation Data” era, whereby large volumes of data received each day from different sensors on-board satellites (especially Sentinel and Landsat constellations) can be exploited towards the delivery of timely information in support of decision making and operations for users requiring fast responses. The challenge in the case of this unprecedented opportunity is no longer related to accessing the data but rather to the effective and efficient extraction of the wealth of available information it offers.
- supporting situational awareness for emergency responders and other actors on the ground;
- analysing indirect impacts of global trends such as demographic changes, environmental degradation, climate change, and land issues related to conflicts;
- monitoring the state and vulnerability of natural strategic assets and critical infrastructures as a given crisis develops;

In such a way EO is now providing stacks of observations, providing persistent monitoring over a region (persistent meant as continuing in time with suitable sampling to detect variability patterns); such datasets represent a big challenge in terms of analysis, demanding for the application of automated analytic technologies to derive meaningful information (Big Space Data).

Temporal information is currently not readily exploitable in the EO image databases such as the USGS Earth Explorer or the Sentinels Scientific Data Hub itself.

Extracting information from time series is difficult due to the volume, velocity and variety of EO images.

Different sensors, different acquisition times or dates and the variety of characteristics of natural phenomena adds additional complexity.

The development of new methods, which are going beyond traditional change detection, are on its way: Usually change detection is conducted as a pairwise comparison of EO images (Singh 1989, Petitjean et al. (2012), Guyet and Nicolas (2016)). In contrast, long EO image time series analyses – needed for constant monitoring purposes - aim at classifying and analysing the trajectory of radiation at a location on the Earth (Petitjean et al. 2012). Both have in common that they require significant change of detectable radiance values between images that are due to real and actual changes on the Earth’s surface (Singh 1989). In addition, algorithms for big EO data analysis need near full automation to be applicable and usable on the large amount of data sets. Today techniques, methods, and tools, for automated data analysis are often insufficient for the automated analysis and information extraction from big EO data sources, but interesting approaches to tackle processing and new data storage solutions are proposed.

Anyway, the paradigm of object-based image analysis (OBIA) extends the traditional per-pixel based image classification approaches that rely only on the spectral information per single pixel. OBIA enables the incorporation of geometry and expert knowledge on top of traditional spectral values and this allow to improve for example classification by using existing knowledge available for example as OSINT.

One main point is the aspect that current high-resolution sensors “significantly increase the within-class spectral variability and, therefore, decrease the potential accuracy of a purely pixel-based approach to classification” (Blaschke et al., 2014, RD44). This point is even more valid for the task of analyzing large amounts of remotely sensed data incorporating information from a variety of other sources into the analysis which is the case of the study of migration where EO is not the only source of information. This issues can be mitigated by considering time-series as the starting point. In fact, time-series analysis and especially the detection of changes can be very useful as a source of information to be used in spatial analysis models used to detects possible hot spots from EO data especially from SAR time series and VHR time series.

Also HR multi-spectral imagery, particular indexes such as NDVI can be monitored over long time-series (using historical data) in various ways in order to assess food security at scales which can be useful to analyze local or small scale migration phenomena. This information can be added to common large scale reports provided normally by organisations like FAO (e.g. http://www.fao.org/hunger/en/).

Change detection maps of an area of interest can be used to trigger further, more in-depth analysis. A first screening of potential anomalous changes is needed to focus more expensive and time-consuming actions, e.g. analysis with restricted-access data and in-situ monitoring. Based on optical data series, change detection in the scene can be still semi-automatically performed. In this case, robust approaches are needed for the modelling of the disturbance affecting the radiances/reflectances between different acquisition times due to calibration, residual solar contributions, surfaces not fully Lambertian, and geolocation or coregistration errors. Many of these disturbance can be overpassed by considering the new Sentinel-2 mission which guarantees the acquisition over a scene with similar illumination conditions and geometrical line lie of sight.

One critical issue in the optical data series processing is that preliminary cloud masking is required and also an accurate detection of haze conditions. In particular clouds make the optical data useless, while areas in the image affected by haze should be radiometrically corrected in order to avoid discarding of information. The Optical change detection is usually less automatable with respect to the SAR CD.

improve situational awareness as well as regular, temporal monitoring and identification of changes.
Data with lower spatial resolutions can be exploited by moving away from "direct" information extraction towards indicator-based approaches.

Further exploration into indicators for crisis, whether natural disasters or man-made conflicts, is an expanding field of research, including the development of automated methods for pro-longed monitoring of areas. Indicators based on high resolution data have been envisioned for detecting or monitoring burnt villages; informal urban growth; the development or growth of refugee or \ac{IDP} camps (Wang et al. 2015) and their impact on the surrounding environment; changes in activity (e.g. new infrastructures such as roads or air fields); illicit crop establishment and growth (e.g. opium cultivation in Afghanistan); environment degradation; flood assessment or visible changes to water bodies; changes or loss of agricultural areas; deforestation or reforestation; and visible climate change or extreme weather event artefacts.

Besides the technology-driven strategies for performing searching and processing on the database level, user-driven requirements are leading to on-demand web-based online processing of big \ac{EO} data. In the last years, several technologies and standards, which can be used for online processing of \ac{EO} data, have been developed and made available to the community [Petcu et al. 2010]. Two \ac{OGC} standards are the \ac{WCPS} and the \ac{WPS}, while technology implementations are Google Earth Engine [Google Earth Engine Team2015] or the Jupyter notebooks. Other examples of web-based platforms, which have been explicitly designed for processing and analysing \ac{EO} data, include the Amazon Cloud \ac{AWS} for processing of Landsat-8 data, with a free access to the \ac{API} [Amazon 2016]. The \ac{AGDC} is using the \ac{NCI} to provide Landsat images in the petabyte scale together with processing capabilities over the internet [Evans et al. 2015]. The \ac{EODC}, a collaboration between the technical university of Vienna, the \ac{ZAMG} and other companies, pursues a similar approach [Wagner et al. 2014].

The exploitation of the value of Big Earth Data involves automation, pre-processing, on-demand querying and compelling visualisation of the results. Massive processing power in the cloud and fast network connection is required, but not sufficient. Automation of intelligent workflows leading to pre-processing of data are important drivers for on-demand and ad-hoc querying to extract information in real time. Semantically enriched data allow also unexperienced users to formulate queries by means a high-level declarative language. Instead of having to translate an algorithm into software code manually, the query will be evaluated by the system and transformed into optimised physical access patterns. This approach can be realised by automatic (application independent) semantic enrichment of \ac{EO} images in Big \ac{EO} image databases, which are therefore “prepared” and “ready” for application specific queries in distributed array databases (with a declarative query language and a query optimiser). This approach avoids redundancy in data handling and repeated data (pre-) processing. The feasibility of this approach has been proven by Tiede et. al. [2016].
