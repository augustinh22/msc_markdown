\cleardoublepage
\pagestyle{scrheadings}
\cleardoublepage
\chapter{Proof-of-Concept}\label{ch:proof}

The main result of this work is a constantly up-to-date semantically enriched data cube implementation for north-western Syria. This implementation may continue to be used for research of individual observations in time, monthly or seasonal analysis, up to the entire temporal extent of the growing data cube for the entire geospatial extent. In addition to the ingested semantically enriched layers, the original Sentinel-2 data and information layers in their original format can be accessed in a similar manner. Access to the original Sentinel-2 data that the information layers are generated from in a data cube infrastructure may be very useful for certain applications and questions, but is not addressed in this thesis.

In order to demonstrate its potential utility, a few proof-of-concept demonstrations of automated information extraction about water and vegetation extent and dynamics over time based on semi-concepts are provided. Each of these queries is also accompanied by a few additional geospatial layers to better provide insight about the quality of the output, and to aid interpretation. Such aggregated analysis produced from big Earth data currently have few methods or metrics available to assess quality, distribution and variability through space *and* time for meaningful interpretation and comparability. This kind of automated information extraction may be relevant to \ac{SDG} targets 2.4, 6.6 and 15.1  (*see* \autoref{sec:framing}), which is what is framing these examples, but also for indicators for \acs{DRR}, livelihood security (*see* \autoref{sec:livelihood}), broader situational awareness and more.


# Aggregated Time-series Output

While other queries (e.g. post-classification change) could have been conducted, a conscious choice was made to produce output aggregated over time. This was decided in order to better explore some of the challenges generating such output, but more importantly, challenges in their interpretation.

These proof-of-concept results are inspired by similar aggregated geospatial time-series analysis conducted by @muellerWaterObservationsSpace2016 and @tulbureSurfaceWaterExtent2016 of water bodies. Both of those examples were conducted within the \ac{AGDC}, the basis for the \ac{ODC} software. The Python functions used here to produce these aggregated time-series results were developed by the \ac{ODC} and are available on GitHub [@ceos-seoDataCubeNotebooks2017]. It is assumed that very similar, if not the same, time-series functions used in those examples of aggregated water analysis over time have been used here, but with generic semi-concepts instead of a sample-based water classifier.

![This figure demonstrates how vegetation-like semi-concept occurrence over time is calculated. The clean stack contains no "invalid" observations, such as no-data or cloud-like semi-concepts. In this case, the query demonstrated is for all vegetation semi-concepts (i.e. green in the figure), but it could be anything else. Author's illustration. \label{fig:veg_index_diagram}](source/figures/vegetation_normindex_example.png)

The aggregated time-series function delivers a single geospatial layer. It summarizes the percentage of observations per-pixel where the queried semi-concept(s)were detected based on the total number of "clean" pixels. In this case, "clean" refers to the exclusion of cloud-like and unknown semi-concepts, as well as pixels with a measured value of 0 in any of the 6 bands required for \ac{SIAM}™, which are identified using the no-data mask generated during pre-processing (*see* \autoref{sec:format_siam}). An example for one pixel being queried for vegetation-like semi-concepts is illustrated in \autoref{fig:veg_index_diagram}.

This time-series function is implemented in Python and can deliver more than just the aggregated occurrence referenced above. It can also deliver the minimum or maximum value over the temporal extent, which, for semi-concept-based analysis is not really meaningful. However, a layer containing the total number of observations matching a query (e.g. the total number of vegetation-like semi-concepts detected in a pixel over time in \autoref{fig:veg_index_diagram}) and a layer containing the total number of clean observations can also be generated. These aid in assessing the differences in data through space that may affect your result. I also decided to run the time-series function on the no-data mask for the spatio-temporal query extents in order to also know exactly how many Sentinel-2 scenes were available. This allows one to better qualify the total number of observations in the context of available data but also interpret the normalised index in the context of the initial data source.


# Maps

**intro summary**

## Exploration: June 2015-2018

[ ] Map of all 3 years of data with water, vegetation and valid pixels.
[ ] 3 inset maps for each ()
[ ] describe two indicators (water, vegetation ...)
[ ] include all 4 maps (index of persistence, total clean, total valid, number of invalid)

\autoref{fig:water_old} demonstrates a similar method applied to the semantic data cube implemented here, but using water-like semi-concepts from SIAM™ instead of the Australian water detection algorithm (i.e. Water Observation from Space). Here, pixels masked as no-data as well as cloud-like and unclassified semi-concepts have been excluded from analysis such that only pixels deemed clear observations are included and considered valid. It shows the normalised percentage of water semi-concept pixels related to other valid semi-concepts (e.g. vegetation-like) from January 31, 2016 to January 31, 2018, which is from a total of 103 observations along the dimension of time.

![Normalised water detection based on water semi-concepts in Syria near the border of Turkey, excluding no-data, cloud like and unclassified pixels from January 31, 2016 until January 31, 2018 (103 time observations). Time-series aggregation method similar to Mueller et al. (2016). \label{fig:water_old}](source/figures/water_edit.png)

### Checking plausibility

-- precipitation for all three years
-- Irrigated Areas (GMIA)


## Exploration: 15 August to 15 September 2017

[ ] Show entire map with inset on border to Turkey
[ ] describe vegetation indicator
[ ] include all 4 maps (index of persistence, total clean, total valid, number of invalid)


This result was calculated in under 20 minutes for the entire spatial extent of the data cube implementation.

## Afrin: 1 May to 15 June 2016, 2017 and 2018

[ ] Show maps of vegetation for three different years with any interesting insets.
[ ] describe vegetation indicator
[ ] include all 4 maps (index of persistence, total clean, total valid, number of invalid)

These results took approximately 10 minutes for each year to cover Afrin, including aggregated time-series analysis of vegetation semi-concepts (~7 minutes) and the no-data mask to ascertain the number of images (~2 minutes). The area (latitudes 36.2°-37.0°N; longitudes 36.3°-37.3°E)contained 100 different 10\acs{km} by 10\acs{km} cells with differing numbers of images available per year and spatial location.

The number of time-steps available per year were: at most 12 time-steps, but otherwise 8 in 2016; at most 9 but otherwise 5 in 2017; and at most 17, but otherwise 9 in 2018.

-- Calculate the difference between years


### Checking plausibility

-- precipitation for each year



# Checking plausibility

- (FAO food security services, statistics from Syria…)

https://ipad.fas.usda.gov/highlights/2018/05/syria/index.pdf (https://ipad.fas.usda.gov/) [@USDAFASInternational]

- Irrigated Areas (GMIA or Irrmap)
- Syria Refugee Sites (<https://data.humdata.org/dataset/syria-refugee-sites>)
- Precipitation or drought data
- mention acquisition/ingestion, etc. or reference below

- INFORM, Index of Risk Management database
- HDX, humanitarian data exchange <https://data.hdx.rwlabs.org>
- Relief web
- ACLED
- GDELT
