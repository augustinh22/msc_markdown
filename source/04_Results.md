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

Below are visualised outputs from the implementation for two different spatial-extents with multiple temporal-extents. The first covers nearly 3 years of data over the whole study area looking at vegetation-like and water-like semi-concepts, as well as the distribution of data through space. The second repeats a similar query for vegetation-like semi-concepts from 1 May to 15 June in three separate years (2016, 2017, 2018), and the difference between the normalised vegetation-like observation occurrence is calculated, but requires further discussion.


## Exploration: June 2015-2018 \label{sec:explore_1}

An aggregated time-series analysis on the entire geo-spatio-temporal extent of the cube was conducted (i.e. from 28 June 2015 until 22 June 2018 over latitudes 36.01°-37.05°N and longitudes 35.67°-39.11°E in \acs{EPSG}:4326), effectively covering 3 years of data in 591 Sentinel-2 scenes. The longest temporal axis was 282 observations, but this was only outside of the valid data area where the no-data masks do not cover the entire tiling scheme of the ingested information layer product because the ingested grid is larger than the actual granule footprints. The highest number of observations at any point within the granule footprints is 258 and the shortest is 150.

\graffito{Ranging from 4 to 5 hours per query.}

Three queries were conducted. First, vegetation-like (i.e. using the vegetation mask with a value of 1) and water-like semi-concepts (i.e. categories 21-24 based on the \acs{SIAM}™ granularity of 33 semi-concepts) were queried. Both queries took roughly 5 and 4 hours, respectively, to process all of the data, which was divided into 370 cells (i.e. tiles) of 10\acs{km} by 10\acs{km} by the maximum number of observations in time, and then mosaic them together. These queries are visualised in terms of the total number of matching observations, as well as the normalised occurrence index (i.e. value from 0 to 1, with 1 meaning an occurrence of 100% of the clean observations). The clean pixel layer is the same for both queries, and is what is used to normalise the values. "Unclean" pixels are defined as any pixels with a value of 1 in the no-date mask, and categories 25, 29, and 33  (i.e. cloud-like, ice-like and unclassified) based on the \acs{SIAM}™ granularity of 33 semi-concepts. The total number of pixels not included in the no-data mask (i.e. number of total valid pixels) was also calculated in order to show the spatial distribution of aggregated acquisitions on a per-pixel basis, but this unfortunately cannot take into account the variability distribution through time. This query took roughly 4 hours to complete and mosaic.

There is an issue in mosaicing output generated on a tile-by-tile basis. The strange grid lines on each of the resulting maps are one pixel wide and related to missing pixels separating each tile of the tiling scheme (i.e. 10\acs{km}), meaning they have a value of 0 (*see* \autoref{sec:gridworkflow} for more information).

---

\begin{landscape}
\begin{figure}
\centering
\includegraphics{source/figures/maps/3yr_valid_total.png}
\caption{The number of total pixels containing measured values not equal to 0 in the original Sentinel-2 data based on nearly 3 years of data. Values 0-125 are white (because there are none) and the lilac purple colour begins at value 126, the lowest number of acquisitions. \label{fig:3yr_valid_total}}
\end{figure}
\end{landscape}

![A closer look at the number of total pixels containing measured values not equal to 0 in the original Sentinel-2 data. Values 0-125 are white (because there are none) and the lilac purple colour begins at value 126, the lowest number of acquisitions. (c): same area as in (b), but with OpenStreetMap data for context. \label{fig:3yr_total_close1}](source/figures/maps/3yr_total_close1.png)

\begin{landscape}
\begin{figure}
\centering
\includegraphics{source/figures/maps/3yr_clean_discrete.png}
\caption{The number of clean pixels based on nearly 3 years of data visualised using an equal interval legend using 10 classes with values ranging from 0 to 258. \label{fig:3yr_clean_discrete}}
\end{figure}
\end{landscape}

![A closer look at the number of clean pixels based on nearly 3 years of data visualised using an equal interval legend using 10 classes with values ranging from 0 to 258. (c): same area as in (b), but with OpenStreetMap data for context. \label{fig:3yr_clean_close1}](source/figures/maps/3yr_clean_close1.png)

\begin{landscape}
\begin{figure}
\centering
\includegraphics{source/figures/maps/3yr_veg_total.png}
\caption{The number of total vegetation-like pixels observed based on nearly 3 years of data visualised. This is just meant to illustrate pixels having more than 3 observations up to 177 of vegetation-like semi-concepts over 3 years. \label{fig:3yr_veg_total}}
\end{figure}
\end{landscape}

\begin{landscape}
\begin{figure}
\centering
\includegraphics{source/figures/maps/3yr_veg_norm.png}
\caption{The normalised index of vegetation occurrence over nearly 3 years of data visualised using an equal interval legend using 8 classes. Values below or equal to 0.125, including values of 0 are coloured white. \label{fig:3yr_veg_norm}}
\end{figure}
\end{landscape}

\begin{landscape}
\begin{figure}
\centering
\includegraphics{source/figures/maps/3yr_water_total.png}
\caption{The number of total water-like pixels observed based on nearly 3 years of data visualised. This is just meant to illustrate pixels having more than 3 observations up to 158 of water-like semi-concepts over 3 years. \label{fig:3yr_water_total}}
\end{figure}
\end{landscape}

\begin{landscape}
\begin{figure}
\centering
\includegraphics{source/figures/maps/3yr_water_norm.png}
\caption{The normalised index of water occurrence over nearly 3 years of data visualised using an equal interval legend using 8 classes. Values below or equal to 0.125, including values of 0 are coloured white. \label{fig:3yr_water_norm}}
\end{figure}
\end{landscape}

![A closer look at the normalised index of vegetation occurrence along the border to Turkey. Values below or equal to 0.125, including values of 0 are coloured white. (c): same area as in (b), but with OpenStreetMap data for context. \label{fig:3yr_veg_norm_close1}](source/figures/maps/3yr_veg_norm_close1.png)

![Another closer look at the normalised index of vegetation occurrence along the border to Turkey. Values below or equal to 0.125, including values of 0 are coloured white. (c): same area as in (b), but with OpenStreetMap data for context. \label{fig:3yr_veg_norm_close2}](source/figures/maps/3yr_veg_norm_close2.png)

![A closer look at the normalised index of vegetation but also water occurrence in Turkey. Values below or equal to 0.125, including values of 0 are coloured white. (c): same area as in (b), but with water occurrence overlaid on top of vegetation occurrence. \label{fig:3yr_veg_water_norm_close1}](source/figures/maps/3yr_veg_water_norm_close1.png)

![Another closer look at the normalised index of vegetation but also water occurrence in Turkey. Values below or equal to 0.125, including values of 0 are coloured white. (c): same area as in (b), but with water occurrence. Here some artefacts from terrain shadows and clouds are visible. \label{fig:3yr_veg_water_norm_close2}](source/figures/maps/3yr_veg_water_norm_close2.png)

\clearpage

## Exploration: Multi-year May-June \label{sec:explore_2}

An aggregated time-series analysis for the same spatial extent in three different years was conducted (i.e. from 1 May to 15 June in 2016, 2017 and 2018) over the area in Syria known as Afrin (i.e. latitudes 36.2°-37.0°N and longitudes 36.3°-37.3°E in \acs{EPSG}:4326). The area contained 100 different 10\acs{km} by 10\acs{km} cells with differing numbers of scenes available per year and spatial location.

The number of time-steps available per year were: at most 12, but generally 8 in 2016; at most 9 but otherwise 5 in 2017; and at most 17, but otherwise 9 in 2018. In 2016, a count of 12 was reported as the largest number of acquisitions, but the highest value to actually appear is 8. This is assumed to be due to edge effects of the tiling scheme and the overlapping acquisition swaths. Further exploration is necessary to understand why this value is what it is.

\graffito{Around 10 minutes to process per year.}

These results took approximately 10 minutes for each year to cover Afrin, including aggregated time-series analysis of vegetation semi-concepts (~7 minutes) and the no-data mask to ascertain the number of underlying valid scenes per-pixel (~2 minutes).

---

![(a): the spatial extent of the queried; (b,c and d): the number of acquisitions available from 1 May to June 15 in each of the years. 2018 has considerably more acquisitions because Sentinel-2B became operational in the months following June 2017.  \label{fig:afrin_valid_total}](source/figures/maps/afrin_valid_total.png)

![The number of clean pixels available for 1 May to 15 June in each year. Artefacts from cloud-like semi-concepts and surfaces with a higher reflectance can be seen, but also the overlapping swaths. The city of Aleppo is located in the lower right corner. \label{fig:afrin_veg_clean}](source/figures/maps/afrin_veg_clean.png)

![The total number of vegetation-like observations available for 1 May to 15 June in each year. Pixels with a value of 0 are white. Differences in the baseline total number of observations for each year is visible. \label{fig:afrin_veg_total}](source/figures/maps/afrin_veg_total.png)

![The normalised occurrence of vegetation-like observations available for 1 May to 15 June in each year. Be wary when interpreting, since some areas only have 6 moments in time to even work with (i.e. two vegetation-like observations automatically can mean at least 33%, and if clouds were observed once, 40%!) \label{fig:afrin_veg_norm}](source/figures/maps/afrin_veg_norm.png)

![Difference between the normalised occurrence of vegetation-like observations from 1 May to 15 June between 2017 and 2016. The 2016 results are subtracted from 2017, meaning negative values had a higher observed vegetation occurrence in 2016 than in 2017 (reddish), values of 0 had no change, and positive values had higher observed vegetation occurrence in 2017 than 2016. Values ±0.111 are white. \label{fig:afrin_diff20172016}](source/figures/maps/afrin_veg_norm_diff20172016.png)

![Difference between the normalised occurrence of vegetation-like observations from 1 May to 15 June between 2018 and 2017. The 2017 results are subtracted from 2018, meaning negative values had a higher observed vegetation occurrence in 2017 than in 2018 (reddish), values of 0 had no change, and positive values had higher observed vegetation occurrence in 2018 than 2017. Values ±0.111 are white. \label{fig:afrin_diff20182017}](source/figures/maps/afrin_veg_norm_diff20182017.png)

![Difference between the normalised occurrence of vegetation-like observations from 1 May to 15 June between 2017 and 2016. The 2016 results are subtracted from 2017, meaning negative values had a higher observed vegetation occurrence in 2016 than in 2017 (reddish), values of 0 had no change, and positive values had higher observed vegetation occurrence in 2017 than 2016. Values ±0.111 are white. \label{fig:afrin_diff20172016_2}](source/figures/maps/afrin_veg_norm_diff20172016_2.png)

![Difference between the normalised occurrence of vegetation-like observations from 1 May to 15 June between 2018 and 2017. The 2017 results are subtracted from 2018, meaning negative values had a higher observed vegetation occurrence in 2017 than in 2018 (reddish), values of 0 had no change, and positive values had higher observed vegetation occurrence in 2018 than 2017. Values ±0.111 are white. \label{fig:afrin_diff20182017_2}](source/figures/maps/afrin_veg_norm_diff20182017_2.png)
