\cleardoublepage
\pagestyle{scrheadings}
\cleardoublepage
\chapter{Theory}\label{ch:theory}

This section aims to lay the groundwork and context in which the applied example, a semantic data cube implemented for north-western Syria, was conceived, clarifying its intended purpose. Various relevant terms are explained, if not defined, and broader, on-going global initiatives are described, for which this work hopes to be relevant.

# Framing Terms

Before digging into anything further, a few terms and concepts need to be clarified based on intended use throughout this thesis. Some of these terms are still evolving, so the baseline for their usage here needs to be established, but is not necessarily definitive.

## Open Data

The \acf{OKF} defines knowledge as being *open* when anyone is able to freely access, use, modify, and share it [@openknowledgefoundationOpenDefinitionOpen; @molloyOpenKnowledgeFoundation2011]. This definition of openness is also applied to data, as long as they have an open license, are provided in a machine-readable way including necessary metadata, are user-friendly and provided in an open format. Simply publishing data on the Web and making them available at no financial cost is not sufficient for them to be considered open.

"Open data" as a term does not merely refer to data that are free for anyone to access, use, modify and share, but also encompasses a philosophy for predominantly public organisations in our increasingly knowledge- and service-based global economy [@hossainStateoftheartOpenData2016]. Data that are produced by publicly funded institutions or initiatives ought to be made available at no additional cost to facilitate greater returns from what is a public investment [@janssenBenefitsAdoptionBarriers2012]. This, however, only applies to data that cannot be traced back to specific individuals. Opening data to the public can increase accountability, reproducibility and transparency of the research and decisions made based on them and foster innovation in domains where a lack of data was previously a limiting factor. This assumes that the data are, however, actively being used towards increasing these factors.

There is no intrinsic value in open data, rather the value of open data is created by using them [@janssenBenefitsAdoptionBarriers2012]. Public institutions create and collect a lot of data. Opening data sources to the public that are not linked to individuals has the potential to increase benefits for society, the economy and environment. For example, \ac{EO} images from the publicly funded Landsat mission have no intrinsic value, but a drastic increase in their use is precisely what happened when the archive was opened, leading to much research, information extraction, innovation and applications relevant to many domains [@wulderOpeningArchiveHow2012].

The Copernicus programme offers a plethora of free, full and open data, but the openness of these data can be challenged if they are not being used, which is why the \ac{EC} has established many programs to utilise the data and encourage user uptake. Efforts include the development of operational services for monitoring the atmosphere (\acs{CAMS}), marine environment (\acs{CMEMS}), land (\acs{CLMS}), climate change (\acs{C3S}), emergency management (\acs{EMS}) and security, as well as programmes geared towards users and scalable computing environments, such as \ac{RUS} and \ac{DIAS}. The more that Copernicus' open data is not only being downloaded, but used, the higher the value and greater the benefit.


## Big Earth Data

Big data that stems from or deals with Earth sciences is considered big Earth data. [@guoBigDataDrives2017]

- define big data in terms of V's [@laney3DDataManagement2001] [@gandomiHypeBigData2015]
- make it clear it is not only \ac{EO} data



As of 7 November 2017, there are an estimated 1,738 active, operating satellites are in orbit with around 25% dedicated to Earth observation, regardless if government, military, commercial or civilian [@UCSSatelliteDatabase2017]. Up until now, the majority of \ac{EO} satellites have been operated by national governments, but the expected future trend is an increase in civilian and commercial satellites [@mccabeFutureEarthObservation2017]. The Landsat-1 mission, launched in 1972, carried the first digital multi-spectral sensors intended for civilian use.

The opening of the Landsat archive and all new data to the public in 2008 under a free and open data policy [@wulderOpeningArchiveHow2012] presented new opportunities for many researchers to access and use Landsat data, stretching back until 1972. The \acp{EC} Copernicus programme is now providing \ac{EO} data comprised of multiple Sentinel satellite missions and in situ observations with global coverage at unprecedented frequency and spatial resolution for being free, full and open. There has never been so much \ac{EO} data freely and openly available to the public. Daily data volumes from the Sentinel missions alone are expected to exceed 10\ac{TB} (Fig. \ref{fig:dataestimates}).

![Estimates of annual data volumes from open and free data from Landsat, \ac{MODIS} (Terra and Aqua units) and the first three Sentinel missions [@soilleVersatileDataintensiveComputing2018] \label{fig:dataestimates}](source/figures/soille_data_estimates_2018.jpg)

- link to \ac{EO} and some specific challenges

"the challenges of big earth data" @boultonChallengesBigData2018


- require algorithms that can handle big data/many images, multiple sensors, many geographical areas with heterogeneous levels of fitness / conditions

More generally, big data pose different challenges to researchers due to various unique qualities that define their "bigness". These qualities are discussed in literature often using any number of "V's", depending on the source. Here, big data will be defined by referring to the following 4 V's as *volume, variety, velocity and veracity* (data at scale [TB, PB, etc.], data in many forms [many dimensions], data in motion[streaming], data uncertainty[unstructured, untrusted, uncleaned]).

Expected data *volumes* from the Sentinel missions alone are estimated to exceed 10 TB daily at full operational capacity, a relatively high *velocity* due to global coverage on average every six, five and two days at the equator for Sentinel-1, -2 and -3 respectively, and quite a data *variety* due to multiple sensors, both optical and radar, having various spatial, spectral and temporal resolutions [@soilleVersatileDataintensiveComputing2018]

Developing large-scale, automated (repeatable and reliable) methods for extracting information from huge amounts of \ac{EO} data is not only the current trend, but the only foreseeable way to derive meaning from a rapidly growing, global data source.

Information extracted from big Earth data is a promising source of spatially-explicit evidence.

They are the only source of data that can continuously provide consistent information about the current and past state of the Earth's surface. That means global coverage that is, theoretically, the same everywhere.


Remotely-sensed big Earth data could continue to be analysed using methods that were applied to remotely-sensed images before Landsat opened its archive in 2008 (i.e. before they became a big open data source) but the majority of \ac{EO} data available would never be used.

- current inferential statistical models were conceived as tools to infer from sample data -- big data is different [@gandomiHypeBigData2015]
- [@gandomiHypeBigData2015] discuss text, audio, video and social media data, yet ignore images as part of their exploration of big data

images are considered unstructured data, since they generally lack necessary structural organisation for machine-readability and automated analysis.


Providing tools and applications for:
- managing large EO datasets efficiently and with remote access for data analysis and exploitation, minimizing the transfer from or to remote data centers
- adapt existing spatial and temporal analysis methods, and developing new methods that allow easier sharing, publishing, backup and reproduce big EO data;

*Big Earth data* demand different and new methods to leverage their potential, whether related to storage, access or analysis. This means moving beyond file-based analysis, where each analyst must download each scene one by one. This means that larger-scale analysis, whether larger in spatial coverage, over many observations in time, or both, require many (i.e. hundreds to thousands) of individual scene downloads.

on the other hand, allows the rapid generation of large-scale and small-scale maps that do not include only “static” geophysical parameters (such as terrain height and vegetal cover), but also dynamic ones (such as likely positions of icebergs in the Arctic Ocean) and man-made artefacts.


## Analysis Ready Data \label{sec:ARD}

-- lack of definition -- can include calibration, semantic enrichment, etc...

- connection to open data

https://medium.com/planet-stories/analysis-ready-data-defined-5694f6f48815

https://medium.com/planet-stories/towards-on-demand-analysis-ready-data-f94d6eb226fc



Initiatives currently promoting data cube infrastructures (***see*** section \ref{sec:datacube}) and analysis-ready data are driven by the concept of open data. Most of them aim to offer tools, services and pre-processed data that hope to close the gaps between data availability, access and use. On example is

examples of in the \ac{EO} domain -- Landsat ARD for the USA

### \ac{ToA} vs. \ac{BoA} vs. \ac{SURF} calibration

-- importance for analysis -- comparability


## European Space Agency Level 1C - Level 2A

While still considered open, it is important to note that the pre-processing algorithms applied to the \ac{EO} data provided by the Copernicus programme are not open, but proprietary. -- implications for transparency, re-processing, reproducibility...

At the time of writing, ESA intends to start offering world-wide Level-2A products. Can these be included in a similar implementation?

## Semantic Enrichment

What does this term mean?


## Data Cube \label{sec:datacube}

-- manifesto -- what is the difference between a database and a data cube?
-- standards

@baumannDatacubeManifesto2017


## Reproducibility

Reproducibility is one of the fundamental meta-concepts in science, the basis of the "scientific method". It is not just about reproducing an experiment or a result, but also increasing the transparency of the process leading to its outcome. Scientific reproducibility in \ac{EO} data analytics has not been comprehensively studied.

Across various scientific disciplines and in everyday language, there has long been confusion about what reproducibility means as well as varying definitions. @plesserReproducibilityVsReplicability2018 and @nustReproducibleResearchGIScience recently compared a few definitions from different domains. In the context of \ac{EO} data analytics, the following terms are understood in the context of this thesis:

\spacedlowsmallcaps{replicability}: ability for a *different team* to obtain the *same results* through an array of *different methods* using *independently collected data*

\spacedlowsmallcaps{reproducibility}: ability for a *different team* to obtain the *same results* through the *same methods* using the *same data*

\spacedlowsmallcaps{repeatability}: ability for the *same team* to obtain the *same results* through the *same methods* using the *same data*

\spacedlowsmallcaps{transferability}: ability for *any team* to obtain *comparable results* through the *same methods* using *different data*

@goodmanWhatDoesResearch2016 clarified reproducibility by breaking down different aspects within research. Space and time are fundamental to \ac{EO}, since every spatio-temporal location of an observation is unique and cannot be repeated. This differs from some other scientific disciplines, where data to test a hypothesis can generally be assumed to be independently collected at any time or place given the necessary materials and knowledge (e.g. testing the law of gravity). Listed below is how specific kinds of reproducibility in \ac{EO} data analytics based on @goodmanWhatDoesResearch2016 are understood in this work, recognising that independent \ac{EO} data collection to test hypotheses is often not possible (e.g. historical land cover change detection), depending on the spatio-temporal location, scale and context of the events, processes, states, objects, etc. in question:

\spacedlowsmallcaps{methods reproducibility}: ability to exactly repeat the *same methods* by providing sufficient detail about procedures and data

\spacedlowsmallcaps{results reproducibility}: ability to obtain the *same results* through the *same methods* using the *same data*

\spacedlowsmallcaps{inferential reproducibility}: ability to draw qualitatively *similar conclusions* from results obtained by using *different methods*, *different or independently collected data* or by reproducing the original study


# International Initiatives

Goals have been identified in the scope of various global initiatives, with the expressed purpose of improving the lives of people across the world and mitigating potential or inevitable risks and vulnerabilities. Multiple targets have been identified for each of these goals. In this context, indicators exist or are being developed in order to monitor targets and report on progress over time. Many of the developed indicators are based on official statistics on a regional, national or provincial level, but are not necessarily spatially explicit. Incorporating information derived from an objective base of constantly collected \ac{EO} data with existing indicators can offer spatially explicit evidence that informs future actions towards identified goals.


## United Nations' Sustainable Development Goals

The \ac{UN}'s 193 Member States have identified and agreed to work towards 17 interconnected goals with many targets and related indicators for the 2030 Agenda for Sustainable Development [@Resolution70Transforming2015]. These goals are known as the \acp{SDG} (Fig. \ref{fig:SDGs}), and replace what were the eight \acp{MDG}, presented by the \ac{UN} to be achieved by 2015.

![United Nations Sustainable Development Goals (Source: <https://www.un.org/sustainabledevelopment/news/communications-material/>) \label{fig:SDGs}](source/figures/E_2018_SDG_Poster_without_UN_emblem_Letter US.png)

The \acp{SDG} are different from the \acp{MDG} not only in their content, but also in how they were conceived and to whom they apply. The \acp{MDG} were specifically and unfairly geared towards poorer countries, developed primarily by stakeholders from the United States, Europe and Japan, and co-sponsored by financially motivated international stakeholders including the \ac{IMF}, World Bank and \ac{OECD} [@fehlingLimitationsMillenniumDevelopment2013]. A distinction between "developed" and "developing" countries was made in the creation and implementation of the \acp{MDG} framework. In contrast, the currently active \acp{SDG} are more expansive, overarching ideals that all countries ought to make steps towards achieving. These goals are interrelated, including mitigating climate change, reducing poverty and hunger, improving gender equality and education.

In order to support these efforts, targets have been identified for each goal, resulting in a total of 169 targets [@Resolution713132017]. Multiple, measurable indicators for monitoring progress towards each target have also been identified.



## Sendai Framework for Disaster Risk and Reduction


The \ac{DRR} is framed by one overarching goal and expected outcome, which is refined by seven targets, four priorities for action and many guiding principles.

[@Resolution692832015]
[@mainiSendaiFrameworkDisaster2017]



# Earth-Observation-based Information for Indicators

- \ac{EO} data and need for indicators
- Indicators vs. evidence
- Development of spatially-explicit indicators
- spatially-explicit

\ac{EO}-derived information can contribute to many existing global priority initiatives. Utilising information based on free and open \ac{EO} data can reduce costs for monitoring some of an initiatives goals and offer dynamic, regionalised information that can be generated more frequently than traditional statistical survey methods. This is true assuming the \ac{EO} data have sufficient quality, are suitable for the intended purpose and given automated information extraction methods. In order to keep the scope manageable, the focus here is looking at ways \ac{EO}-derived information can contribute to the \ac{UN} \acp{SDG} and the \ac{DRR}, both of which pertain to goals set in 2015 for 2030.


Indicator development is imperative to leveraging the potential of \ac{EO} data and transforming them into meaningful and actionable information. As big, open and free data sources, such as provided by the Sentinel-2 satellites, are collected over a longer timespan, indicators transferable to multiple data sources will be increasingly useful for interpreting a variety of \ac{EO} data. Indicator extraction is necessary because the reflectance observed by a sensor is only a proxy for detecting, identifying and monitoring objects and processes, since pixels representing similar reflectance values can represent different objects, surfaces, etc. Optical \ac{EO} data does not contain direct measurements of most objects or events on Earth (i.e. mixed pixels or relatively slow events). Non-physical entities (e.g. political boundaries) also cannot be directly measured. Replicable extraction of generic \ac{EO}-based indicators can complement indicators or reports from other in-situ sources as evidence for consilience to support decision-makers. Since free and open \ac{EO} data are independent of political boundaries, if not global in coverage, indicators derived from them will be especially useful in supporting international initiatives in various thematic domains, such as the \ac{UN}' \acp{SDG}.

The challenge with \ac{EO} data is their necessity to be classified or interpreted in order to support meaningful analysis.

"complexity, increasing volume, lack of efficient processing capabilities"

A first step is often to reduce the dimensionality of the data in a meaningful way, this can be done by employing various classification techniques, calculating indexes (e.g. greenness index, \ac{NDVI}, \ac{NDWI}, \ac{NDSI}, \ac{NDBI}}), or computing aggregative statistics over the temporal stack.



Much analysis in remote sensing was previously limited to manually selected, hopefully representative images for the purpose of a given study. In terms of detecting changes, bi-temporal change analysis was commonly employed, due to the prohibitive cost of images, and limited technological tools and hardware to handle, store and process large data.

Access to images is no longer a limiting factor, and transferability of existing methods to multiple images at the same place, different seasonal conditions, different geographic locations, etc. has become increasingly important. This was not only for the sake of efficiency, but for reliability and comparability of results.

- indicator vs. evidence
Information derived from \ac{EO} data are based on images that have been somehow semantically enriched or classified, which, even if automated and validated, always includes subjective decisions. They are categorically different from other statistical measures, such as population counts, disease prevalence rates, \ac{GDP}, etc.  \ac{EO}-based indicators can serve as spatially explicit evidence to support these already identified indicators.


[@hakSustainableDevelopmentGoals2016] -- a need for relevant indicators

**Relevant here:**
*"indicators have the potential to be misleading, if the data, assumptions, or analyses behind them are incorrect. Aggregated data, for example, may mask inequalities within vulnerable groups that, unless disaggregated, will remain hidden to policymakers. In the extreme, this can lead to a phenomenon known as Simpson’s paradox, where a body of data displays a trend, yet when the data are broken into subgroups, the opposite trend is apparent for different subgroups"* [@mainiSendaiFrameworkDisaster2017]

- Talk theoretically about what is possible.

development of automated methods for pro-longed monitoring of areas

The cause of visible changes in agricultural production cannot be derived from images, but paired with additional information about the area, can serve as a spatially-explicit indicator to assess the overall situation in a given area. For example, a reduction in agricultural production could be determined by comparing data from various years about the area, and could assess the potential effects of a known factor, such as an ongoing drought, damage to irrigation infrastructure, a seed shortage or re-location of people due to a conflict.

\ac{EO}-based information can add a dynamic and regionalised component to improve existing risk assessments.

improve accountability

analyse and model conditions

create maps and other visualisations

evaluate impacts across sectors and regions, independent of existing borders

monitor change over time in a consistent and standardised manner

contribute towards achieving the \acp{SDG} by offering information for nations, organisations and other stakeholders to plan, monitor identified targets, track progress towards their achievement

- image from UN group looking at EO-based indicators for sustainable development


## Indicators for International Initiatives

- identify which existing indicators from the two initiatives could benefit from \ac{EO}-based Information

suggest any additional indicators that may be relevant for specific targets, or goals

- EO4SD \ac{ESA} initiative furthering the use of \ac{EO}-derived information in support of sustainable development

@un-habitatSDGGoal112017


- use this to lead into a concept of more time-sensitive analysis than monitoring long-term goals

## Livelihood-related Crisis Indicators

- how can livelihood be addressed from an indicator perspective…
- some non-\ac{EO} livelihood security indicators (existing or envisioned in literature)
- existing or envisioned \ac{EO}-based livelihood indicators or sources of evidence
- lack of definition for crisis -- links to emergency management in a changing climate or more immediate changes/impacts

\ac{EO} data is not only useful for monitoring longer-term international goals, but also for generating spatially-explicit evidence for assessing the impact of events producing rapid change, such as flooding, deforestation, wildfires, damage to irrigation infrastructure in the dry season, etc.

Free and open \ac{EO} data are a reliable and objective global data source that can also serve humanitarian organisations and initiatives in moments of emergency or crisis, however defined. A handful of research with the purpose of developing what are known as *crisis indicators* exists, utilising \ac{EO}-based information. The term "crisis" is, however, very loosely defined and quite subjective, since the definition is related to what is being affected and who or what it impacts. Connecting detectible changes in land cover or land use as being caused or related to a defined crisis requires a lot of inference, and various additional data sources for validation, which may not be available at the time of analysis due to limitations and restrictions to data collection, access, etc. associated with the identified crisis.

Livelihood-specific Evidence

1. economic size, growth and distribution (using luminosity)
2. population size, growth and distribution
3. differences in geographic endowments (water, farmland, natural resources, etc.) -- affect on supply of public goods
4. size and growth of cities, their legal and illegal parts, slums, distribution of infrastructure and economic activity, etc.
5. density and quality of road networks
6. size, quality and change of land plots
7. weather, climate, droughts, crop failures, food shortages, etc. potential disasters
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

pressures on natural Resources
growing population
environmental variability


# State-of-the-Art

\ac{EO} data are highly complex, are rapidly increasing in volume and variety, and are unfortunately underutilised in terms of extracting their information potential. A lack of data can no longer be considered a limiting factor to generating meaningful information, rather a lack of reproducible, reliable and transferable methods. There have been many strides in technology, methods and analysis towards better utilising the potential of free and open big \ac{EO} data.

## Automated Semantic Enrichment

- focus on existing algorithms

- heterogeneous sensors
- knowledge-based

Multi-dimensional methods, robust to redundant information, are required to process and classify a time-series of multi-spectral scenes. Initial, generic semantic enrichment, e.g. automatic spectral categorisation (i.e. preliminary classification) into classes equal or inferior to land cover classes, reduces the dimensionality of data in a repeatable way.

Initial, generic semantic enrichment, e.g. automatic spectral categorisation (i.e. preliminary classification), increases automation of \ac{EO}-based indicator extraction. Applying generic, semantic enrichment moves away from application-based algorithms (e.g. water classifiers) and sample-based classifiers, which are often not transferable among multiple images at different spatio-temporal locations. Complete, automated remotely sensed image understanding is something for the future, Pre-classification can be understood as a first, fully automated step towards image understanding, which is envisioned to include land cover classification [@baraldiOperationalAutomaticRemote2012]. Automatically generated semantic enrichment transforms \ac{EO} images into meaningful information in an automated way.


One existing transferable method for initial, generic semantic enrichment is automatic spectral categorisation of \ac{EO} data (i.e. preliminary classification). This moves away from application-based algorithms (e.g. water classifiers) and sample-based classifiers, which are often not transferable among multiple images at different spatio-temporal locations. Completely automated understanding of remotely sensed images is something for the future, but pre-classification can be understood as a first, fully automated step towards automated land cover classification [@baraldiOperationalAutomaticRemote2012].

## Some existing indicators using free and open \ac{EO} data

**(Some Indicators Utilising \ac{EO}-Based Information)**

- literature review of existing optical \ac{EO}-based indicators or sources of evidence

Automated, repeatable and reliable \ac{EO} information extraction can theoretically be conducted over large areas and time-spans (assuming adequate hardware), but requires a combination of deductive (i.e. rule/expert-based) and inductive methods that are multi-dimensional and robust to redundant information. Many challenges exist beyond automatisation and improving processes (e.g. efficiency), including large data volumes, high repetition rates, and identifying significant indicators (e.g. advanced information extraction) for a given purpose.


### Sentinel-1

- flood assessment or visible changes to water bodies
- SAR based index similar to that used on Landsat data

@corbaneBigEarthData2017 used Sentinel-1 data to generate more up-to-date information on human settlements than available in the first multi-temporal \ac{GHSL} based on Landsat [@pesaresiOperatingProcedureProduction2016]. They used the results from the analysis of Sentinel-1 data to mitigate commission and omission errors produced by @pesaresiOperatingProcedureProduction2016 by applying an \ac{SML} classifier designed for remote sensing big data analytics. The \ac{SML} classifier used training sets derived from existing global land cover products in order to classify built-up areas from Sentinel-1 data.

### \ac{MODIS}

### Night-time Light Data

Global \acp{NTL} data show the locations and brightness of light escaping into space. Most of these lights are electric and originate from human settlements, making \ac{NTL} a useful data source for bridging social science and remote sensing. \ac{NTL} data has been used as an indicator for various socio-economic factors, including energy consumption, distribution of economic activity, and estimations of \ac{GDP} [@zhangNighttimeLightRemote2015]. They have also been used for crisis-related applications, such as estimating the number of affected or displaced people in the case of a crisis [@corbaneMonitoringSyrianHumanitarian2016] or early damaged area estimation [@kohiyamaEarlyDamagedArea2004]. Most \ac{NTL} studies up to now have been based on a few dates or annual image composites. Further research in this field would include focusing more on temporal dynamics in \ac{NTL}, taking seasonal or hourly changes into consideration to better inform interpretations of results. For example, areas with limited electricity are sometimes limited to certain hours in the day/night or days of the week, which could impact interpretation of results regionally.

For 40 years, data was collected using the \acp{DMSP} \ac{OLS}. Since 2011, \ac{NTL} data are being captured by the \ac{VIIRS} \ac{DNB}. Methods exist for inter-calibrating \ac{DMSP} with \ac{VIIRS} data in order to gain longer time-series of images for detecting changes before \ac{VIIRS} became operational in late 2011. [@liIntercalibrationDMSPOLS2017] inter-calibrated \ac{DMSP}/\ac{OLS} and \ac{VIIRS} night-time light images in order to retrospectively analyse changes that occurred to human settlement areas during the course of the Syrian civil war.  Pre-processing requires removal of background noise and solar or lunar light contamination, cloud cover screening and exclusion of non-electric light sources (e.g. volcanoes, fires) [@elvidgeVIIRSNighttimeLights2017].

[@corbaneMonitoringSyrianHumanitarian2016] integrated \ac{NTL} \ac{EO} data from the \ac{VIIRS} with the \ac{JRC}'s \ac{GHSL} to assess the humanitarian impact of the Syrian conflict in a timely manner by estimating the number of people impacted. The \ac{GHSL} built-up layer is based on analysis of Landsat imagery from 1975 until 2013-2014 [@pesaresiOperatingProcedureProduction2016]. This study developed and tested a method to estimate the number of people affected by the Syrian conflict in a timely, consistent and objective manner. \ac{VIIRS} data from January 2013 until December 2015 have a spatial resolution of 750m and were masked using the \ac{GHSL} built-up layer in order to separate city lights from other night-light emissions (e.g. oil and gas wells). Differences in the detected light intensities between each two consecutives months was calculated and used as a proxy for detecting affected or damaged areas. The \ac{GHSL} built-up layer is based on Landsat data. The number of affected people for the identified areas was calculated using the \ac{GHSL} and disaggregated population data, which the \ac{JRC} used to produce depictions of global population distribution and densities in space and time (\acs{GHS-POP}). Estimated numbers of affected people per month were aggregated by administrative region, or governorate, for reporting.

\ac{GDP} growth has been estimated through measuring light emissions from satellite images.

### Landsat and Sentinel-2

- mixed pixels
- flood assessment or visible changes to water bodies
- changes or loss of agricultural areas
- deforestation or reforestation
- visible climate change or extreme weather event artefacts
- illicit crop establishment and growth

Free and open high resolution optical imagery (e.g. Sentinel-2, Landsat 5/7/8)

Landsat and Sentinel-2 sensors are limited in the sense that they can only detect features that are visible (e.g. built structures, vegetation, agricultural fields, roads). These data sources can be utilised to monitor security of livelihood assets (e.g. food or water security), land conflicts, post-crisis structural damage assessment, climate change effects, and more, especially when analysed multi-temporally.

One critical issue is that preliminary cloud masking and an accurate detection of haze conditions are required. In particular clouds make optical data useless, while areas in the image affected by haze should be radiometrically corrected in order to avoid discarding of information.

The \ac{GHSL} built-up layer is based on analysis of Landsat imagery from 1975 until 2013-2014 [@pesaresiOperatingProcedureProduction2016].

@muellerWaterObservationsSpace2016

@tulbureSurfaceWaterExtent2016 calculated surface water extent dynamics in a semi-arid region of Australia based on three decades of seasonally continuous Landsat data.

@lefebvreMonitoringUrbanAreas2016 utilised Sentinel-2 imagery to monitor urban areas using several separate image classifications, which are then fused using what is called the Dempster-Shafer theory. The classification used to detect urban areas is based on all spectral bands and a texture index called PANTEX, which ultimately integrates the spectral information with what could be considered a spatial component (i.e. texture). @lefebvreMonitoringUrbanAreas2016 also showed that Sentinel-2 and Landsat-8 data can be combined in order to improve the geometric accuracy of Landsat-8 classifications, or the repetitiveness and thematic accuracy of Sentinel-2-based analysis.

In the scope of the \ac{EC} \ac{FP7} project, \ac{G-SEXTANT}, [@tiedeAutomaticPostclassificationLand2014] demonstrated a fully automated, parameter-free post-classification land cover change detection method based on a Landsat time-series. The focus was on changes to agricultural areas at the Syrian-Turkish border as a potential indicator for livelihood security, conflict-related changes or regional stability in areas where the regional climate mandates irrigation to support crops. The thesis being presented here utilises the same data preparation for the land cover change detection used by [@tiedeAutomaticPostclassificationLand2014], including the prior-knowledge-based classification, and transfers it to Sentinel-2 imagery.

Two additional studies have used the same prior-knowledge-based classification to detect or characterise changes to land cover. @langerLongtermMonitoringEnvironmental2015 also used the same method on multi-temporal Landsat scenes from 1994 until 2015 as input to an object-based, post-classification change comparison. This analysis was used to characterise environmental changes occurring around a refugee camp. @hagenlocherEarthObservationbasedApproach2015 used the technology to support semi-automated classification of refugee and \ac{IDP} camps using \ac{VHR} and Landsat data.

ImageQuerying -- parameter free and fully automated workflows [@tiedeIMAGEQUERYINGEARTHOBSERVATION]


## Relevant data cube implementations

- focus on Landsat and Sentinel-2 use

Current, existing data cube implementations are geared towards providing access to analysis ready data.

Generic semantic enrichment.

(IQ image stack) \ac{EO} image data are semantically enriched and stored as information layers in datacubes. In combination with declarative querying in array databases, ad hoc information extraction is possible by means of semantic querying

ODC

One notable framework for monitoring the Earth's surface using a multi-dimensional data cube is \ac{LiMES}, proposed by [@giulianiLiveMonitoringEarth2017] who are involved with the \ac{SDC} [@giulianiBuildingEarthObservations2017], an operational national implementation of the \ac{ODC} [@lewisAustralianGeoscienceData2017]. \ac{LiMES} identified various challenges building a monitoring framework, one of which was turning data into understandable information products.

Australian implementations

google earth engine





----------------------------

# Taken from elsewhere...


Mubareka and Ehrlich (2010) combined Landsat data and field data to derive environmental indicators of conflict-induced changes in land use such as conversion of agricultural land to grassland or harvesting of woodland. They suggest further improving the risk assessment by integrating political and social factors. The capabilities of Landsat to detect burnt villages in Darfur have been shown by Prins (2008). Machado (2015) investigated the potential of Landsat time series analyses in combination with additional data sources to derive geospatial patterns of Syrian refugee flows in south-eastern Turkey.

Machado, Daniel Carlos dos Santos. 2015. "Analyzing Geospatial patterns of syrian refugee flows in southeastern Turkey by use of remote sensing and complementary data".
Mubareka, Sarah, and Daniele Ehrlich. 2010. "Identifying and modelling environmental indicators for assessing population vulnerability to conflict using ground and satellite data." Review of. Ecological indicators 10 (2):493-503.
Prins, E. 2008. "Use of low cost Landsat ETM+ to spot burnt villages in Darfur, Sudan." Review of. International Journal of Remote Sensing 29 (4):1207-14.

---


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


Big EO data is a challenge for efficient and intelligent storage, analysis and distribution. While for other big data domains the main challenge is the sheer amount of data, satellite data needs conversion into information to unfold their potential as a source for relevant multi-temporal geoinformation. The free-access policy of the Landsat and Copernicus Sentinel archives, the increased storage capacity and availability of increasing computational power allow large-scale analysis of Earth observation (EO) images especially also in the high-temporal-resolution domain, which is important for monitoring purposes. However, the temporal information is currently not readily exploitable in the EO image databases such as the USGS Earth Explorer or the Sentinels Scientific Data Hub itself. Extracting information from time series is difficult due to the volume, velocity and variety of EO images. For each new image, which is part of the temporal analysis, the volume of the whole stack is increasing linearly. Different sensors, different acquisition times or dates and the variety of characteristics of natural phenomena adds additional complexity. Therefore, the volume and variety require the approaching of efficient analysis of long EO image time series regarding algorithms and data models. The development of new methods, which are going beyond traditional change detection, are on its way: Usually change detection is conducted as a pairwise comparison of EO images (Singh 1989, Petitjean et al. (2012), Guyet and Nicolas (2016)). In contrast, long EO image time series analyses – needed for constant monitoring purposes - aim at classifying and analysing the trajectory of radiation at a location on the Earth (Petitjean et al. 2012). Both have in common that they require significant change of detectable radiance values between images that are due to real and actual changes on the Earth’s surface (Singh 1989). In addition, algorithms for big EO data analysis need near full automation to be applicable and usable on the large amount of data sets. Today techniques, methods, and tools, for automated data analysis are often insufficient for the automated analysis and information extraction from big EO data sources, but interesting approaches to tackle processing and new data storage solutions are proposed. Recent developments are the EarthServer (Baumann et al. 2015) based on a Rasdaman database, the Australian Geoscience Data Cube (Purss et al. 2015), which is currently implemented in a high performance computing (HPC) environment (Evans et al. 2015) or EarthDB (Planthaber, Stonebraker, and Frew 2012) based on a SciDB database (Stonebraker et al. 2013). A combination of fully automatic semantic enrichment of EO data and time series analysis in 3D data cubes are presented by Tiede et al. (2016). [RD8-16]. Regarding the EO analysis and processing techniques, it can be difficult to extract useful information in case of phenomena that are not really predictable in terms of “what” to search. Anyway, the paradigm of object-based image analysis (OBIA) extends the traditional per-pixel based image classification approaches that rely only on the spectral information per single pixel. OBIA enables the incorporation of geometry and expert knowledge on top of traditional spectral values and this allow to improve for example classification by using existing knowledge available for example as OSINT. One main point is the aspect that current high-resolution sensors “significantly increase the within-class spectral variability and, therefore, decrease the potential accuracy of a purely pixel-based approach to classification” (Blaschke et al., 2014, RD44). This point is even more valid for the task of analyzing large amounts of remotely sensed data incorporating information from a variety of other sources into the analysis which is the case of the study of migration where EO is not the only source of information. This issues can be mitigated by considering time-series as the starting point. In fact, time-series analysis and especially the detection of changes can be very useful as a source of information to be used in spatial analysis models used to detects possible hot spots from EO data especially from SAR time series and VHR time series. Some examples are shown later using SAR EO data but the same approach is applicable to VHR data and HR. In the case of VHR optical imagery, time-series analysis can be combined with deep learning (and in general machine learning and computer vision techniques). Similar to the way our brains learn to recognize faces, deep learning algorithms learn to recognize patterns, such as road-building in previously untouched areas or such as modification from forested areas to crops areas. Many researchers use these findings to monitor forests and agriculture. The potential for such a capability is tremendous. For example, in case of migration, food security and in general food production estimation can be really useful for the anticipation of migration flows variation. Also HR multi-spectral imagery, particular indexes such as NDVI can be monitored over long time-series (using historical data) in various ways in order to assess food security at scales which can be useful to analyze local or small scale migration phenomena. This information can be added to common large scale reports provided normally by organisations like FAO (e.g. http://www.fao.org/hunger/en/).
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



Free and open high resolution optical imagery (e.g. Sentinel-2, Landsat 5/7/8) lends itself well to information extraction for indicators due to the fact that pixels are mixed. One applied example comes from Tiede et al. (2014) in the scope of the \ac{EC}'s \ac{FP7} project \ac{G-SEXTANT}. They demonstrated an automatic post-classification land cover change detection method based on Landsat imagery, focusing on changes in agricultural areas in at the Syrian-Turkish border as a potential indicator for livelihood security and ultimately regional stability in areas where the regional climate mandates irrigation to support crops. Further exploration into indicators for crisis, whether natural disasters or man-made conflicts, is an expanding field of research, including the development of automated methods for pro-longed monitoring of areas. Indicators based on high resolution data have been envisioned for detecting or monitoring burnt villages; informal urban growth; the development or growth of refugee or \ac{IDP} camps (Wang et al. 2015) and their impact on the surrounding environment; changes in activity (e.g. new infrastructures such as roads or air fields); illicit crop establishment and growth (e.g. opium cultivation in Afghanistan); environment degradation; flood assessment or visible changes to water bodies; changes or loss of agricultural areas; deforestation or reforestation; and visible climate change or extreme weather event artefacts.

The ultimate aim of any data management system is to facilitate technical access and handling of data as rapidly as possible. Handling in this case refers also to typical and well-known database use-cases, which are including, but not limited to, projection (sub setting), selection (filtering) or joining (combining) of data. Typical applications of big \ac{EO} images do not require processing all available images in an archive, but is usually selective regarding the area-of-interest, the time interval, quality levels (e.g. cloud cover) of the images but also their content itself (e.g. based on the legend of a scene classification map, i.e. water, vegetation, fire). The selection (filtering) might precede further operations, e.g. finding vegetation peaks over multiple years (a combination of projection and joining). Current \ac{EO} image archives such as the \ac{ESA} Scientific Data Hub or the \ac{USGS} Earth Explorer do not provide these operators. Moreover, typical purely files-in-directories-based approaches are limited to fulfil the requirements for implementing all of these operators to reach the aforementioned aim. Typically, the files are referenced by their filenames only or by using a hierarchical folder-based system. These storage systems are reading the files sequentially and are therefore not suitable for managing, including processing, large amount of data.

Current big \ac{EO} image processing paradigms require systems “to bring the users to the data and not the data to the users” and allow “any query, any time”. These paradigms are putting heavy requirements on software and hardware, especially in petabyte-scaled applications with data-intensive operations, which will be common in a few years. Therefore, data- and infrastructure providers are seeking the solution in cloud-based systems, where currently different approaches are existing side-by-side and are outperforming traditional methods. Arguably, the current prevalent big \ac{EO} data handling approach is to use a map-reduce-approach (a prominent example is the Google Earth Engine, or Apache Hadoop as software package), or a database-approach, where native array databases are utilised (example technologies (in the sense of “tools”) are Rasdaman and SciDB). Some approaches, such as the \ac{AGDC}, are combining both approaches, mainly by implementing and retrofitting database properties (user management, indexing, etc.).

Array-database-based approaches usually come with properties, which are well-known from relational databases and can be exploited for handling large amount of \ac{EO} images as well. Core features of database systems are the centralised data management, improved data security, multi-user support, transparent query processing and the use of a declarative query language like \ac{SQL}. Array databases have been applied for handling big Earth data in recent years [Planthaber et al. 2012]. Examples are the EarthServer [Baumann et al. 2016], based on the Rasdaman database, and EarthDB which is based on the SciDB database.

Most of the currently available technology implement the so-called datacube. For example, an array database might instantiate \ac{OGC}-compliant datacubes, where the semantics of the axes are defined using \acp{CRS}, e.g., spatial coordinate reference systems, known by the harmonisation efforts by the \ac{EPSG}. For example, in a three-dimensional datacube, a one-dimensional time \ac{CRS} overlays the two-dimensional \ac{CRS}. In total six characteristics have been identified in the publicly available datacube manifesto (<https://groups.google.com/forum/#!topic/rasdaman-users/Q3Zg7Tbc1_8>).  

Besides the technology-driven strategies for performing searching and processing on the database level, user-driven requirements are leading to on-demand web-based online processing of big \ac{EO} data. In the last years, several technologies and standards, which can be used for online processing of \ac{EO} data, have been developed and made available to the community [Petcu et al. 2010]. Two \ac{OGC} standards are the \ac{WCPS} and the \ac{WPS}, while technology implementations are Google Earth Engine [Google Earth Engine Team2015] or the Jupyter notebooks. Other examples of web-based platforms, which have been explicitly designed for processing and analysing \ac{EO} data, include the Amazon Cloud \ac{AWS} for processing of Landsat-8 data, with a free access to the \ac{API} [Amazon 2016]. The \ac{AGDC} is using the \ac{NCI} to provide Landsat images in the petabyte scale together with processing capabilities over the internet [Evans et al. 2015]. The \ac{EODC}, a collaboration between the technical university of Vienna, the \ac{ZAMG} and other companies, pursues a similar approach [Wagner et al. 2014]. Big Earth Data is characterised by the (at least three) “V’s”: Volume, Velocity, Variety, where sometimes Veracity is added as fourth “V”. Taking into account these characteristics, compared to traditional \ac{EO} image processing pipelines, Big Earth Data-“ready” systems have to consider some additional constraints, which are imposed by the “any query, any time” requirement. The exploitation of the value of Big Earth Data involves automation, pre-processing, on-demand querying and compelling visualisation of the results. Massive processing power in the cloud and fast network connection is required, but not sufficient. Automation of intelligent workflows leading to pre-processing of data are important drivers for on-demand and ad-hoc querying to extract information in real time. Semantically enriched data allow also unexperienced users to formulate queries by means a high-level declarative language. Instead of having to translate an algorithm into software code manually, the query will be evaluated by the system and transformed into optimised physical access patterns. This approach can be realised by automatic (application independent) semantic enrichment of \ac{EO} images in Big \ac{EO} image databases, which are therefore “prepared” and “ready” for application specific queries in distributed array databases (with a declarative query language and a query optimiser). This approach avoids redundancy in data handling and repeated data (pre-) processing. The feasibility of this approach has been proven by Tiede et. al. [2016].
