\cleardoublepage
\pagestyle{scrheadings}
\cleardoublepage
\chapter{Proof-of-Concept}\label{ch:proof}

The main result of this work is a constantly up-to-date semantically enriched data cube implementation for north-western Syria. This implementation may continue to be used for research of individual observations in time, monthly or seasonal analysis, up to the entire temporal extent of the growing data cube for the entire geospatial extent. In addition to the ingested semantically enriched layers, the original Sentinel-2 data and information layers in their original format can be accessed in a similar manner. Access to the original Sentinel-2 data that the information layers are generated from in a data cube infrastructure may be very useful for certain applications and questions, but is not addressed in this thesis.

In order to demonstrate its potential utility, a few proof-of-concept demonstrations of automated information extraction about water and vegetation extent and dynamics over time based on semi-concepts are provided. Each of these queries is also accompanied by a few additional geospatial layers to better provide insight about the quality of the output, and to aid interpretation. Such aggregated analysis produced from big Earth data currently have few methods or metrics available to assess quality, distribution and variability through space *and* time for meaningful interpretation and comparability. This kind of automated information extraction may be relevant to \ac{SDG} targets 2.4, 6.6 and 15.1  (*see* \autoref{sec:framing}), which is what is framing these examples, but also for indicators for \acs{DRR}, livelihood security (*see* \autoref{sec:livelihood}), broader situational awareness and more.


# Aggregated Time-series Output

While other queries (e.g. post-classification change) could have been conducted, a conscious choice was made to produce output aggregated over time. This was decided in order to better explore some of the challenges faced in generating such output, but more importantly, challenges encountered in their interpretation.

These proof-of-concept results are inspired by similar aggregated geospatial time-series analysis conducted by @muellerWaterObservationsSpace2016 and @tulbureSurfaceWaterExtent2016 of surface water bodies. Both of those examples were conducted within the \ac{AGDC}, the basis for the \ac{ODC} software. The Python functions used in this thesis to produce these aggregated time-series results were developed by the \ac{ODC} and are available on GitHub [@ceos-seoDataCubeNotebooks2017]. It is assumed that very similar, if not the same, time-series functions used in those examples of aggregated water analysis over time have been used here, but using generic semi-concepts instead of the results of a sample-based surface water classifier.

![This demonstrates how vegetation-like semi-concept occurrence aggregated over time is calculated. The clean stack contains no "invalid" observations, such as no-data or cloud-like semi-concepts. In this case, the query demonstrated is for all vegetation semi-concepts (i.e. green in the figure), but it could be anything else. Author's illustration. \label{fig:veg_index_diagram}](source/figures/vegetation_normindex_example.png)

The aggregated time-series function delivers a single geospatial layer. It summarizes the percentage of observations per-pixel where the queried semi-concept(s) were detected based on the total number of "clean" pixels. In this case, "clean" refers to the exclusion of cloud-like and unknown semi-concepts, as well as pixels with a measured value of 0 in any of the 6 bands required for \acs{SIAM}™, which are identified using the no-data mask generated during pre-processing (*see* \autoref{sec:format_siam}). An example for one pixel being queried for vegetation-like semi-concepts is illustrated in \autoref{fig:veg_index_diagram}.

This time-series function is implemented in Python and can deliver more than just the aggregated occurrence referenced above. It can also deliver the minimum or maximum value over the temporal extent, which, for semi-concept-based analysis is not really meaningful. However, a layer containing the total number of observations matching a query (e.g. the total number of vegetation-like semi-concepts detected in a pixel over time in \autoref{fig:veg_index_diagram}) and a layer containing the total number of clean observations can also be generated. These aid in assessing the differences in data through space that may affect your result. I also decided to run the time-series function on the no-data mask for the spatio-temporal query extents in order to also know exactly how many Sentinel-2 scenes were available. This allows one to better qualify the total number of observations in the context of available data but also interpret the normalised index in the context of the initial data source.


# Maps

**intro summary**

## Exploration: June 2015-2018

An aggregated time-series analysis on the entire geo-spatio-temporal extent of the cube was conducted (i.e. from 28 June 2015 until 22 June 2018 over latitudes 36.01°-37.05°N and longitudes 35.67°-39.11°E in \acs{EPSG} 4326), effectively covering 3 years of data in 591 Sentinel-2 scenes. The longest temporal axis was 282 observations, but this was only outside of the valid data area where the no-data masks do not cover the entire tiling scheme of the ingested information layer product because the ingested grid is larger than the actual granule footprints. The highest number of observations at any point within the granule footprints is 258 and the shortest is 150.

Three queries were conducted. First, vegetation-like (i.e. using the vegetation mask with a value of 1) and water-like semi-concepts (i.e. categories 21-24 based on the \acs{SIAM}™ granularity of 33 semi-concepts) were queried. Both queries took roughly 5 and 4 hours, respectively, to process all of the data, which was divided into 370 cells (i.e. tiles) of 10\acs{km} by 10\acs{km} by the maximum number of observations in time, and then mosaic them together. These queries are visualised in terms of the total number of matching observations, as well as the normalised occurrence index (i.e. value from 0 to 1, with 1 meaning an occurrence of 100% of the clean observations). The clean pixel layer is the same for both queries, and is what is used to normalise the values. "Unclean" pixels are defined as any pixels with a value of 1 in the no-date mask, and categories 25, 29, and 33  (i.e. cloud-like, ice-like and unclassified) based on the \acs{SIAM}™ granularity of 33 semi-concepts. The total number of pixels not included in the no-data mask (i.e. number of total valid pixels) was also calculated in order to show the spatial distribution of aggregated acquisitions on a per-pixel basis, but this unfortunately cannot take into account the variability distribution through time. This query took roughly 4 hours to complete and mosaic.

There is an issue in mosaicing output generated on a tile-by-tile basis. The strange grid lines on each of the resulting maps are one pixel wide and related to missing pixels separating each tile of the tiling scheme (i.e. 10\acs{km}), meaning they have a value of 0. See \autoref{sec:gridworkflow} for more information.

---

\begin{landscape}
\begin{figure}
\centering
\includegraphics{source/figures/maps/3yr_valid_total.png}
\caption{here are the number of total pixels containing measured values not equal to 0 in the original Sentinel-2 data based on nearly 3 years of data. Values 0-125 are white (because there are none) and the lilac purple colour begins at value 126, the lowest number of acquisitions. \label{fig:3yr_valid_total}}
\end{figure}
\end{landscape}

![Normalised water detection based on water semi-concepts in Syria near the border of Turkey, excluding no-data, cloud like and unclassified pixels from January 31, 2016 until January 31, 2018 (103 time observations). Time-series aggregation method similar to Mueller et al. (2016). \label{fig:3yr_total_close1}](source/figures/maps/3yr_total_close1.png)


\begin{landscape}
\begin{figure}
\centering
\includegraphics{source/figures/maps/3yr_clean_discrete.png}
\caption{here are the number of clean pixels based on nearly 3 years of data visualised using an equal interval legend using 10 classes. \label{fig:3yr_clean_discrete}}
\end{figure}
\end{landscape}

![Normalised water detection based on water semi-concepts in Syria near the border of Turkey, excluding no-data, cloud like and unclassified pixels from January 31, 2016 until January 31, 2018 (103 time observations). Time-series aggregation method similar to Mueller et al. (2016). \label{fig:3yr_clean_close1}](source/figures/maps/3yr_clean_close1.png)

\begin{landscape}
\begin{figure}
\centering
\includegraphics{source/figures/maps/3yr_veg_total.png}
\caption{here are the number of clean pixels based on nearly 3 years of data visualised using an equal interval legend using 10 classes. \label{fig:3yr_veg_total}}
\end{figure}
\end{landscape}

\begin{landscape}
\begin{figure}
\centering
\includegraphics{source/figures/maps/3yr_veg_norm.png}
\caption{here are the number of clean pixels based on nearly 3 years of data visualised using an equal interval legend using 10 classes. \label{fig:3yr_veg_norm}}
\end{figure}
\end{landscape}

\begin{landscape}
\begin{figure}
\centering
\includegraphics{source/figures/maps/3yr_water_total.png}
\caption{here are the number of clean pixels based on nearly 3 years of data visualised using an equal interval legend using 10 classes. \label{fig:3yr_water_total}}
\end{figure}
\end{landscape}

\begin{landscape}
\begin{figure}
\centering
\includegraphics{source/figures/maps/3yr_water_norm.png}
\caption{here are the number of clean pixels based on nearly 3 years of data visualised using an equal interval legend using 10 classes. \label{fig:3yr_water_norm}}
\end{figure}
\end{landscape}

![Normalised water detection based on water semi-concepts in Syria near the border of Turkey, excluding no-data, cloud like and unclassified pixels from January 31, 2016 until January 31, 2018 (103 time observations). Time-series aggregation method similar to Mueller et al. (2016). \label{fig:3yr_veg_norm_close1}](source/figures/maps/3yr_veg_norm_close1.png)

![Normalised water detection based on water semi-concepts in Syria near the border of Turkey, excluding no-data, cloud like and unclassified pixels from January 31, 2016 until January 31, 2018 (103 time observations). Time-series aggregation method similar to Mueller et al. (2016). \label{fig:3yr_veg_norm_close2}](source/figures/maps/3yr_veg_norm_close2.png)

![Normalised water detection based on water semi-concepts in Syria near the border of Turkey, excluding no-data, cloud like and unclassified pixels from January 31, 2016 until January 31, 2018 (103 time observations). Time-series aggregation method similar to Mueller et al. (2016). \label{fig:3yr_veg_water_norm_close1}](source/figures/maps/3yr_veg_water_norm_close1.png)

![Normalised water detection based on water semi-concepts in Syria near the border of Turkey, excluding no-data, cloud like and unclassified pixels from January 31, 2016 until January 31, 2018 (103 time observations). Time-series aggregation method similar to Mueller et al. (2016). \label{fig:3yr_veg_water_norm_close2}](source/figures/maps/3yr_veg_water_norm_close2.png)


## Exploration: Afrin

1 May to 15 June 2016, 2017 and 2018

These results took approximately 10 minutes for each year to cover Afrin, including aggregated time-series analysis of vegetation semi-concepts (~7 minutes) and the no-data mask to ascertain the number of images (~2 minutes). The area (latitudes 36.2°-37.0°N; longitudes 36.3°-37.3°E)contained 100 different 10\acs{km} by 10\acs{km} cells with differing numbers of images available per year and spatial location.

The number of time-steps available per year were: at most 12 time-steps, but otherwise 8 in 2016; at most 9 but otherwise 5 in 2017; and at most 17, but otherwise 9 in 2018.


![Normalised water detection based on water semi-concepts in Syria near the border of Turkey, excluding no-data, cloud like and unclassified pixels from January 31, 2016 until January 31, 2018 (103 time observations). Time-series aggregation method similar to Mueller et al. (2016). \label{fig:afrin_valid_total}](source/figures/maps/afrin_valid_total.png)


![Normalised water detection based on water semi-concepts in Syria near the border of Turkey, excluding no-data, cloud like and unclassified pixels from January 31, 2016 until January 31, 2018 (103 time observations). Time-series aggregation method similar to Mueller et al. (2016). \label{fig:afrin_veg_clean}](source/figures/maps/afrin_veg_clean.png)

![Normalised water detection based on water semi-concepts in Syria near the border of Turkey, excluding no-data, cloud like and unclassified pixels from January 31, 2016 until January 31, 2018 (103 time observations). Time-series aggregation method similar to Mueller et al. (2016). \label{fig:afrin_veg_total}](source/figures/maps/afrin_veg_total.png)


![Normalised water detection based on water semi-concepts in Syria near the border of Turkey, excluding no-data, cloud like and unclassified pixels from January 31, 2016 until January 31, 2018 (103 time observations). Time-series aggregation method similar to Mueller et al. (2016). \label{fig:afrin_veg_norm}](source/figures/maps/afrin_veg_norm.png)

![Normalised water detection based on water semi-concepts in Syria near the border of Turkey, excluding no-data, cloud like and unclassified pixels from January 31, 2016 until January 31, 2018 (103 time observations). Time-series aggregation method similar to Mueller et al. (2016). \label{fig:afrin_diff20172016}](source/figures/maps/afrin_veg_norm_diff20172016.png)

![Normalised water detection based on water semi-concepts in Syria near the border of Turkey, excluding no-data, cloud like and unclassified pixels from January 31, 2016 until January 31, 2018 (103 time observations). Time-series aggregation method similar to Mueller et al. (2016). \label{fig:afrin_diff20182017}](source/figures/maps/afrin_veg_norm_diff20182017.png)

![Normalised water detection based on water semi-concepts in Syria near the border of Turkey, excluding no-data, cloud like and unclassified pixels from January 31, 2016 until January 31, 2018 (103 time observations). Time-series aggregation method similar to Mueller et al. (2016). \label{fig:afrin_diff20172016_2}](source/figures/maps/afrin_veg_norm_diff20172016_2.png)

![Normalised water detection based on water semi-concepts in Syria near the border of Turkey, excluding no-data, cloud like and unclassified pixels from January 31, 2016 until January 31, 2018 (103 time observations). Time-series aggregation method similar to Mueller et al. (2016). \label{fig:afrin_diff20182017_2}](source/figures/maps/afrin_veg_norm_diff20182017_2.png)


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
