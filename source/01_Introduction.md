\cleardoublepage
\part{Context}

\cleardoublepage
\pagestyle{scrheadings}
\pagenumbering{arabic}
\cleardoublepage
\chapter{Introduction}\label{ch:introduction}

# Motivation

Technological advances have driven many changes in \ac{EO} from space, including new, innovative sensors and ways to handle, store and process exponentially growing data archives. In 1972, the launch of the Landsat programme, co-managed by the \ac{USGS} and \ac{NASA}, led to what is now the longest record of Earth's status and dynamics, and, when the archive was opened to public access in 2008, set the stage for free and open \ac{EO} data  [@wulderOpeningArchiveHow2012]. The launch of the Sentinel satellites starting in 2014 from the \ac{EU}'s \ac{EO} programme, Copernicus, has massively increased the spatial resolution and temporal frequency of freely and openly available \ac{EO} data from a variety of sensors, including radar and multi-spectral instruments.

This kind of data is often referred to as big Earth data, but the challenge that faces researchers is not merely technological, in terms of storage, access and processing, but rather in developing methods to distill information from this wealth of data. Free and open \ac{EO} data with global coverage offer potential for large-scale, multi-temporal and persistent monitoring and analysis, especially with a promise of continued observation for years to come [@druschSentinel2ESAOptical2012]. Manual or visual analysis can in no way keep up with the continuous flow of data. It is necessary to develop higher degrees of automation for information extraction (e.g. automated-prior-knowledge based or machine learning classification procedures), especially when conducting analysis over large-scale areas or long, dense time-series. Without such automated methods for information extraction, much data remains unused as relatively meaningless numbers, even if the images are nice to look at.

We are currently witnessing a shift towards an alternative approach for big data storage and analysis, enabling access to massive geo-spatio-temporal data ready for analysis. This is achieved by using multi-dimensional data cubes for massive, gridded data [@baumannDatacubeManifesto2017], bringing users to data, rather than data to users. However, data is still merely numbers and not information, even if the data is considered ready for analysis, however defined. With so much data and so many domains where they may be relevant, it makes sense to avoid application-specific (pre-)processing. One notable framework for monitoring the Earth's surface using a multi-dimensional data cube is \ac{LiMES}, proposed by [@giulianiLiveMonitoringEarth2017] who are involved with the \ac{SDC} [@giulianiBuildingEarthObservations2017], an operational national implementation of the \ac{ODC} [@lewisAustralianGeoscienceData2017]. \ac{LiMES} identified various challenges building a monitoring framework, one of which was turning data into understandable information products.

Semantic enrichment of \ac{EO} data (i.e. generating meaningful information) is not only practical in terms of interpreting data, but is necessary. Optical \ac{EO} data merely offers spectral values for geographic places and different moments in time. Objects cannot be directly measured since pixels with similar reflectance values can represent different objects or surfaces, but these reflectance values indicate certain land cover types or surfaces. The spatial resolution and acquisition frequency also limit direct measurements of many objects or events on Earth (i.e. mixed pixels or relatively slow events), and non-physical entities cannot be directly measured (e.g. political boundaries). Information extracted from \ac{EO} data provides spatially-explicit evidence that can complement existing indicators or reports from other in-situ sources. For example, looking at agricultural exports, consumption, malnutrition, or other statistics, it could be deduced that agricultural production has changed within a region or country, but it is often still unknown exactly where these changes have occurred and \ac{EO} data might be able to offer useful evidence. Information from \ac{EO} sources are particularly relevant for areas that are difficult, dangerous or expensive to reach in the field (e.g. war zones, landslide-prone areas), and where consistent, reliable and unbiased data collection over longer periods of time is necessary for the application at hand. Their open and free nature could reduce costs for gaining certain kinds of information, as well as improve the timeliness of actionable information or monitoring of specific goals, such as the \acp{SDG}.

One existing transferable method for initial, generic semantic enrichment is automatic spectral categorisation of \ac{EO} data (i.e. preliminary classification). This work explores the utility of such enrichment within an implementation of the \ac{ODC}, demonstrating its usefulness as the basis for semantic queries. This moves away from application-based algorithms (e.g. water classifiers) and sample-based classifiers, which are often not transferable among multiple images at different spatio-temporal locations. Completely automated understanding of remotely sensed images is something for the future, but pre-classification can be understood as a first, fully automated step towards automated land cover classification [@baraldiOperationalAutomaticRemote2012].

This work focuses on the current and potential contributions of free and open \ac{HR} \ac{EO} imagery as sources of spatially-explicit evidence through transferable, semi-automated, multi-temporal information extraction. It applies a highly automated, scalable workflow using Sentinel-2 data which stores pre-classified data (i.e. semi-concept information layers) in an implementation of the \ac{ODC}, enabling a variety of semantic queries through time. Due to the consistent global coverage, independent of political borders, free and open \ac{HR} \ac{EO} data are ideal sources of evidence for generating meaningful information products to support decision-makers in an international context. They are constantly gathered in an unbiased way, without requiring tasking or direct acquisition costs for those that utilise them. Combined or integrated with additional data sources, \ac{EO} or otherwise, extracted information becomes increasingly meaningful through consilience. This information has the potential to be of great service to global initiatives, whether it be monitoring the \ac{UN} \acp{SDG} *[CITE]*, the Sendai Framework for Disaster Risk Reduction *[CITE]*, or otherwise.

Northern Syria was chosen as the use-case location based on a plethora of existing \ac{EO}-based research, climate suitability for optical time-series analysis, low average cloud cover in the Sentinel-2 archive, and the current conflict, which makes other methods of data acquisition challenging or impossible. Conflict on a country scale is difficult to assess or monitor, but is assumed to drive detectible land cover changes that are not homogenous. This contribution is an example of an automated, reproducible framework for handling and analysing massive \ac{EO} data, and demonstrates the benefits of automated, knowledge-based semantic enrichment for environmental change detection and \ac{EO}-based information extraction for differing thematic domains.


# General Objectives

More specifically, this thesis was motivated by a few broad objectives. They can be summarised by the following:

- review existing indicators for the \acp{SDG} and other global initiatives
- explore ways \ac{EO}-data can contribute to global initiative indicators
- develop a highly automated, transferable, scalable workflow utilising Sentinel-2 data
- gain familiarity with the \ac{ODC}
- improve knowledge and experience with Python, Linux and Jupyter notebooks
- investigate semi-automated information extraction using pre-classified semi-concepts
- focus on humanitarian applications
- build a transferable and reproducible analysis environment


# Research Questions

The following body of work aims towards answering the following questions:

1) What indicators exist in the realm of humanitarian-related monitoring or detection and which of these are spatially explicit?

2) What are some ways that \ac{EO} contributes or can be envisioned as contributing towards spatially-explicit evidence for indicators?

3) Is it possible to download Sentinel-2 data and to automatically enrich it semantically?

4) Are semi-concepts sufficient for semi-automated monitoring in a humanitarian domain, where time is of the essence and sample-based algorithms applicability to various climates/ geographic locations might be limited?

5) How can such spatially-explicit evidence be validated?
