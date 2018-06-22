\cleardoublepage
\part{Context}

\cleardoublepage
\pagestyle{scrheadings}
\pagenumbering{arabic}
\cleardoublepage
\chapter{Introduction}\label{ch:introduction}

# Motivation

Technological advances have driven many changes in \ac{EO} from space, including new, innovative sensors and ways to handle, store and process exponentially growing data archives. In 1972, the launch of the Landsat programme, co-managed by the \ac{USGS} and \ac{NASA}, led to what is now the longest record of Earth's status and dynamics. When the archive was opened to public access in 2008, it set the stage for free and open \ac{EO} data  [@wulderOpeningArchiveHow2012]. The launch of the Sentinel satellites starting in 2014 from the \ac{EU}'s \ac{EO} programme, Copernicus, has massively increased the spatial resolution and temporal frequency of freely and openly available \ac{EO} data from a variety of sensors, including radar and multi-spectral instruments.

This kind of data is often referred to as big Earth data, but the challenge that faces researchers is not merely technological, in terms of data storage, access and processing, but rather in developing methods to distill *information* from this wealth of data. Free and open \ac{EO} data with global coverage offer potential for large-scale, multi-temporal and persistent monitoring and analysis, especially with a promise of continued observation for years to come [@druschSentinel2ESAOptical2012]. Manual or visual analysis can in no way keep up with the continuous flow of data. It is necessary to develop higher degrees of automation for information extraction (e.g. automated-prior-knowledge based or machine learning classification procedures), especially when conducting analysis over large-scale areas or long, dense time-series. Without such automated methods for information extraction, much data is not accessed or utilised and remains as relatively meaningless digital numbers, even if the images are interesting to look at.

We are currently witnessing a shift towards an alternative approach for big data storage and analysis, enabling access to massive geo-spatio-temporal data ready for analysis. This is achieved by using multi-dimensional data cubes for massive, gridded data [@baumannDatacubeManifesto2017], rather than file-based systems, bringing users to data, rather than data to users.  However, data is still merely numbers and not information, even if the data is considered ready for analysis, however defined. With so much data and so many domains where they may be relevant, it makes sense to avoid application-specific (pre-)processing.

Semantic enrichment of \ac{EO} data (i.e. generating meaningful information) is not only important for conducting meaningful analysis, but is necessary for turning data into understandable information products. Optical \ac{EO} data provide spectral values to represent the distance between the sensor and Earth at different moments in time. Objects cannot be directly measured since pixels with similar reflectance values can represent different objects or surfaces, but these reflectance values can indicate certain land cover types or surfaces. Non-physical entities cannot be directly measured (e.g. political boundaries), and the spatial resolution and acquisition frequency also limit direct measurements of many objects or events on Earth (i.e. mixed pixels or relatively slow events).

Information extracted from \ac{EO} data provides spatially-explicit evidence that can complement existing indicators or reports from other in-situ sources. For example, looking at agricultural exports, consumption, malnutrition, or other statistics, it could be deduced that agricultural production has changed within a region or country, but it is often still unknown exactly where these changes have occurred and \ac{EO} data might be able to offer useful evidence. Information from \ac{EO} sources are particularly relevant for areas that are difficult, dangerous or expensive to reach in the field (e.g. war zones, landslide-prone areas), and where consistent, reliable and unbiased data collection over longer periods of time is necessary for the application at hand.

Due to the consistent global coverage, independent of political or other human-imposed borders, free and open \ac{HR} \ac{EO} data are ideal sources of evidence for generating meaningful information products to support decision-makers in an international context. They are constantly gathered in an unbiased way, without requiring tasking or direct acquisition costs for those that utilise them. Combined or integrated with additional data sources, \ac{EO} or otherwise, extracted information becomes increasingly meaningful through consilience. Their open and free nature could reduce costs for gaining certain kinds of information, as well as improve the timeliness of actionable information. Information derived from this kind of \ac{EO} data has the potential to be of great service to global initiatives, whether it be monitoring the \ac{UN} \acp{SDG} [@Resolution70Transforming2015], the Sendai Framework for Disaster Risk Reduction [@Resolution692832015], or otherwise.

One existing transferable method for initial, generic semantic enrichment is automatic spectral categorisation of \ac{EO} data (i.e. preliminary classification). This work explores the utility of such enrichment within an implementation of the \ac{ODC}, demonstrating its usefulness as the basis for semantic queries. This moves away from application-based algorithms (e.g. water detection) and sample-based classifiers, which are often not transferable among multiple images at different spatio-temporal locations, much less different sensors. Completely automated understanding of remotely sensed images is something for the future, but preliminary classification can be understood as a first, fully automated step towards automated land cover classification [@baraldiOperationalAutomaticRemote2012].

This work focuses on the current and potential contributions of free and open \ac{HR} \ac{EO} imagery as sources of spatially-explicit evidence through transferable, semi-automated, multi-temporal information extraction. It applies a highly automated, scalable workflow using Sentinel-2 data which stores pre-classified data (i.e. semi-concept information layers) in an implementation of the \ac{ODC}, enabling a variety of semantic queries through time. Northern Syria was chosen as the use-case location based on a plethora of existing \ac{EO}-based research, climate suitability for optical time-series analysis, low average cloud cover in the Sentinel-2 archive, and the current conflict, which makes other methods of data acquisition challenging or impossible. Conflict on a country scale is difficult to assess or monitor, but is assumed to drive detectible land cover changes that are not homogenous. This contribution is an example of an automated, reproducible framework for handling and analysing massive \ac{EO} data, and demonstrates the benefits of automated, knowledge-based semantic enrichment for environmental change detection and \ac{EO}-based information extraction for differing thematic domains.


# General Objectives

This thesis was motivated by a few broad objectives. They can be summarised by the following:

- review existing indicators for the \acp{SDG} and other global initiatives
- explore ways \ac{EO}-data can contribute to global initiative indicators
- develop a highly automated, transferable, scalable workflow
- utilise *all* Sentinel-2 data available for the study area (i.e. large data handling)
- gain familiarity with the \ac{ODC}
- improve knowledge and experience with Python, Linux and Jupyter notebooks
- investigate repeatable, reliable, semi-automated information extraction using pre-classified semi-concepts
- build a transferable and reproducible analysis environment


# Research Questions

This thesis aims towards answering the following questions:

Context:
- What spatially-explicit indicators exist to monitor global initiatives or be utilised in humanitarian contexts?
- What are some ways that \ac{EO} contributes or can be envisioned as contributing towards spatially-explicit evidence for indicators?
- What are some methods that exist for automated semantic enrichment?

Implementation:
- Is it possible to download Sentinel-2 data and to automatically enrich it semantically?
- Can all Sentinel-2 data available for a region be automatically incorporated in a semantically enriched data cube?
- How can vegetation or water semi-concepts be analysed utilising time in the context of existing indicators?
- Are semi-concepts sufficient for semi-automated monitoring in a humanitarian domain, where time is of the essence and sample-based algorithms applicability to various climates/ geographic locations might be limited?
- How can such spatially-explicit evidence based on big EO data be validated?
