\cleardoublepage
\pagestyle{scrheadings}
\cleardoublepage
\chapter{Discussion}\label{ch:discussion}

This section looks more closely at the proof-of-concept results provided in \autoref{ch:proof} derived exclusively from a dense time-series of automatically semantically enriched Sentinel-2 scenes. Finer details pertaining to the data, design decisions and methods used, including challenges faced along the way are explored. It is structured in a way that separates the output of the system from the original Sentinel-2 data and implementation methods.


# Interpretation of Maps

Interpreting aggregated time-series output from this implementation is not as easy as one might think. The aggregated time-series results can be visualised in one layer, but are just one representation of complex processes, events, etc. Spatial statistical methods exist for assessing variability in space, but the output here has a temporal dimensions as well as at least one semantic or thematic dimension. Finding ways to visualise and incorporate different temporal variability and distribution, as well as different levels of confidence in semi-concept fitness for a given query or application are points that need to be explored further, and are ultimately outside the scope of this thesis.

It is clear that not very much geospatial information open to the public, not to mention an English-speaking public, has been coming out of Syria over the past many years. That aside, there are very few datasets that exist anywhere in the world that can reasonably be used to check for validity or agreement of results that have a 10\acs{m} spatial resolution over 30,000\acs{km}², not to mention with a similar density or temporal frequency.

Free and open vector datasets (e.g. OpenStreetMap data, national data) might be helpful when a query is about determining the extent of certain objects at moments in time, or on average (e.g. water bodies, national forests). However, when it comes to assessing the dynamics of a particular kind of land cover (e.g. surface water dynamics), there is very little that exists to rely on in much of the world. Not only the number of acquisitions that output is based on matters, but often it is incredibly important *when* the acquisitions with "clean" pixels were acquired.

That being said, the following exploratory outputs offer plenty of questions, some potential insights, and ideas for future work. A rough reference to existing monthly average rainfall is included in order to assist in contextualising vegetation and water dynamics (*see* Figures \ref{fig:akcakale_2015_2018} and \ref{fig:aleppo_2015_2018}). Temperature and other additional information would also likely be very useful, depending on the application. Existing vector information about irrigated areas could also be used to check plausibility of vegetation-like observations, as done by @tiedeAutomaticPostclassificationLand2014, but the resolution of such data is based on a 250\acs{m} by 250\acs{m} grid. The conflict in Syria has likely impacted the actual area of actively irrigated agricultural production significantly within the last 8 years, due to displacement of people and damage to irrigation infrastructure. Without employing some form of object-based image analysis to process the output here in an object-based way, the agreement of the output at 10\acs{m} spatial resolution is difficult to meaningfully assess. OpenStreetMap data has been included in some smaller insets to demonstrate that certain structures can be discerned based on the output from the data cube implementation in order to support establishing plausibility.


## Entire Cube, June 2015-2018 \label{sec:ex_cube}

The multiple exploratory visualisations of different output covering data observed from 28 June 2015 to 22 June 2018 (*see* \autoref{sec:explore_1}) raise lots of interesting questions to be explored. The ability to compare information derived from 3 years of data with 10\acs{m} spatial resolution for an area of 30,000\acs{km}² overnight on the hardware and computing environment used here is something that likely would not have been possible a few years ago; it definitely was not possible with the same temporal density before Sentinel-2 existed.

The heterogeneous spatial variability in the number of available acquisitions can be seen in \autoref{fig:3yr_valid_total}. Not only are differences in average cloud cover (e.g. higher in mountainous regions to the West) important, but the actual number of available acquisitions. The differences in average cloud cover are somewhat made visible in \autoref{fig:3yr_clean_discrete}, but also differences in the reflectivity of certain surfaces (e.g. what are very likely built-up surfaces, shallow water). \autoref{fig:3yr_clean_close1} is the same output of "clean" pixels as shown in \autoref{fig:3yr_clean_discrete}, but one can see that some built-up, urban structures in the city of Aleppo are made visible. It seems to fit well with structures depicted in the inset (c) of the same area containing OpenStreetMap data. These structures are visible due to having a relatively high surface reflectance that are often attributed to an unknown semi-concept category and thus excluded from analysis. Water bodies, especially the northern part of the traditionally seasonal saline lake, Jabbūl, can also be discerned, since pixels containing shallow water (e.g. shorelines) are also often attributed to the unknown semi-concept category. The same area of Aleppo can be seen in \autoref{fig:3yr_total_close1}, where the overlapping swaths are apparent. Perhaps calculating the percentage of "clean" pixels divided by the total number of possible pixels would offer a better idea of the spatial differences in available data an output is based on.

The total vegetation-like observations can be seen in \autoref{fig:3yr_veg_total}, which gives an idea of the possible absolute extent of vegetation over the three years, which, due to the very arid climate in the East, is strongly tied to precipitation events. It makes sense, then, that the number of total vegetation-like observations increases from East to West. The normalised values based on available "clean" pixels can be seen in \autoref{fig:3yr_veg_norm}, but only pixels with an observed occurrence over 12.5% of the 3 years of data are visible. These are calculated exactly as described in \autoref{fig:veg_index_diagram}.

Two depictions of differences in the normalised index can be seen in Figures \ref{fig:3yr_veg_norm_close1} and \ref{fig:3yr_veg_norm_close2}, showing what is most likely irrigated agricultural land on each side of the Turkish-Syrian border. Some of the articles cited in \autoref{sec:ex_background} talked about damage to irrigation infrastructure or reduction in irrigation practices due to the displacement of people. These two figures might be considered as providing evidence supporting that claim in a spatially-explicit way. Without similar data prior to the start of the Syrian conflict, such an assertion based on this output is more than risky and could be due to other causes. However, even if Sentinel-2 data was available before 2015, the presence of intense drought starting around 2007 in Syria definitely caused land cover change, but also limits the ability to attribute changes to possibly being related to conflict. Average monthly rainfall data for the duration of Sentinel-2 observations including 6 months before from the city of Akçakale, Turkey, shown in \autoref{fig:3yr_veg_norm_close1}, can be seen in \autoref{fig:akcakale_2015_2018}. This is not necessarily useful for interpreting output shown here, but might be useful if three different annual aggregations, or seasonal aggregations in different years are calculated, similar to what is done in \autoref{sec:ex_multitemp}.

![A rough idea of precipitation from December 2014 until May 2018 as recorded at Akçakale, Turkey, on the border to Syria. <a href='https://www.worldweatheronline.com/' title='Historical average weather'>Data provided by WorldWeatherOnline.com</a> \label{fig:akcakale_2015_2018}](source/figures/akcakale_2015_2018.png)

While there are no metrics of confidence to offer here, water-like semi-concepts sometimes look very similar to areas with shadow, whether from clouds or terrain. It is important to make clear that even in an exploratory way, water-like semi-concepts move through relatively more uncertainty than looking at vegetation-like semi-concepts without incorporating any additional knowledge or information (e.g. \acs{DEM}, improved cloud and cloud-shadow masking). As becomes immediately evident when looking at \autoref{fig:3yr_water_total}, the more mountainous region in the West contains observed water-like semi-concepts in areas that are very likely mostly shadows from mountainous terrain (*see* \autoref{fig:3yr_veg_water_norm_close2} (c)). What are likely freshly irrigated (i.e. basically flooded) agricultural fields can also be assumed to be made visible based on their regular, rectangular shapes and very low counts of water-like observations (i.e. depicted in a yellowish tone).

The lack of a thermal band in Sentinel-2 imagery also makes dense clouds with relatively high reflectance difficult to discern as being cloud-like, especially when located over water bodies. Based on closer examination of the generated information layers, those pixels are often are attributed to a built-up semi-concept with very high reflectivity. This artefact can also be seen in the Mediterranean sea in Figures \ref{fig:3yr_water_total} and \autoref{fig:3yr_veg_water_norm_close2}, whereby the huge water body that ought to always be identified as looking like deep water has a range of total water-like observations despite having mostly the same number of available acquisitions (*see* \autoref{fig:3yr_valid_total}) and clean pixels (*see* \autoref{fig:3yr_clean_discrete}).

The normalised occurrence of water-like semi-concepts can be seen in \autoref{fig:3yr_water_norm}. Pixels with an average occurrence of observed water-like semi-concepts below 12.5%, including values of 0, are coloured white, which leaves only a few artefacts from terrain shadow, that could likely be identified using the aspect and slope of a \acs{DEM}. The changes in surface water extent can also be seen, again including lake Jabbūl in the South and in (c) of \autoref{fig:3yr_veg_water_norm_close1}. Because the spectral profile of pixels containing shallow water seem to sometimes be identified as an unknown semi-concept, ephemeral and seasonal likes may be made visible by this output, but requires further tests for agreement and validation with other methods and datasets before any real conclusions can be made.


## Multi-temporal Springtime in Afrin \label{sec:ex_multitemp}

These exploratory visualisations of the same seasonal timeframe (1 May to 15 June) in 2016, 2017 and 2018 (*see* \autoref{sec:explore_2}) offer different insights than for output aggregated over longer timespans, but also bring different challenges. The idea here is to explore a possible sort of method to move away from bi-temporal change detection and towards utilising temporally denser stacks of data to detect perhaps more meaningful change. Hopefully relying on data aggregated over time, or somehow otherwise including or accounting for time, removes some of the spuriousness that can sometimes occur when an image used in bi-temporal change detection is not actually representative of the process, event, etc. that the change detection is supposed to represent.

Another issue that can arise with bi-temporal change detection is when multiple time-steps are supposed to be compared (e.g. months or years). Different climate factors (e.g. precipitation, temperature) in different climate zones impact land cover differently from season to season, year to year, whether by shifting the phenological cycle (e.g. vegetative peak, lull or periodicity), completely reducing vegetative cover (e.g. a drought) or surface water extent (e.g. a flood), etc. These changes are visible in the few example outputs, especially since a fixed time-frame was chosen in each year (e.g. 1 May to 15 June). For example, depending on the purpose, using a data cube implementation to detect a suitable time-frame including the vegetative peak (i.e. perhaps defined as the largest vegetated extent, or "greenest" semi-concepts using a semantic query) and using that result to detect vegetation changes between years could produce more comparable and meaningful results.

In this case, the area queried is over 10,000\acs{km}² and visible in the red box shown in (a) of \autoref{fig:afrin_valid_total}. This area covers what is known as Afrin, Syria. In that same figure, a substantial difference in the number of available acquisitions can be seen between years 2016 and 2017, before Sentinel-2B was launched and operational, and 2018, where almost twice as many acquisitions are available for parts of the queried area for the same duration of time (i.e. around 6 weeks). A similar pattern of acquisition distribution can also be seen in \autoref{fig:afrin_veg_clean}, where it is also clear that 2017 has a few more acquisitions than 2016 for the same time-frame, but also on fewer cloud-like pixels in the acquisitions available. The more mountainous region in the West also is visible, especially in in 2018, due to lower numbers of "clean" pixels likely attributable to higher average cloud cover, even though more total acquisitions are available. As mentioned in \autoref{sec:ex_cube}, the city of Aleppo is also visible in the lower right corner, especially once more acquisitions are incorporated, such as in 2018. This is similarly visible in \autoref{fig:3yr_clean_close1} over the entire 3 years of data, but is interesting to see the pattern emerge even with, at most, 17 acquisitions in 2018.

![A rough idea of precipitation from September 2015 until May 2018 as recorded at the international airport in Aleppo, Syria. <a href='https://www.worldweatheronline.com/' title='Historical average weather'>Data provided by WorldWeatherOnline.com</a> \label{fig:aleppo_2015_2018}](source/figures/aleppo_2015_2018.png)

Moving on to vegetation, in this case, it is important to take into account rainfall at this time of year, and the preceding months. \autoref{fig:aleppo_2015_2018} shows average monthly rainfall in Aleppo for the years 2016-2018. It is clear that the end of 2015 and beginning of 2016 received relatively less average rainfall than 2017 or 2018. There is a visible difference in the total number of vegetation-like pixels shown in \autoref{fig:afrin_veg_total}, not only because of the lower number of acquisitions in 2016, but likely also because there was less average rainfall.

Once the normalised occurrence of observed vegetation-like pixels over time is calculated (*see* \autoref{fig:afrin_veg_norm}), this difference becomes less evident in the more persistently vegetated areas in the more mountainous regions, which likely receive more precipitation on average than Aleppo. Areas that are likely agricultural fields, however, are almost non-existent in the output of 2016. The lower number of acquisitions available in 2016 and 2017 compared to 2018 must be taken into account. Some areas in 2016 have only 6 moments in time to even work with (i.e. two vegetation-like observations automatically can mean at least 33%, and if clouds were observed once, 40%!). Also, cloud cover is important to consider, especially for shorter aggregated output. \autoref{fig:afrin_veg_clean_close1} shows areas in white where there are no valid data to work with from 1 May to 15 June in 2017, despite having 5 acquisitions covering that area.

![A closer look at the number of "clean" pixels from 1 May to 15 June 2017, showing areas with no valid data in white due to cloud cover, despite having 5 acquisitions in the time frame for this specific area. \label{fig:afrin_veg_clean_close1}](source/figures/maps/afrin_veg_clean_close1.png)

\autoref{fig:afrin_diff20172016} and \autoref{fig:afrin_diff20182017} look at differences in the normalised occurrence of observed vegetation-like semi-concepts of the same area, between 2017 and 2016, and 2018 and 2017, respectively. In this case, it is, again, important to know that, while 2016 experienced lower average rainfall during and preceding the queried temporal-extent in comparison to 2017 and 2018, there are also fewer "clean" observations for this area. For almost all pixels in this smaller spatial extent, there are only 2 "clean" pixels in the stack, to be exact. It would be useful to know if the "clean" pixels for this area occurred from the same 2 scenes, and whether or not they were acquired earlier or later in the temporal extent from 1 May to 15 June 2015. The same type of difference was calculated for another area in Figures \ref{fig:afrin_diff20172016_2} and \ref{fig:afrin_diff20182017_2}, also between 2017 and 2016, and 2018 and 2017, respectively.

In retrospect, it would makes sense not to have difference values ±0.111 be white, but either only values of 0, or to mask results based on the combined vegetation-like extents detected in the two years being compared. Without such masking, only relatively larger changes in normalised occurrence can be discerned, and a difference between non-vegetated areas consistent in both temporal-extents versus vegetated areas that experienced no relative change cannot be made.

A question also arises as to whether or not the aggregated normalised occurrence information is comparable between two different temporal extents with different base data. This is perhaps less trivial when comparing 2018 with 2017, whereby each vegetation-like pixel in the relatively shorter stack in 2017 has a relatively higher influence on the output than an observation in 2018, which generally has double the acquisitions. It might make sense to figure out guidelines or metrics to assess whether the number of valid acquisitions and "clean" pixels over a temporal-extent, but also taking their variability and distribution through time, as a way to better judge comparability from a statistical standpoint, or even somehow assess statistical significance of detected changes.


## Potential Connection to SDGs

Aggregated time-series output was generated in the hopes of moving towards an automated workflow to supply information in the scope of the \acp{SDG} mentioned in \autoref{sec:framing}. Surface water bodies and various types of vegetated land cover (e.g. agricultural fields, forests) cannot be explicitly identified with this output, but seem to be able to be made visible in some way using this implementation. It seems plausible, that similar automatically generated output from this generic semantic data cube could be integrated with additional data to offer spatially-explicit evidence to eventually support the \acp{SDG}, whether at 10\acs{m} spatial resolution or based on larger, meaningful objects.






The concept of \ac{ARD} (*see* \autoref{sec:ARD}) is relevant in the context of this thesis, since a data cube is provided allowing access to data with user-defined grids and generic semantic enrichment suitable for multiple kinds of analysis using semantic queries. Depending on how \ac{ARD} is defined, the created \ac{ODC} implementation could be considered as analysis-ready. Semi-concepts provide an automated semi-semantic layer that under current circumstances, could be considered as moving towards semantically enriched \ac{ARD}.

- existing water indicator -- [http://eo4sdg.org/wp-content/uploads/2017/07/SDG6.6.1\_brief\_GEO\_Week\_2017-2.pdf]this implementation offers a way to use Sentinel-2 images to extract water extent at 10m spatial resolution and higher temporal frequencey, which may be necessary for certain applications in comparison to extraction with Landsat-8 imagery.




## Challenges

- interpretation taking variability through time into account
- calculating differences between seasons or years based on aggregated output (i.e. are they even comparable?)
- periodicity (**draw graphics**) -- finding ways to characterise it or take it into account
  - ability to give information about seasonality and dynamics (e.g. type of crop, harvest or mowing cycles, ...)
- more complex queries (e.g. automated post-classification change detection)

# Discussion of Data

The only data used in this implementation were Sentinel-2 \ac{L1C} data, and information layers generated from them. For detecting objects larger than 8 pixels (e.g 800\acs{m}²) the 10\acs{m} resolution is likely sufficient.


## ESA Cloud-Masks

Scene related quality information is offered with Sentinel-2 products, including an automatically generated cloud cover mask. This mask is used to calculate the average cloud cover for the scene. The algorithms used to calculate this mask are proprietary and not freely or openly available.

There was a consideration at some point to include a rasterised version of the cloud masks that are provided, but the quality seemed not to be reliable and fairly inconsistent. There are many different kinds of clouds and not all of them are detectable by the algorithm being used, probably because \ac{ESA} wants to reduce false positives (i.e. incorrectly labeling a pixel as being clouded) and only provide results that are very certain to be true. Thin clouds, for example, are often not masked as clouds, but provide plenty of problems for analysis.

Further examination of the existing cloud masks must be conducted in order to rule out incorporation. Even if the masks do not include all of the cloud cover, if the pixels that are masked are, in fact, quite often correct, then they could be compared with the cloud-like semi-concepts to improve confidence. They could also be incorporated in some way to establish a layer of likelihood that the pixels labeled as being cloud-like are actually clouds, but without knowing how the \ac{ESA} algorithm works, this makes little sense.


## ESA Level-2A

Images must to be calibrated from digital numbers to at least \ac{ToA} reflectances in order to be comparable to each other. \acs{SIAM}™ requires data to be calibrated to at least \ac{ToA} reflectance in order to generate meaningful output. Sentinel-2 data are offered as \ac{ESA} \ac{L1C}, which means they are calibrated to \ac{ToA}. While still considered open data, the pre-processing algorithms applied to the \ac{EO} data provided by the Copernicus programme are not open, but proprietary. This has many implications for understanding the basis of scientific analysis conducted with them, because these pre-processing steps are not transparent.

Including a robust, reliable and automated method for calibrating the images to \ac{BoA} or \ac{SURF} might improve pre-classification results. This sort of calibration ultimately requires data about the atmosphere at the moment of observation, which current methods can only approximate. This sometimes lead to undesirable or misleading output that is also not necessarily comparable between different images or different geographic or temporal locations.

At the time of writing, \ac{ESA} intends to start offering world-wide \ac{L2A} products, which include data calibrated to \ac{BoA} and a \ac{SCM}. These products are also generated using proprietary algorithms, which makes it difficult to decompose what processing has occurred and to ascertain an idea of quality, reliability and different kinds of variation (e.g. does it work well over snow?; does it work well in different climate zones? what is the variation of quality or reliability through space and time within the archive?). A further step to consider would be whether or not to include the \ac{L2A} data and \ac{SCM} in a data cube, as well as to test the ability of \acs{SIAM}™ to handle the data supposedly calibrated to \ac{BoA}.


## Challenges

- long path names
- swaths vs. granules
- projections if used in other areas
- data redundancy (keeping own copy) and size
- Sentinel-2 problem with pixel alignment


# Discussion of Methods

- why ODC
- why SIAM™
- why Jupyter Notebooks
- why these specific SDG targets


## Acquisition

Since the automated workflow was implemented in January 2018, the download hub has seemed to be fairly stable. The Hub \ac{API} has also made data access fairly uncomplicated to automate. However, downloading data is the part of the automated workflow that takes the longest amount of time, and is the least reliable due to external factors (e.g. Internet connection, Hub status).

It might make sense to avoid downloading the original Sentinel-2 data entirely by processing the data with \acs{SIAM}™ where they are located, and only saving the generated information layers. However, this sort of set-up creates a bit of tension with the reproducibility of results. The Sentinel-2 data source is a huge and growing body of data, which is likely to not always be available everywhere for the entire duration of acquisition, but distributed among various mirrors. The Sentinel-2 archive is also about to be completely re-processed, which will replace the existing products that Sentinel-2-based analysis conducted up to now has relied on. These results will not be reproducible unless the researchers keep a copy of the data used for their analysis.


## Re-formatting


### No-Data Mask Generation \label{sec:nodata_mask}

The assumption that pixels with a value of 0 in any of the six Sentinel-2 bands used as input for \acs{SIAM}™ be excluded (i.e. no-data masking) may be faulty more often than assumed, but information on pixels not containing data for each band in an image is not yet supplied with Sentinel-2 products. Even if the image footprint is supplied in the metadata, each band’s measurements at the edge of an orbit swath are most often not identical. Pixels with a measured value of 0 in any of the six bands are thus excluded from semantic enrichment. The authors have found this assumption to prove useful in reducing faulty semi-concept assignment to pixels lacking valid data in any of the six bands within an image at a given time, for example, at the edge of an orbit swath. The authors are aware that the assumption may occasionally exclude meaningful information (i.e. when a valid measurement has a value of 0). Querying to test this assumption can, however, be done within the existing implementation, since the original Sentinel-2 bands are also indexed in the data cube. This will be conducted in the future to better assess the ramifications of this assumption.


## Pre-classification

- Why SIAM™?

Multi-dimensional methods that are robust to redundant information are required to process and classify a time-series of multi-spectral scenes.

Current setups of reproducible research for \ac{EO} data cubes require significant time and financial investment, which generally limits them to larger institutions. The importance of reproducible, transferable, interoperable, automated and repeatable workflows to process, handle and analyse massive \ac{EO} data is becoming more apparent in a now data-rich world. With so much big data, it makes sense to avoid application-specific data (pre-)processing, which contradicts many big data principles.

An additional benefit to using \acs{SIAM}™ for generating generic semantic concepts is that it can be applied to data from multiple optical sensors as long as they have been calibrated to \acs{ToA} reflectance. Future incorporation of additional sensors would particularly expand the temporal extent of possible queries and analysis. Other EO data can also be incorporated (e.g. digital elevation model (DEM), gridded precipitation data) to further analysis possibilities.


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


### GridWorkflow \label{sec:gridworkflow}

- issue with mosaicing



## Benchmarks
- Report time of daily updates, and estimate average time needed per granule.
  - download
  - prep for SIAM™
  - SIAM™ processing
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
One challenge is that processing using the Python \ac{API} occurs predominantly using in-memory data. This complicates implementation on the current hardware as it requires to load the complete dataset prior to analysis and is a limitation for smaller institutions. Even if many processes can be chunked, not all processes lend themselves to be divided as such, or may produce similar but differing results (e.g. in the case of data-dependency in image-wide analyses).

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


# Revisiting Research Questions

This thesis aims towards answering the following questions:

## Context

- What are some ways that \ac{EO} contributes or can be envisioned as contributing towards spatially-explicit evidence for \acp{SDG} indicators?
- What are some current examples of free and open \ac{EO}-based indicators or evidence for indicators?

## Implementation

- Is it possible to automatically download Sentinel-2 data and automatically enrich it semantically?
- Can all Sentinel-2 data available for a region be automatically incorporated in a semantically enriched data cube?
- Is the available hardware sufficient for such an automated workflow and queries within a reasonable execution time?
- Is the \ac{ODC} software conducive to handling relatively simple semantic queries based on semi-concepts?
- Are semi-concepts sufficient for ad-hoc semi-automated monitoring of vegetation and water dynamics over time?
- Can information generated from querying vegetation-like or water-like semi-concepts utilising time be used in a meaningful way in the context of existing indicators?
- How does this information characterise changes to water and vegetation cover for the temporal extent of the implemented data cube?
- What sort of information is needed to better assess the quality and confidence of aggregated indicator-like results?

## Results

- Can differences in vegetation dynamics in agricultural areas be detected between Syria and Turkey using this implementation?
