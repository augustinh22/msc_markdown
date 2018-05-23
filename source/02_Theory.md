\cleardoublepage
\pagestyle{scrheadings}
\cleardoublepage
\chapter{Theory}\label{ch:theory}

This section aims to lay the groundwork and context in which the applied example, a semantic data cube implemented for north-western Syria, was conceived, clarifying its intended larger purpose. Various relevant terms are explained, if not defined, and the broader, on-going global initiatives are described, for which this work hopes to be relevant.

# Defining Some Terms

Before digging into anything further, a few terms need to be clarified based on intended use throughout this thesis. Some of these terms are still evolving, so the baseline for their usage here needs to be established, but is not necessarily definitive.

## Open-data
on the other hand, allows the rapid generation of large-scale and small-scale maps that do not include only “static” geophysical parameters (such as terrain height and vegetal cover), but also dynamic ones (such as likely positions of icebergs in the Arctic Ocean) and man-made artefacts.

One existing transferable method for initial, generic semantic enrichment is automatic spectral categorisation of \ac{EO} data (i.e. preliminary classification). This moves away from application-based algorithms (e.g. water classifiers) and sample-based classifiers, which are often not transferable among multiple images at different spatio-temporal locations. Completely automated understanding of remotely sensed images is something for the future, but pre-classification can be understood as a first, fully automated step towards automated land cover classification [@baraldiOperationalAutomaticRemote2012].


## Big Earth Data
This thesis focuses on utilising what is referred to as *big Earth data*. The opening of the Landsat archive to the public in 2008 [@wulderOpeningArchiveHow2012] presented new opportunities for many researchers to access and use Landsat data, stretching back for 35 years, but it also presented many new challenges, which researchers are still grappling with. Remotely-sensed *big Earth data* could continue to be analysed using methods that were applied to remotely-sensed images before Landsat opened its archive in 2008 (i.e. before they became a big data source) but the majority of \ac{EO} data available would never be used.

*Big Earth data* pose different challenges to researchers due to various unique qualities that define their "bigness", which apply to *big data* more generally. These qualities are discussed in literature any number of "V's", depending on the source. Here, we will refer to the 4 V's as **volume, variety, velocity and veracity** (data at scale [TB, PB, etc.], data in many forms [many dimensions], data in motion[streaming], data uncertainty[unstructured, untrusted, uncleaned]).

Much analysis in remote sensing was previously limited to manually selected, hopefully representative images for the purpose of a given study. In terms of detecting changes, bi-temporal change analysis was commonly employed, due to the prohibitive cost of images, and limited technological tools and hardware to handle, store and process large data.

Access to images is no longer a limiting factor, and transferability of existing methods to multiple images at the same place, different seasonal conditions, different geographic locations, etc. has become increasingly important. This was not only for the sake of efficiency, but for reliability and comparability of results.

Developing large-scale, automated (repeatable and reliable) methods for extracting information from huge amounts of \ac{EO} data is not only the current trend, but the only foreseeable way to derive meaning from a rapidly growing, global data source.

*Big Earth data* demand different and new methods to leverage their potential, whether related to storage, access or analysis.

*Soille et al. (2016)*

**Providing tools and applications for:
- managing large EO datasets efficiently and with remote access for data analysis and exploitation, minimizing the transfer from or to remote data centers
- adapt existing spatial and temporal analysis methods, and developing new methods that allow easier sharing, publishing, backup and reproduce big EO data;**


## ARD


### \ac{ToA} vs. \ac{BoA} vs. \ac{SURF} calibration


## \ac{ESA} Level 1C - Level 2A


## Semantic Enrichment


## Data cube


## Reproducibility



# \ac{EO}-based information for indicators

- \ac{EO} data and need for indicators
- Indicators vs. evidence
- Development of spatially-explicit indicators
- spatially-explicit


Indicator development is imperative to leveraging the potential of \ac{EO} data and transforming them into meaningful and actionable information. As big, open and free data sources, such as provided by the Sentinel-2 satellites, are collected over a longer timespan, indicators transferable to multiple data sources will be increasingly useful for interpreting a variety of \ac{EO} data. Indicator extraction is necessary because the reflectance observed by a sensor is only a proxy for detecting, identifying and monitoring objects and processes, since pixels representing similar reflectance values can represent different objects, surfaces, etc. Optical \ac{EO} data does not contain direct measurements of most objects or events on Earth (i.e. mixed pixels or relatively slow events). Non-physical entities (e.g. political boundaries) also cannot be directly measured. Replicable extraction of generic \ac{EO}-based indicators can complement indicators or reports from other in-situ sources as evidence for consilience to support decision-makers. Since free and open \ac{EO} data are independent of political boundaries, if not global in coverage, indicators derived from them will be especially useful in supporting international initiatives in various thematic domains, such as the \ac{UN}' \acp{SDG}.

The challenge with \ac{EO} data is their necessity to be classified or interpreted in order to support meaningful analysis.


- indicator vs. evidence
Information derived from \ac{EO} data are based on images that have been somehow semantically enriched or classified, which, even if automated and validated, always includes subjective decisions. They are categorically different from other statistical measures, such as population counts, disease prevalence rates, \ac{GDP}, etc.  \ac{EO}-based indicators can serve as spatially explicit evidence to support these already identified indicators.


**Relevant here:**
"indicators have the potential to be misleading, if the data, assumptions, or analyses behind them are incorrect. Aggregated data, for example, may mask inequalities within vulnerable groups that, unless disaggregated, will remain hidden to policymakers. In the extreme, this can lead to a phenomenon known as Simpson’s paradox, where a body of data displays a trend, yet when the data are broken into subgroups, the opposite trend is apparent for different subgroups" [@mainiSendaiFrameworkDisaster2017]



# International Initiatives

\ac{EO}-derived information can contribute to many existing global priority initiatives. However, in order to keep the scope manageable, the focus here is looking at ways \ac{EO}-derived information can contribute to the \ac{UN} \acp{SDG} and the Sendai Framework for Disaster Risk and Reduction (Sendai Framework), both of which pertain to goals set in 2015 for 2030.

Goals have been identified in the scope of various global initiatives, with the expressed purpose of improving the lives of people across the world and mitigating potential or inevitable risks and vulnerabilities. Multiple targets have been identified for each of these goals. In this context, indicators exist or are being developed in order to monitor targets and report on progress over time. Many of the developed indicators are based on official statistics on a regional, national or provincial level, but are not spatially explicit. Incorporating information derived from an objective base of constantly collected \ac{EO} data with existing indicators can offer spatially explicit evidence that informs future actions towards identified goals.


## United Nations' Sustainable Development Goals

The \ac{UN} has identified 17 goals with many targets and related indicators for the 2030 Agenda for Sustainable Development. These goals are known as the \acp{SDG} *INSERT FIGURE*, and replace what were the eight \acp{MDG}, presented by the \ac{UN} to be achieved by 2015. The \acp{MDG} were specifically and unfairly geared towards poorer countries, developed primarily by stakeholders from the United States, Europe and Japan, and co-sponsored by financially motivated international stakeholders including the \ac{IMF}, World Bank and \ac{OECD} [@fehlingLimitationsMillenniumDevelopment2013]. In contrast, the currently active \acp{SDG} are more expansive, overarching ideals that all countries ought to make steps towards achieving. In order to support these efforts, targets have been identified for each goal, resulting in a total of 169 targets. Multiple, measurable indicators for monitoring progress towards each target have also been identified.

## Sendai Framework for Disaster Risk and Reduction

The Sendai Framework is framed by one overarching goal and expected outcome, which is refined by seven targets, four priorities for action and many guiding principles.

# Indicators Utilising \ac{EO}-Based Information

- Talk theoretically about what is possible.

## Indicators for International Initiatives

## Livelihood-related Crisis Indicators

- how can livelihood be addressed from an indicator perspective…
- some non-\ac{EO} livelihood security indicators (existing or envisioned in literature)
- existing or envisioned \ac{EO}-based livelihood indicators or sources of evidence

\ac{EO} data is not only useful for monitoring longer-term international goals, but also for generating spatially-explicit evidence for assessing the impact of events producing rapid change, such as flooding, deforestation, wildfires, damage to irrigation infrastructure in the dry season, etc.

Free and open \ac{EO} data are a reliable and objective global data source that can also serve humanitarian organisations and initiatives in moments of emergency or crisis, however defined. A handful of research with the purpose of developing what are known as *crisis indicators* exists, utilising \ac{EO}-based information. The term "crisis" is, however, very loosely defined and quite subjective, since the definition is related to what is being affected and who or what it impacts. Connecting detectible changes in land cover or land use as being caused or related to a defined crisis requires a lot of inference, and various additional data sources for validation, which may not be available at the time of analysis due to limitations and restrictions to data collection, access, etc. associated with the identified crisis.

Livelihood-specific Evidence

1. economic size, growth and distribution (using luminosity)
2. population size, growth and distribution
3. differences in geographic endowments (water, farmland, natural resources, etc.) -- affect on supply of public goods
4. size and growth of cities, their legal and illegal parts, slums, disribution of infrastructure and economic activity, etc.
5. density and quality of road networks
6. size, quality and change of land plots
7. weather, climate, droughts, crop failurse, food shortages, etc. potential disasters
8. infrastructure that could prevent natural disasters
9. forced displacement, razed villages, mass graves
10. humanitarian responses to disasters and conflicts
11. illegal crops (e.g. drugs)
12. reconstruction activity after conflict (e.g. build up of infrastructure)

Land degradation -- Long-term multi-temporal vegetation analyses (large scale analysis using Sentinel-2 data,
Loss of agricultural areas -- Long-term multi-temporal vegetation analyses (Hot spot analysis using Sentinel-2 data
Flood impact -- Long term probability of flooding impact on agriculture areas, accessibility
Power shortage -- Night-time light detection.


- crop cycles (measure periods of seasonal stress -- low harvest)
- contribute spatially explicit information to existing vulnerability/risk/hazard assessment methods


Cropping intensity (FAO)
Amount cultivated land/land ownership (HKI)




# State-of-the-Art


## Automated Semantic Enrichment

- focus on existing algorithms


Initial, generic semantic enrichment, e.g. automatic spectral categorisation (i.e. preliminary classification) into classes equal or inferior to land cover classes

Initial, generic semantic enrichment, e.g. automatic spectral categorisation (i.e. preliminary classification), increases automation of \ac{EO}-based indicator extraction. Applying generic, semantic enrichment moves away from application-based algorithms (e.g. water classifiers) and sample-based classifiers, which are often not transferable among multiple images at different spatio-temporal locations. Complete, automated remotely sensed image understanding is something for the future, Pre-classification can be understood as a first, fully automated step towards image understanding, which is envisioned to include land cover classification [@baraldiOperationalAutomaticRemote2012]. Automatically generated semantic enrichment transforms \ac{EO} images into meaningful information in an automated way.

## Selected existing \ac{EO}-based Indicators

- literature review of existing optical \ac{EO}-based indicators or sources of evidence


### Sentinel-1

### \ac{MODIS}

### Night-time Lights Data

For example, night-time light \ac{EO} data integrated with the \ac{JRC} \ac{GHSL} and disaggregated population data were used to assess the humanitarian impact of the Syrian conflict [@corbaneMonitoringSyrianHumanitarian2016]. Information extracted from big Earth data is a promising source of spatially-explicit evidence.

\ac{GDP} growth has been estimated through measuring light emissions from satellite images.

### Landsat and Sentinel-2

### \ac{VHR} Data



## Relevant data cube implementations

- focus on Landsat and Sentinel-2 use





----------------------------

# Taken from elsewhere...

Topics concern the security of livelihoods in large scale crisis situations and the assessment/or indications of damages based on HR EO-sensors of a high temporal resolution (e.g. Sentinel 2/3). The civil war in Syria, for example, has been raging for several years now. Conflict-induced changes regarding the agricultural production can serve as an indicator to assess the overall situation in the area. During on-going conflicts indicators for large-scale damage assessment such as the damage of infrastructure and buildings, etc. can serve as additional information on severity and the evolution of the conflict. These EO-based indicators are able to improve existing risk assessments by adding a dynamic and regionalized component. Starting from large scale assessment C-CRISIS aims also to cover a range of different sub-themes on the regional and local level, such as the assessment of the environmental impact of refugee/internally displaced person (IDP) camps on the surrounding. The sudden influx of large numbers of IDPs or refugees into a spatially limited area can place severe pressure on the local environment and existing natural resources.

... comprehensive approach: Large-scale, automated (repeatable and reliable) extraction of EO-based indicators/indicator classes, which requires a combination of deductive (rule/expertbased) and inductive methods. Challenges are – beyond the automatization – the large data amounts (improved processing methods), the high repetition rates, different sensor types (radar/optical, HR/MR) and the identification of significant indicators (advanced information extraction).

Processing and classification time series of super-spectral image stacks requires dedicated multi-dimensional methods robust to redundant information. Reduction of dimensionality of the data should be utilized by using indicator-specific vegetation indexes or aggregative statistics computed over temporal stack

Mubareka and Ehrlich (2010) combined Landsat data and field data to derive environmental indicators of conflictinduced changes in land use such as conversion of agricultural land to grassland or harvesting of woodland. They suggest further improving the risk assessment by integrating political and social factors. The capabilities of Landsat to detect burnt villages in Darfur have been shown by Prins (2008). Machado (2015) investigated the potential of Landsat time series analyses in combination with additional data sources to derive geospatial patterns of Syrian refugee flows in south-eastern Turkey. Within the G-SEXTANT project, fully automated analysis of Landsat time series data showed the development of irrigated agricultural areas for northern Syria which was used as an indicator for crisis related changes (Tiede et al. 2014), transferability of the approach to Sentinel-2 and -3 data is envisaged within C-CRISIS, as a fully automated indicator extraction approach.

Machado, Daniel Carlos dos Santos. 2015. "Analyzing Geospatial patterns of syrian refugee flows in southeastern Turkey by use of remote sensing and complementary data".
Mubareka, Sarah, and Daniele Ehrlich. 2010. "Identifying and modelling environmental indicators for assessing population vulnerability to conflict using ground and satellite data." Review of. Ecological indicators 10 (2):493-503.
Prins, E. 2008. "Use of low cost Landsat ETM+ to spot burnt villages in Darfur, Sudan." Review of. International Journal of Remote Sensing 29 (4):1207-14.

Langer et al., 2015, who employ prior-knowledge based classification of multi-temporal Landsat imagery for the long-term characterization of environmental change around a refugee camp over a time span of 21 years, and Hagenlocher et al 2015, who use the same technology to support semi-automated classification of VHR and HR data of refugee/IDP camps.

An application for land cover change using already newest Sentinel-2 data in parameter free and fully automated workflows could be shown by Tiede et al. (2016)

Lower spatial, but higher temporal and spectral resolution and the larger areas covered require a higher degree of automation in information extraction using automated-prior-knowledge based classification procedures ready for Big Earth Data as well as a shift from "direct" information extraction to indicator approaches

Highly automated large-scale indicator extraction from HR/MR Sentinel2/3 data addressing the large amount of data as well as the high temporal resolution. Combination of prior-knowledge based parameter free classification procedures in combination with automatic change detection methods – aiming for fully automated workflows (ready for big data).


With regards to Earth Observation, the “free, full and open data” policy promoted by Copernicus and GEOSS, has enabled the emergence of the “Big Earth Observation Data” era, whereby large volumes of data received each day from different sensors on-board satellites (especially Sentinel and Landsat constellations) can be exploited towards the delivery of timely information in support of decision making and operations for users requiring fast responses. The challenge in the case of this unprecedented opportunity is no longer related to accessing the data but rather to the effective and efficient extraction of the wealth of available information it offers.
- supporting situational awareness for emergency responders and other actors on the ground;
- analysing indirect impacts of global trends such as demographic changes, environmental degradation, climate change, and land issues related to conflicts;
- monitoring the state and vulnerability of natural strategic assets and critical infrastructures as a given crisis develops;


By definition satellite-based Earth Observation provides the most flexible and comprehensive tools to generate such indicators with access to any area of the world.
Moreover, new EO missions (constellation of satellites) and instruments (e.g. imaging radars) are contributing in mitigating the main limitation of remote sensing: the sampling intervals, which are severely limited by both technological and environmental factors (e.g. orbits, cloud coverage).
In such a way EO is now providing stacks of observations, providing persistent monitoring over a region (persistent meant as continuing in time with suitable sampling to detect variability patterns); such datasets represent a big challenge in terms of analysis, demanding for the application of automated analytic technologies to derive meaningful information (Big Space Data).
The Big Earth Observation data revolution started into 2008, when the US Geological Survey (UGS) decided to open the archive of Landsat satellite imagery collected over forty years, after years of changing charging policies, bringing to an exponential growth in data demand and related cartographic services. The Free and Open Data Policy was applied also the by European Flagship Programme Copernicus, that thanks to the Sentinel Missions operated by the European Space Agency and complemented by the so called Third Party missions, provides estimated data volumes of 10 TB per Day [RD7], leading to imminent challenges related to the storing, transferring and extracting valued added information from the available huge amount of data.


Big EO data is a challenge for efficient and intelligent storage, analysis and distribution. While for other big data domains the main challenge is the sheer amount of data, satellite data needs conversion into information to unfold their potential as a source for relevant multi-temporal geoinformation. The free-access policy of the Landsat and Copernicus Sentinel archives, the increased storage capacity and availability of increasing computational power allow large-scale analysis of Earth observation (EO) images especially also in the high-temporal-resolution domain, which is important for monitoring purposes. However, the temporal information is currently not readily exploitable in the EO image databases such as the USGS Earth Explorer or the Sentinels Scientific Data Hub itself. Extracting information from time series is difficult due to the volume, velocity and variety of EO images. For each new image, which is part of the temporal analysis, the volume of the whole stack is increasing linearly. Different sensors, different acquisition times or dates and the variety of characteristics of natural phenomena adds additional complexity. Therefore,the volume and variety require the approaching of efficient analysis of long EO image time series regarding algorithms and data models. The development of new methods, which are going beyond traditional change detection, are on its way: Usually change detection is conducted as a pairwise comparison of EO images (Singh 1989, Petitjean et al. (2012), Guyet and Nicolas (2016)). In contrast, long EO image time series analyses – needed for constant monitoring purposes - aim at classifying and analysing the trajectory of radiation at a location on the Earth (Petitjean et al. 2012). Both have in common that they require significant change of detectable radiance values between images that are due to real and actual changes on the Earth’s surface (Singh 1989). In addition, algorithms for big EO data analysis need near full automation to be applicable and usable on the large amount of data sets. Today techniques, methods, and tools, for automated data analysis are often insufficient for the automated analysis and information extraction from big EO data sources, but interesting approaches to tackle processing and new data storage solutions are proposed. Recent developments are the EarthServer (Baumann et al. 2015) based on a Rasdaman database, the Australian Geoscience Data Cube (Purss et al. 2015), which is currently implemented in a high performance computing (HPC) environment (Evans et al. 2015) or EarthDB (Planthaber, Stonebraker, and Frew 2012) based on a SciDB database (Stonebraker et al. 2013). A combination of fully automatic semantic enrichment of EO data and time series analysis in 3D data cubes are presented by Tiede et al. (2016). [RD8-16]. Regarding the EO analysis and processing techniques, it can be difficult to extract useful information in case of phenomena that are not really predictable in terms of “what” to search. Anyway, the paradigm of object-based image analysis (OBIA) extends the traditional per-pixel based image classification approaches that rely only on the spectral information per single pixel. OBIA enables the incorporation of geometry and expert knowledge on top of traditional spectral values and this allow to improve for example classification by using existing knowledge available for example as OSINT. One main point is the aspect that current high-resolution sensors “significantly increase the within-class spectral variability and, therefore, decrease the potential accuracy of a purely pixel-based approach to classification” (Blaschke et al., 2014, RD44). This point is even more valid for the task of analyzing large amounts of remotely sensed data incorporating information from a variety of other sources into the analysis which is the case of the study of migration where EO is not the only source of information. This issues can be mitigated by considering time-series as the starting point. In fact, time-series analysis and especially the detection of changes can be very useful as a source of information to be used in spatial analysis models used to detects possible hot spots from EO data especially from SAR time series and VHR time series. Some examples are shown later using SAR EO data but the same approach is applicable to VHR data and HR. In the case of VHR optical imagery, time-series analysis can be combined with deep learning (and in general machine learning and computer vision techniques). Similar to the way our brains learn to recognize faces, deep learning algorithms learn to recognize patterns, such as road-building in previously untouched areas or such as modification from forested areas to crops areas. Many researchers use these findings to monitor forests and agriculture. The potential for such a capability is tremendous. For example, in case of migration, food security and in general food production estimation can be really useful for the anticipation of migration flows variation. Also HR multi-spectral imagery, particular indexes such as NDVI can be monitored over long time-series (using historical data) in various ways in order to assess food security at scales which can be useful to analyze local or small scale migration phenomena. This information can be added to common large scale reports provided normally by organisations like FAO (e.g. http://www.fao.org/hunger/en/).
Detection of changes occurred in the observed scene is one of the most important information that can be extracted from a SAR data series (at least two).
Change detection from SAR images is particular effective if interferometric data are considered, i.e. acquired with the same geometry. It is proved that the exploitation of the statistical model underlying the SAR amplitude signals by maximum likelihood approaches allows to characterize sharp time variation of the backscattering (step patterns) as well as other types of changes.
In the following figure, an example of fully automatic data fusion (multi sensor segmentation) and change detection performed using 16 SAR data and one VHR optical image of the same scene is shown. The optical data is exploited in a pre-processing data fusion jointly with the SAR data stack to achieve a base segmentation map for the following change detection processing.
Change detection maps of an area of interest can be used to trigger further, more in-depth analysis. A first screening of potential anomalous changes is needed to focus more expensive and time-consuming actions, e.g. analysis with restricted-access data and in-situ monitoring. Based on optical data series, change detection in the scene can be still semi-automatically performed. In this case, robust approaches are needed for the modelling of the disturbance affecting the radiances/reflectances between different acquisition times due to calibration, residual solar contributions, surfaces not fully Lambertian, and geolocation or coregistration errors. Many of these disturbance can be overpassed by considering the new Sentinel-2 mission which guarantees the acquisition over a scene with similar illumination conditions and geometrical line lie of sight.
One critical issue in the optical data series processing is that preliminary cloud masking is required and also an accurate detection of haze conditions. In particular clouds make the optical data useless, while areas in the image affected by haze should be radiometrically corrected in order to avoid discarding of information. The Optical change detection is usually less automatable with respect to the SAR CD.

The following example shows a fully automatic change analysis between August 2010 and 2014 in the north-western part of the Syrian-Turkish border region, focusing on irrigated agricultural areas. The information was part of a preliminary impact assessment to analyse and monitor the consequences of the Syrian conflict and is used to estimate post-conflict needs in support of reconstruction and rehabilitation.


improve situational awareness as well as regular, temporal monitoring and identification of changes.
Data with lower spatial resolutions can be exploited by moving away from "direct" information extraction towards indicator-based approaches.

Sentinel’s multi-spectral satellites, 2A and 2B, run as part of the Copernicus programme (formerly known as \ac{GMES}) led by the \ac{EU}, together at full operational capacity have a revisit time of 5 days over equatorial areas and a relatively high spatial resolution (10-60m) with 13 spectral bands. Offering data already calibrated to \ac{ToA} reflectance, with a collective total of around one \ac{TB} of data daily, the Sentinel-2 satellites are predominantly used to monitor water cover, vegetation, coastal areas, soils, natural disasters and other features of interest for land services. Landsat 5/7/8 are other multi-spectral instruments with relatively lower spatial resolutions, less frequent re-visit times and without pre-processed \ac{ToA} reflectance, that can be exploited in similar ways, especially where historical data are relevant for comparison.

The \ac{JPSS} from \ac{NASA} and the \ac{NOAA}. The \ac{JPSS} includes the \ac{VIIRS}, meant to replace the \ac{MODIS} and \ac{AVHRR} sensors for tasks such as night-time light analysis, active fire detection and climate change monitoring. These data are accessible to the general public, often via online archives (e.g. Sentinels Scientific Data Hub, \ac{USGS} Landsat archive).

Global \acp{NTL} data show the locations and brightness of light escaping into space. Most of these lights are electric and originate from human settlements, making \ac{NTL} a useful data source for bridging social science and remote sensing. Since 2011, \ac{NTL} data are being captured by the \ac{VIIRS} \ac{DNB}. \ac{NTL} data has been used as an indicator for various socio-economic factors, but also for applications directly relevant to migration, such as estimating the number of affected or displaced people in the case of a crisis [@corbaneMonitoringSyrianHumanitarian2016] or early damaged area estimation (Kohiyama et al. 2004). Pre-processing requires removal of background noise and solar or lunar light contamination, cloud cover screening and exclusion of non-electric light sources (e.g. volcanoes, fires) (Elvidge et al. 2017). For 40 years, data was collected using the \acp{DMSP} \ac{OLS}. Methods exist for inter-calibrating \ac{DMSP} with \ac{VIIRS} data in order to gain longer time-series of images for detecting changes before \ac{VIIRS} became operational in late 2011. Liet al. (2017) inter-calibrated \ac{DMSP}/\ac{OLS} and \ac{VIIRS} night-time light images in order to retrospectively analyse changes that occurred to human settlement areas during the course of the Syrian civil war. Corbane et al. (2016) developed a methodology to estimate the number of people affected during a crisis utilising \ac{NTL} data combined with the \ac{JRC}'s \ac{GHSL}. Syria was the use-case and they demonstrated that a satellite-derived indicator from \ac{NTL} data can potentially offer a relatively objective estimate of the number of people impacted by a humanitarian crisis in a timely manner. The establishment and growth of refugee or \ac{IDP} camps may also be able to be detected based on \ac{NTL} data. Most \ac{NTL} studies up to now have been based on a few dates or annual image composites. Further research in this field would include focusing more on temporal dynamics in \ac{NTL}, taking seasonal or hourly changes into consideration to better inform interpretations of results.

Conventional remotely sensed data (i.e. optical) are limited in the sense that they can only detect features that are visible (e.g. built structures, vegetation, agricultural fields, roads). These data sources can be utilised to monitor security of livelihood assets (e.g. food or water security), land conflicts, post-crisis structural damage assessment, climate change effects that could cause population pressures, and more, depending on their spatial resolution and temporal characteristics.

Free and open high resolution optical imagery (e.g. Sentinel-2, Landsat 5/7/8) lends itself well to information extraction for indicators due to the fact that pixels are mixed. One applied example comes from Tiede et al. (2014) in the scope of the \ac{EC}'s \ac{FP7} project \ac{G-SEXTANT}. They demonstrated an automatic post-classification land cover change detection method based on Landsat imagery, focusing on changes in agricultural areas in at the Syrian-Turkish border as a potential indicator for livelihood security and ultimately regional stability in areas where the regional climate mandates irrigation to support crops. Further exploration into indicators for crisis, whether natural disasters or man-made conflicts, is an expanding field of research, including the development of automated methods for pro-longed monitoring of areas. Indicators based on high resolution data have been envisioned for detecting or monitoring burnt villages; informal urban growth; the development or growth of refugee or \ac{IDP} camps (Wang et al. 2015) and their impact on the surrounding environment; changes in activity (e.g. new infrastructures such as roads or air fields); illicit crop establishment and growth (e.g. opium cultivation in Afghanistan); environment degradation; flood assessment or visible changes to water bodies; changes or loss of agricultural areas; deforestation or reforestation; and visible climate change or extreme weather event artefacts.

The ultimate aim of any data management system is to facilitate technical access and handling of data as rapidly as possible. Handling in this case refers also to typical and well-known database use-cases, which are including, but not limited to, projection (sub setting), selection (filtering) or joining (combining) of data. Typical applications of big \ac{EO} images do not require processing all available images in an archive, but is usually selective regarding the area-of-interest, the time interval, quality levels (e.g. cloud cover) of the images but also their content itself (e.g. based on the legend of a scene classification map, i.e. water, vegetation, fire). The selection (filtering) might precede further operations, e.g. finding vegetation peaks over multiple years (a combination of projection and joining). Current \ac{EO} image archives such as the \ac{ESA} Scientific Data Hub or the \ac{USGS} Earth Explorer do not provide these operators. Moreover, typical purely files-in-directories-based approaches are limited to fulfil the requirements for implementing all of these operators to reach the aforementioned aim. Typically, the files are referenced by their filenames only or by using a hierarchical folder-based system. These storage systems are reading the files sequentially and are therefore not suitable for managing, including processing, large amount of data.

Current big \ac{EO} image processing paradigms require systems “to bring the users to the data and not the data to the users” and allow “any query, any time”. These paradigms are putting heavy requirements on software and hardware, especially in petabyte-scaled applications with data-intensive operations, which will be common in a few years. Therefore, data- and infrastructure providers are seeking the solution in cloud-based systems, where currently different approaches are existing side-by-side and are outperforming traditional methods. Arguably, the current prevalent big \ac{EO} data handling approach is to use a map-reduce-approach (a prominent example is the Google Earth Engine, or Apache Hadoop as software package), or a database-approach, where native array databases are utilised (example technologies (in the sense of “tools”) are Rasdaman and SciDB). Some approaches, such as the \ac{AGDC}, are combining both approaches, mainly by implementing and retrofitting database properties (user management, indexing, etc.).

Array-database-based approaches usually come with properties, which are well-known from relational databases and can be exploited for handling large amount of \ac{EO} images as well. Core features of database systems are the centralised data management, improved data security, multi-user support, transparent query processing and the use of a declarative query language like \ac{SQL}. Array databases have been applied for handling big Earth data in recent years [Planthaber et al. 2012]. Examples are the EarthServer [Baumann et al. 2016], based on the Rasdaman database, and EarthDB which is based on the SciDB database.

Most of the currently available technology implement the so-called datacube. For example, an array database might instantiate \ac{OGC}-compliant datacubes, where the semantics of the axes are defined using \acp{CRS}, e.g., spatial coordinate reference systems, known by the harmonisation efforts by the \ac{EPSG}. For example, in a three-dimensional datacube, a one-dimensional time \ac{CRS} overlays the two-dimensional \ac{CRS}. In total six characteristics have been identified in the publicly available datacube manifesto (<https://groups.google.com/forum/#!topic/rasdaman-users/Q3Zg7Tbc1_8>).  

Besides the technology-driven strategies for performing searching and processing on the database level, user-driven requirements are leading to on-demand web-based online processing of big \ac{EO} data. In the last years, several technologies and standards, which can be used for online processing of \ac{EO} data, have been developed and made available to the community [Petcu et al. 2010]. Two \ac{OGC} standards are the \ac{WCPS} and the \ac{WPS}, while technology implementations are Google Earth Engine [Google Earth Engine Team2015] or the Jupyter notebooks. Other examples of web-based platforms, which have been explicitly designed for processing and analysing \ac{EO} data, include the Amazon Cloud \ac{AWS} for processing of Landsat-8 data, with a free access to the \ac{API} [Amazon 2016]. The \ac{AGDC} is using the \ac{NCI} to provide Landsat images in the petabyte scale together with processing capabilities over the internet [Evans et al. 2015]. The \ac{EODC}, a collaboration between the technical university of Vienna, the \ac{ZAMG} and other companies, pursues a similar approach [Wagner et al. 2014]. Big Earth Data is characterised by the (at least three) “V’s”: Volume, Velocity, Variety, where sometimes Veracity is added as fourth “V”. Taking into account these characteristics, compared to traditional \ac{EO} image processing pipelines, Big Earth Data-“ready” systems have to consider some additional constraints, which are imposed by the “any query, any time” requirement. The exploitation of the value of Big Earth Data involves automation, pre-processing, on-demand querying and compelling visualisation of the results. Massive processing power in the cloud and fast network connection is required, but not sufficient. Automation of intelligent workflows leading to pre-processing of data are important drivers for on-demand and ad-hoc querying to extract information in real time. Semantically enriched data allow also unexperienced users to formulate queries by means a high-level declarative language. Instead of having to translate an algorithm into software code manually, the query will be evaluated by the system and transformed into optimised physical access patterns. This approach can be realised by automatic (application independent) semantic enrichment of \ac{EO} images in Big \ac{EO} image databases, which are therefore “prepared” and “ready” for application specific queries in distributed array databases (with a declarative query language and a query optimiser). This approach avoids redundancy in data handling and repeated data (pre-) processing. The feasibility of this approach has been proven by Tiede et. al. [2016].

(IQ image stack) \ac{EO} image data are semantically enriched and stored as information layers in datacubes. In combination with declarative querying in array databases, ad hoc information extraction is possible by means of semantic querying


### Global night-time lights monitoring]()

Global night-time lights (NTL) data show the locations and brightness of light escaping into space. Most of these lights are electric and originate from human settlements, making NTL a useful data source for bridging social science and remote sensing. Since 2011, NTL data are being captured by the Visible Infrared Imaging Radiometer Suite (VIIRS) Day/Night Band (DNB). NTL data has been used as an indicator for various socio-economic factors, but also for applications directly relevant to migration, such as estimating the number of affected or displaced people in the case of a crisis  (Corbane, Kemper, Freire, Louvrier, & Pesaresi, 2016) or early damaged area estimation  (Kohiyama, et al.,2004). Pre-processing requires removal of background noise and solar or lunar light contamination, cloud cover screening and exclusion of non-electric light sources (e.g. volcanoes, fires)  (Elvidge, Baugh, Zhizhin, Hsu, & Ghosh, 2017). For 40 years, data was collected using the Defence Meteorological Satellite Program (DMSP) Operational Line Scan System (OLS).Methods exist for inter-calibrating DMSP with VIIRS data in order to gain longer time-series of images for detecting changes before VIIRS became operational in late 2011. Li et al. (2017) inter-calibrated DMSP/OLS and VIIRS night-time light images in order to retrospectively analyse changes that occurred to human settlement areas during the course of the Syrian civil war.  (Corbane, Kemper, Freire, Louvrier, & Pesaresi, 2016)developed a methodology to estimate the number of people affected during a crisis utilising NTL data combined with the Joint Research Centre’s (JRC)Global Human Settlement Layer (GHSL). Syria was the use-case and they demonstrated that a satellite-derived indicator from NTL data can potentially offer a relatively objective estimate of the number of people impacted by a humanitarian crisis in a timely manner. The establishment and growth of refugee or IDP camps may also be able to be detected based on NTL data. Most NTL studies up to now have been based on a few dates or annual image composites. Further research in this field would include focusing more on temporal dynamics in NTL, taking seasonal or hourly changes into consideration to better inform interpretations of results.

### HR/VHR EO sources

Conventional remotely sensed data (i.e. optical) are limited in the sense that they can only detect features that are visible (e.g. built structures, vegetation, agricultural fields, roads). These data sources can be utilised to monitor security of livelihood assets (e.g. food or water security), land conflicts, post-crisis structural damage assessment, climate change effects that could cause population pressures, and more, depending on their spatial resolution and temporal characteristics.

Free and open high resolution optical imagery (e.g. Sentinel-2, Landsat 5/7/8) lends itself well to information extraction for indicators due to the fact that pixels are mixed. One applied example comes from (Tiede, Luethje, and Baraldi, 2014) in the scope of the EC-FP7 project G-SEXTANT (Geospatial services in support of EU external action). They demonstrated an automatic post-classification land cover change detection method based on Landsat imagery, focusing on changes in agricultural areas in at the Syrian-Turkish border as a potential indicator for livelihood security and ultimately regional stability in areas where the regional climate mandates irrigation to support crops. Further exploration into indicators for crisis, whether natural disasters or man-made conflicts, is an expanding field of research, including the development of automated methods for pro-longed monitoring of areas. Indicators based on high resolution data have been envisioned for detecting or monitoring: burnt villages; informal urban growth; the development or growth of refugee or IDP camps  (Wang, So, & Smith, 2015) and their impact on the surrounding environment; changes in activity (e.g. new infrastructures such as roads or airfields); illicit crop establishment and growth (e.g. opium cultivation in Afghanistan); environment degradation; flood assessment or visible changes to water bodies; changes or loss of agricultural areas; deforestation or reforestation; and visible climate change or extreme weather event artefacts.

VHR data can be used to monitor and map changes, including: IDP, temporary and refugee settlements (Laneve, Santilli, & Lingenfelder, 2006); damaged or burnt urban or village structures; characterizing slums; border surveillance; and more detailed analysis of any land cover change. One critical issue in the optical data series processing is that preliminary cloud masking is required and also an accurate detection of haze conditions. In particular clouds make the optical data useless, while areas in the image affected by haze should be radiometrically corrected in order to avoid discarding of information. Change detection using optical data is usually a bigger challenge with respect to the SAR CD, depending on the information depth to be analysed.

The years have also seen the birth of constellation with tens of micro EO satellites able to capture images of the Earth at an unprecedented pace. One image per day and maybe more is no more a chimera like it was in the early 2000 years. Constellation like Planet and Terra Bella/SkyBox (now merged Planetto Acquire Terra Bella from Google, Sign Multi-Year Data Contract, <https://www.planet.com/pulse/planet-to-acquire-terra-bella-from-google/>)offers HR and VHR data commonly with a business model based on subscription which is exactly focused on monitoring purposes. As shown before in (Adam Van Etter, 2016), there are several efforts in order to exploit data coming from traditional VHR missions like DigitalGlobe ones and new space missions like Planet in order to extract automatically objects.
