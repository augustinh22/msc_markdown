\cleardoublepage
\pagestyle{scrheadings}
\cleardoublepage
\chapter{Discussion}\label{ch:discussion}

This section looks more closely at the proof-of-concept results provided in \autoref{ch:proof} derived exclusively from a dense time-series of automatically semantically enriched Sentinel-2 scenes. Finer details pertaining to the data, design decisions and methods used, including challenges faced along the way are explored. It is structured in a way that separates the output of the system from the original Sentinel-2 data and implementation methods.


# Interpretation of Maps \label{sec:map_interpretation}

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

While there are no metrics of statistically-based confidence to offer here, water-like semi-concepts sometimes look very similar to areas with shadow, whether from clouds or terrain. It is important to make clear that even in an exploratory way, water-like semi-concepts move through relatively more uncertainty than looking at vegetation-like semi-concepts without incorporating any additional knowledge or information (e.g. \acs{DEM}, improved cloud and cloud-shadow masking). As becomes immediately evident when looking at \autoref{fig:3yr_water_total}, the more mountainous region in the West contains observed water-like semi-concepts in areas that are very likely mostly shadows from mountainous terrain (*see* \autoref{fig:3yr_veg_water_norm_close2} (c)). What are likely freshly irrigated (i.e. basically flooded) agricultural fields can also be assumed to be made visible based on their regular, rectangular shapes and very low counts of water-like observations (i.e. depicted in a yellowish tone).

The lack of a thermal band in Sentinel-2 imagery also makes dense clouds with relatively high reflectance difficult to discern as being cloud-like, especially when located over water bodies. Based on closer examination of the generated information layers, those pixels are often are attributed to a built-up semi-concept with very high reflectivity. This artefact can also be seen in the Mediterranean sea in Figures \ref{fig:3yr_water_total} and \autoref{fig:3yr_veg_water_norm_close2}, whereby the huge water body that ought to always be identified as looking like deep water has a range of total water-like observations despite having mostly the same number of available acquisitions (*see* \autoref{fig:3yr_valid_total}) and clean pixels (*see* \autoref{fig:3yr_clean_discrete}). @tulbureSurfaceWaterExtent2016 also faced difficulties with shallow water due to high spectral variability when calculating surface water extent dynamics in Australia, so it is not a problem only faced when using generic semi-concepts.

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


## Potential Connection to SDGs \label{sec:potential_sdg}

Aggregated time-series output was generated in the hopes of moving towards an automated workflow to supply information in the scope of the \acp{SDG} mentioned in \autoref{sec:framing}. Surface water bodies and various types of vegetated land cover (e.g. agricultural fields, forests) cannot be explicitly identified or classified with this output, but seem to be able to be made visible in some way using this generic implementation based on the initial exploratory proof-of-concept output (*see* {ch:proof}). It seems plausible, that similar automatically generated output from this generic semantic data cube could be integrated with additional data to offer spatially-explicit evidence to eventually support the \acp{SDG}, whether at 10\acs{m} spatial resolution or based on larger, meaningful objects.

---

\spacedlowsmallcaps{Indicator 2.4.1} proportion of agricultural area under productive and sustainable agriculture

While agricultural areas cannot directly be discerned from output, in arid climates, such as the eastern part of the study area, vegetated agricultural fields can be visually detected over a defined growing season. Looking at the dynamics of the greenness of these fields, once identified, could offer more information about the level or frequency of productivity over time. Changes relative to these identified agricultural field objects (*see* \autoref{fig:afrin_diff20182017} for a preliminary idea of what this could look like on a per-pixel basis), paired with information about drought, temperature, rainfall, or other factors, could be monitored and provide spatially-explicit information relevant to the food security of a region. \ac{EO}-derived information in this context could provide more insight into where changes to agricultural fields are occurring in order to inform campaigns, such as building or repairing irrigation infrastructure, supplying seeds, etc.

---

\spacedlowsmallcaps{Indicator 6.6.1} change in the extent of water-related ecosystems over time

Sentinel-2 data is limited to detecting objects or surfaces visible from space, which makes certain types of water-related ecosystems difficult to detect. Smaller waterways, for example, may not be visible, or surface water located under vegetation, not to mention ground-water-fed ecosystems. However, the extent of relatively permanent and seasonal surface water can be made visible in an ad-hoc way. Perhaps the annual average extent of a lake has not changed in the past 4 years, but the dynamics of when it grows and shrink have and are important to note. Temporally-specific changes in surface water extent could be queried using a generic implementation like this (*see* (c) in \autoref{fig:3yr_veg_water_norm_close1} or \autoref{fig:3yr_water_norm}).

An existing set of methods for calculating determining this indicator using \ac{EO} data already exists from the \acs{EO4SDG} initiative run by \acs{GEO} [<http://eo4sdg.org/wp-content/uploads/2017/07/SDG6.6.1\_brief\_GEO\_Week\_2017-2.pdf>]. The proof-of-concept implementation used in producing \autoref{fig:3yr_water_norm} is much more generic, but must be tested for transferability to other geographic locations and temporal extents. This is not because the semantic information is not transferable, rather due to potential limitations that arise when applied to different places on Earth with different data availability, quality and characteristics (e.g. cloud cover). Sentinel-2 images have a higher temporal frequency than the data being used by, which may be necessary for certain applications in comparison to extraction with Landsat-8 imagery used by \acs{EO4SDG}.

---

\spacedlowsmallcaps{Indicator 15.1.1} forest area as a proportion of total land area

Looking at figures such as \ref{fig:3yr_veg_water_norm_close1} and \ref{fig:3yr_veg_water_norm_close2} in comparison to \autoref{fig:3yr_veg_norm_close1}, it is clear that forested areas in this study area not only have a higher relative normalised occurrence of vegetation-like semi-concepts, but also have a different physical structure. The increased normalised occurrence paired with information of the distribution and variation of detected semi-concepts over time, as well as some sort of shape information (e.g. texture, size, compactness) could be used to delineate certain kinds of forests from other kinds of vegetated land cover.

This is the only indicator of the three listed here that is rated at "tier 1", meaning that established and acceptable methodology exists and data are already widely available. There ought to be enough spatially-explicit information and geospatial datasets that exist to test different object-based methods used on output from a system that can then be checked for agreement.

---


## Challenges for Interpretation

Various challenges in interpreting the output were already mentioned, but here is a brief overview:

- variability of acquisitions, "clean" pixels and total observations meeting query results make interpretation complex
- lack of methods and metrics to take variability through time into account
- calculating differences between seasons or years based on aggregated output may be misleading (i.e. are they even comparable?)
- knowledge of the periodicity of per-pixel semi-concepts that change, but also their stability over longer time-frames would improve interpretation (i.e. lack of changing from observation to observation over time)
- finding ways to characterise not only variability, but patterns of differences through time, or ways take it them account during interpretation
  - ability to give information about seasonality and dynamics (e.g. type of crop, harvest or mowing cycles, ...)
- more complex queries are probably more difficult to interpret (e.g. automated post-classification change detection instead of just detection of occurrence)
- grouping of pixels containing shadows and water into water-like semi-concepts
- other kinds of semi-concepts may present different challenges or require different kinds of information towards building meaningful output
- lack of data for the study area that is up-to-date enough to serve testing for agreement or validity
- these kind of queries need to be interpreted in the seasonality in which they occur (e.g. a 3 year aggregation of data fir a location that experiences a monsoon season can only be interpreted knowing that the result has temporal gaps)


# Discussion of Data

The only data used in this implementation were Sentinel-2 \ac{L1C} data, and information layers generated from them. For detecting objects larger than 8 pixels (e.g 800\acs{m}²) the 10\acs{m} resolution is likely sufficient. It could be that output might not be able to be validated in big data domains, but that means that there is an even stronger need for proper validation of methods and source data.


## ESA Cloud-Masks

Scene related quality information is offered with Sentinel-2 products, including an automatically generated cloud cover mask. This mask is used to calculate the average cloud cover for the scene. The algorithms used to calculate this mask are proprietary and not freely or openly available.

There was a consideration at some point to include a rasterised version of the cloud masks that are provided in the implementation used here, but the quality seemed not to be reliable and fairly inconsistent. There are many different kinds of clouds and not all of them are detectable by the algorithm being used, probably because \ac{ESA} wants to reduce false positives (i.e. incorrectly labelling a pixel as being clouded) and only provides results that are very certain to be true. Thin clouds, for example, are often not masked as clouds, but provide plenty of problems for analysis.

Further examination of the existing cloud masks must be conducted in order to completely rule out incorporation. Even if the masks do not include all of the cloud cover, if the pixels that are masked are, in fact, quite often correct, then they could be compared with the cloud-like semi-concepts to improve confidence. They could also be incorporated in some way to establish a layer of likelihood that the pixels labelled as being cloud-like are actually clouds. Without knowing how the \ac{ESA} algorithm works, this makes little sense.


## ESA Level-2A

Images must to be calibrated from digital numbers to at least \ac{ToA} reflectances in order to be comparable to each other. \acs{SIAM}™ requires data to be calibrated to at least \ac{ToA} reflectance in order to generate meaningful output. Sentinel-2 data are offered as \ac{ESA} \ac{L1C}, which means they are calibrated to \ac{ToA}. While still considered open data, the pre-processing algorithms applied to the \ac{EO} data provided by the Copernicus programme are not open, but proprietary. This has many implications for understanding the basis of scientific analysis conducted with them, because these pre-processing steps are not transparent.

Including a robust, reliable and automated method for calibrating the images to \ac{BoA} or \ac{SURF} might improve pre-classification results. This sort of calibration ultimately requires data about the atmosphere at the moment of observation, which current methods can only approximate. This sometimes lead to undesirable or misleading output that is also not necessarily comparable between different images or different geographic or temporal locations.

At the time of writing, \ac{ESA} intends to start offering world-wide \ac{L2A} products, which include data calibrated to \ac{BoA} and a \ac{SCM}. These products are also generated using proprietary algorithms, which makes it difficult to decompose what processing has occurred and to ascertain an idea of quality, reliability and different kinds of variation (e.g. does it work well over snow?; does it work well in different climate zones? what is the variation of quality or reliability through space and time within the archive?). A further step to consider would be whether or not to include the \ac{L2A} data and \ac{SCM} in a data cube, as well as to test the ability of \acs{SIAM}™ to handle the data supposedly calibrated to \ac{BoA}.


## Challenges

An overview of some of the challenges faced in using the currently available processed version of Sentinel-2 data processed to \ac{L1C} include:

- long path names
- swaths vs. granules
- projections if a similar implementation is transferred to other areas
- data redundancy (keeping own copy) and size
- Sentinel-2 geometric alignment inconsistencies

The issue of long path names was avoided here by using Linux instead of a Windows \ac{OS}. It is important to note that while the file names of Sentinel-2 products have since been shortened, this could still pose issues to anyone wanting to use the data on Windows.

Swaths and the granule tiling-scheme that Sentinel-2 products are provided in sometimes conflict with each other. One example is granule 37SCA covering Syria and Turkey in this implementation. Any data at any point in time acquired for this granule does not cover it completely due to the swath overlap. This has different implications for calculating granule-based statistics, since two small triangles of the granule are always comprised of completely different sets of observations, whereas the middle is covered by both swaths. Perhaps this has little effect on average statistical metrics over longer time-spans, but this may misrepresent the data that exists in the archive in certain cases, especially so long as archive access is based on granule-wide metadata and not the actual content of images. When searching for scenes to use in analysis over smaller areas, pay attention to the relative orbit number to make sure that you are getting data acquired by the swath that covers your area of interest.

Luckily all data used in this implementation was already provided in a common projection (\acs{UTM} zone 37N, \acs{EPSG}:32637). However, this will not be the case for most other big Earth data applications, especially meant for areas larger than 30,000\acs{km}². It definitely makes sense to start thinking of solutions to handle multiple projections. Perhaps this can be accommodated by using methods to re-project data on the fly depending on the spatial extent and location of a query, or to re-project data before loading into a data cube implementation. The pros and cons of different methods need to be assessed, especially since re-projection requires resampling, which changes the values of the data, and could impact analysis, results and the reproducibility of results if not properly documented.

The current implementation has a lot of data redundancy. This could be discussed further in discussing methods, but the idea of keeping the all of the original Sentinel-2 data used in the implementation has already proven to be important. The processing baselines for Sentinel-2 \acs{L1C} data change and have changed, and sometimes includes re-processing of already archived data, replacing data processed with an older processing baseline. For example, a recent announcement was made that the entire archive would be re-processed to meet a need for improved geometric corrections [**cite ESA news**], which is very relevant for a pixel-based implementation such as the one presented here. Keeping the original data used in an implementation such as this could be important if differences between processing baselines could impact whatever analysis.


# Discussion of Methods

Any number of software and technologies could have been used in this proof-of-concept implementation. A bit more information on the justification and challenges surrounding specific tools and methods are discussed.

## Data Acquisition

Since the automated workflow was implemented in January 2018, the download hub has seemed to be fairly stable. The Hub's Python \ac{API} has also made data access fairly uncomplicated to automate. However, downloading data is the part of the automated workflow that takes the longest amount of time, and is the least reliable due to external factors (e.g. Internet connection, Hub status).

It might make sense to avoid downloading the original Sentinel-2 data entirely by processing the data with \acs{SIAM}™ where they are located, and only saving the generated information layers. However, this sort of set-up creates a bit of tension with the reproducibility of results. The Sentinel-2 data source is a huge and growing body of data, which is likely to not always be available everywhere for the entire duration of acquisition, but distributed among various mirrors. The Sentinel-2 archive is also about to be completely re-processed, which will replace the existing products that Sentinel-2-based analysis conducted up to now has relied on. These results will not be reproducible unless the researchers keep a copy of the data used for their analysis.


## Re-formatting

\graffito{Data redundancy trade-off for reproducibility of results.}

This step in the automated workflow essentially produces redundant data that takes up more space on the server. These data are not used once the \acs{SIAM}™ information layers have been generated.  However, if changes occur to any of the Python packages used to generate these re-formatted layers, keeping them could be used to identify differences, and whether or not they produce comparable output for the task at hand.

Methods also exist for improved resampling of lower resolution bands, that work a bit like pan sharpening based on characteristics of the available 10\ac{m} bands. Whether or not this would have an affect on resulting information layers, in what way and how much would be something to explore.


### No-Data Mask Generation \label{sec:nodata_mask}

It has been assumed that pixels with a measured value of 0 in any of the six re-formatted Sentinel-2 bands be excluded (i.e. masked), but this may be a fault assumption more often than I am aware. However, information on pixels not containing valid data for each band within a scene is not yet supplied with Sentinel-2 products. Even if the image footprint is supplied in the metadata, each band’s measurements at the edge of an orbit swath are most often not identical. Pixels with a measured value of 0 in any of the six bands are thus excluded from semantic enrichment. I found this assumption useful as a relatively simple way to drastically reduce faulty semi-concept assignment to pixels lacking valid data in any of the six bands within an image at a given time, as happens mostly at the edge of an orbit swath. However, this assumption may also occasionally exclude meaningful information (i.e. when a valid measurement has a value of 0).


## Pre-classification

A huge array of classification algorithms and methods exist in the realm of \ac{EO}. \acs{SIAM}™ was chosen because it produces reproducible and repeatable output in an automated way without any user-parametrisation, uses multi-dimensional decision rules, and can be transferred to multiple optical sensors, including Landsat. A future project would be to incorporate Landsat data also processed with \acs{SIAM}™ as another produce in the \ac{ODC} to be able to ask similar semantic queries. This would lengthen the temporal extent considerably.

The semi-concept granularites generated by \acs{SIAM}™ group pixels based on what they look like, not necessarily on what they contain, and ought to be used as building blocks in further methods. Many other classifiers require samples and are not transferable to different sensors, much less produce output that are transferable to different images. Exploration of other solutions is a point of further research, but \acs{SIAM}™ was chosen, despite its closed-source license, because there seems to be a lot of potential in what can be built on top of the information layers it generates.


### Exclusion of Thermal Decision-rules

\acs{SIAM}™ ultimately requires a thermal band for its decision rules. The current implementation basically creates a fake thermal band with a constant value of 110 to avoid thermal decision rules. This may, however, be part of the reason that highly reflective clouds are assigned to a bare-soil semi-concept, because there is a lack of relatively colder thermal-related values. Further exploration is required, but this likely has a low impact on aggregated dynamics analysis, especially in environments with low average cloud cover like the study area focused on here in Syria and Turkey.


## Data Cube

\graffito{Spread the cubes, any cubes!}

Rasdaman was almost chosen for this implementation, but interest in a completely open-source movement to enable data cube implementations for everyone was interesting. Seeing as the \ac{ODC} software is already being used in a few larger-scale implementations (e.g. \acs{AGDC}, \acs{SDC}, CDCol in Columbia), the scalability was not in question for any intended future use, even if it may pose other challenges. Two points deserve a bit more detailed discussion, and that includes the tiling scheme used in this implementation as well as the datacube \ac{API} class called *GridWorkflow*, which allows distributed processing of arrays that exceed in-memory capacity.


### Ingestion Tiling Scheme

At the moment, this implementation uses a tiling scheme of 10\acs{km} by 10\acs{km} by one moment in time. The idea behind this was to keep tiles fairly small, in the case that processing had to occur in-memory. A tiling scheme of 10\acs{km} by 10\acs{km} by multiple observations in time may make much more sense. Further research into the implications of different partitioning schemes on \ac{ODC} performance and analysis is necessary. These sort of explorations also ought to test performance of different kinds of queries that prioritise different dimensions or different numbers of variables at once (e.g 33 semi-concepts, 96 semi-concepts, vegetation mask). However, this kind of assessment is definitely beyond the scope of this thesis.


### GridWorkflow \label{sec:gridworkflow}

One challenge is that processing using the Python \ac{API} occurs predominantly using in-memory data. This complicates implementation on the current hardware as it requires a user to load the complete dataset prior to analysis and is a limitation for smaller institutions. The *GridWorkflow* class offers tools to work on analysis in bite-sized chunks, but proves challenges for any analysis where the context that pixels are situated in needs to be taken into consideration (e.g. neighbours). This is a data dependency issue that needs further exploration within data cube technologies including the \ac{ODC}.

An artefact from using *GridWorkflow* was noticed when loading individual chunked tiles, as well as the tiles mosaiced using \ac{GDAL} after processing. This artefact is 1 pixel (i.e. 10\ac{m}) wide along the edges of the tiling scheme. The *dask*[^6] chunks for processing were based on the tiling scheme. After speaking with someone at \ac{CSIRO} who knows the code base a bit better, it could stem from a registration error between different language libraries used in implementing the *GridWorkflow* class (i.e. a difference between indexing starting at 0 or 1). A planned update to the newest release of the \ac{ODC} software may solve this issue.

[^6]: *Dask* is a Python package for scaling multi-dimensional data analysis using *Numpy* (another Python package) arrays, which is a bit more of what happens under the hood of the \ac{ODC}.


## Informal Benchmarks \label{sec:benchmarks}

This was a proof-of-concept implementation of a semantic data cube and was never intended to optimise or even evaluate the speed or efficiency of processes or workflows. However, the volume of data that will accumulate even over one more year of operation and the limitations on in-memory processing seem to be the largest hurdles in terms of future implementation of a similar system. Just to summarise, downloading data all the way up to ingestion of the generated information layers into an implementation of the \ac{ODC} takes the following tasks around so much time, given a bit of wiggle room:

  - download: 10 minutes
  - prep for SIAM™: 1 minute
  - SIAM™ processing: 5 minutes
  - indexing: 10 seconds
  - ingestion: 1 minute

\graffito{Conservatively estimated at 17 minutes per granule-sized scene.}

This means that even with relatively slow downloads (e.g. often it only takes a few minutes), one granule can be processed and incorporated in around 17 minutes. Downloads can occur simultaneously, depending on a multitude of variables, and SIAM™ processing can easily be distributed among different cores. Just as an exercise of curiosity, an estimate of how long it would take to rebuild this implementation will be estimated. These values are based on the current existence of around 600 Sentinel-2 granules. There is also perhaps unreasonable assumptions of linear processing, that granule-based Sentinel-2 products are all the same size, and that no interruptions in Internet connectivity, Hub service, etc. occur. Based on these assumptions, it would take approximately so long for each step to rebuild the implementation in a linear way, including downloads, since everything has already been automated:

  - download: (600 granules * 10 minutes) = 6,000 minutes
  - prep for SIAM™: (600 * 1 minute) = 600 minutes
  - SIAM™ processing: (600 * 5 minutes) = 3,000 minutes
  - indexing: (600 * 10 seconds) = 100 minutes
  - ingestion: (600 * 1 minute) = 600 minutes

\graffito{3.16 days}

This results in 10,300 minutes, or 7.153 days of processing, assuming nothing runs in parallel. However, SIAM™, for example, was distributed among 12 \acp{CPU} when creating this implementation, and downloads occurred using at least 2 Copernicus Open Access Hub accounts. This results in the following fairly conservative estimation of 4,550 minutes (i.e. 75.83 hours, or 3.16 days).


## Jupyter notebooks

\graffito{More of these!}

All I can say is that these things are great, especially for sharing and documenting code in a learning environment.


# Revisiting Research Questions

This thesis aimed towards answering some specific lines of inquiry. Very brief replies are shared here, or relevant sections in the rest of this thesis are referenced that already offer some thoughts towards potential answers or solutions.


## Context

*What are some ways that \ac{EO} contributes or can be envisioned as contributing towards spatially-explicit evidence for \acp{SDG} indicators?*

Free and open \ac{EO} data are one of the few global data sources independent of borders. *See* \autoref{sec:sdg_and_eo} and \autoref{sec:potential_sdg}


*What are some current examples of free and open \ac{EO}-based indicators or evidence for indicators?*

There are many existing examples. See \autoref{sec:sota_eo_info} for a very small selection.


## Implementation

*Is it possible to automatically download Sentinel-2 data and automatically enrich it semantically?*

Yes. Improving the level of the automatic semantic enrichment, what it can be used for and how is an on-going field of research blending domains of \ac{EO}, computer science, cognition, image understanding and more.

*Can all Sentinel-2 data available for a region be automatically incorporated in a semantically enriched data cube?*

Yes, and this implementation can even be reasonably considered to scale-up to a few times larger in data volume using a similar implementation as here. See \autoref{sec:benchmarks} for a very rough idea of how long this could take.

*Is the available hardware sufficient for such an automated workflow and queries within a reasonable execution time?*

It depends on the query. For the purposes of this thesis, most exploratory queries could be conducted in 30 minutes or less. Even processing all of the available ingested spatio-temporal extent only took around 4 hours for each relatively uncomplicated query. More complex queries (i.e. more array functions) years of data over large spatial extents ought to consider a hardware upgrade.

*Is the \ac{ODC} software conducive to handling relatively simple semantic queries based on semi-concepts?*

Yes. The question is now whether simple semantic queries based on semi-concepts serve the applications they are intended to. See \autoref{ch:proof} for example query outputs.

*Are semi-concepts sufficient for ad-hoc, semi-automated monitoring of vegetation and water dynamics over time?*

Considering they are ad-hoc not definitive, most certainly. However, before being used as the basis for decisions or actions that could have longer reaching consequences than curiosity, the utility, validity or agreement with existing data, limitations and challenges need to be assessed for different applications. See \autoref{sec:map_interpretation}.

*Can information generated from querying vegetation-like or water-like semi-concepts utilising time be used in a meaningful way in the context of existing indicators?*

This is still unclear and requires further research, but the exploratory results are a promising start. See \autoref{sec:potential_sdg}.

*How does this information characterise changes to water and vegetation cover for the temporal extent of the implemented data cube?*

It can characterise longer-term spatial extents (e.g. occurrence over multiple years, seasons, etc.) or shorter term monitoring (e.g. aggregations of a few weeks to changes detected using the newest semantically enriched information layer). Interpreting such output requires existing and perhaps new statistical methods, especially when it comes to characterising the distribution, variation, variability and uncertainty of observations through time, accounting for space. Metrics and methods exist to assess those aspects while accounting for time, but also not necessarily in the context of big data. See \autoref{sec:bigearthdata} and \autoref{sec:map_interpretation}.

*What sort of information is needed to better assess the quality and confidence of aggregated indicator-like results?*

It is clear that having a better understanding of the larger archive data are a part of (i.e. global information), and also the data available for the study area (i.e. local information, if you will), are necessary to inform analysis and interpretation. If a selection of images is chosen, these two collections of information are also incredibly relevant, since the data being used is chosen for a specific set of criteria that could bias or influence analysis in some way. See \autoref{sec:map_interpretation} for some qualified efforts to interpret aggregated, indicator-like output.


## Results

*Can differences in vegetation dynamics in agricultural areas be detected between Syria and Turkey using this implementation?*

This was not a topic not explicitly addressed in this thesis. However, without making a claim as to the cause, a clear difference over an aggregated 3 years of Sentinel-2 data, the border between the two countries is clearly visible and differences in vegetation, most probably irrigated agriculture, are also visible (Figures \ref{3yr_veg_norm_close1} and \ref{3yr_veg_norm_close2}).
