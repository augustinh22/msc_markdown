\cleardoublepage
\part{Applied Use-Case}

\cleardoublepage
\pagestyle{scrheadings}
\cleardoublepage
\chapter{Implementation}\label{ch:implementation}


The applied example implementation covers a highly automated workflow for transforming Sentinel-2 data into meaningful information. Some of its potential utility is framed in \autoref{sec:framing}, and preliminary ad-hoc results for further discussion are provided in \autoref{ch:results}.


# Use-Case Selection

An area located in what is currently known as north-western Syria was chosen as the use-case illustration and is covered by three adjacent Sentinel-2 granules with observations from June 2015 to June 2018.


## Background

The conflict in Syria has been going on since March-April 2011 [@SyriaCivilWar]. Tunisian and Egyptian uprisings in 2011, now referred to as the Arab Spring, inspired pro-democracy Syrian activists to organise protests. A harsh response to these protests by the Syrian government, led by Bashar al-Assad, resulted in hundreds of dead or imprisoned demonstrators. This violent response, paired with existing social unrest, motivated the establishment of the Free Syrian Army later in 2011, whose overall aim is to overthrow the Assad-led government. It was at this point that the conflict began shifting towards civil war.

Syria experienced a drought from around 2007 until at least 2010 [@SyriaCivilWar; @fountainResearchersLinkSyrian2018]. While by no means the cause of Syria's civil war, some claim that the drought contributed to social unrest, a loss of livelihood security and an increased number of internally displaced people, fueling the conflict. According to @cookSpatiotemporalDroughtVariability, there is a 98% likelihood that this drought was drier than any comparable period in the last 500 years, if not the last 900 years (89% likelihood). This drought event contributed to already existing water and agricultural insecurity, situated in a century-long trend towards drier, warmer conditions on average, and was a factor motivating some of the estimated 1.5 million Syrian people to relocate from rural areas to urban centres and peripheries [@kelleyClimateChangeFertile2015].

As of December 2015, an estimated 11 million Syrians have been displaced by the on-going civil war or events leading up to it, where 4.6 million are refugees and 6.6 million internally displaced [@corbaneMonitoringSyrianHumanitarian2016]. The \ac{UNHCR} estimates from May 2018 identify around 5.6 million registered Syrian refugees and still 6.6 million internally displaced persons [@SituationSyriaRegional; @refugeesSyriaEmergency].

\graffito{There are multiple application domains.}

The framing of the illustrated results in the context of this thesis do not directly deal with the on-going conflict in Syria. They are intended to provide preliminary information in service of the \acp{SDG}. However, the study area was chosen on the assumption that surface water and particularly vegetation dynamics might be impacted by the conflict and made visible using such a tool. This was demonstrated in preliminary analysis by @tiedeAutomaticPostclassificationLand2014 and research on vegetation dynamics and erosion by @abdoImpactsWarSyria2018.


## Spatio-Temporal Location

This proof-of-concept implementation focuses on an area located in north-western Syria, along the border to Turkey from June 2015 until June 2018, the entire duration of Sentinel-2 observations at the time of writing. In this case, the focus is on generating information in support of the \acp{SDG}. However, the on-going conflict in this area for the duration of Sentinel-2's data collection presented an opportunity to potentially detect land cover changes and impacts that may or may not be linked to conflict-related events, such as damage to agricultural irrigation infrastructure, internal displacement of people or changes to visible surface water bodies (e.g. lakes, dams).

Three adjacent Sentinel-2 granules (37SBA, 37SCA, 37SDA) cover an area of more than 30,000km^2 (latitudes 36.01°-37.05°N; longitudes 35.67°-39.11°E), as depicted in \autoref{fig:overview}, and ultimately define the extent of the study area. Based on maps referring to Syria before the start of the civil war, this area covers the entire northern stretch of the Aleppo Governorate, northwestern Raqqa and northern Idlib, in addition to parts of the following Turkish provinces bordering Syria: Hatay, Kilis, Gaziantep and Şanlıurfa.

![Overview of study area with Sentinel-2 relative orbits based on simplified acquisition swaths, showing an approximate orbit overlap in purple. \label{fig:overview}](source/figures/study_area_edit.png)

Data characteristics of the study area based on their collective metadata indicate suitability for optical time-series analyses, primarily due to the low average annual cloud-cover reflected in the Sentinel-2 archive for the area. According to the Köppen-Geiger classification, the climate is mostly warm Mediterranean (Csa) in the western part of the study area transitioning into warm and semi-arid (BSh) towards the east [@peelUpdatedWorldMap2007]. The annual average cloud-cover percentage, extracted from \ac{ESA}’s \ac{L1C} metadata, also decreases from west to east. The majority of scenes acquired from May to October have a cloud-cover percentage below 10%, while otherwise generally ranging between 20% and 40% from October to May. These summary metadata metrics were determined using the Sentinel-2 metadata analysis system developed at \ac{Z\_GIS}, called EO-Compass [*cite*].


# Data

## Sentinel-2

### Specifications

Copernicus is a European Earth observation programme, previously known as \acs{GMES}. It owns the fleet of Sentinel satellites, which is connected to other sensors called “contribution missions”, and operates downstream services. The Sentinel-2 satellites are equipped with a \acf{MSI} observing 13 spectral bands (443\acs{nm}-2190\acs{nm}). Data is captured with a swath width (i.e. field-of-view) of approximately 290\acs{km}. Spatial resolution ranges from 10-60\acs{m}: three visible bands and one near-infrared band (10\acs{m}); six red-edge/shortwave infrared bands (20\acs{m}); and three atmospheric correction bands (60\acs{m}). The spectral properties of the bands are somewhat similar to Landsat data, but lack thermal bands (\autoref{fig:spectral_bands}).

![Spectral comparison of Landsat 7 and 8 bands with Sentinel-2 (retrieved on 25 April 2018 from https://landsat.gsfc.nasa.gov/sentinel-2a-launches-our-compliments-our-complements/) \label{fig:spectral_bands}](source/figures/landsat_sentinel2.png)

Currently two Sentinel-2 satellites, known as Sentinel-2A and -2B, are continuously and systematically collecting observations globally. They were launched on June 23, 2015 and March 7, 2017, respectively, with Sentinel-2C and -2D already planned to extend the longevity of Sentinel-2 observations in the future. Considering observations from Sentinel-2A and -2B together, the nominal average revisit time is 5 days at the equator, with more frequent data capture towards the poles. Data are processed and provided by \acs{ESA} as \acf{L1C}, which includes radiometric calibration to \ac{ToA} reflectance and geometric corrections (e.g. orthorectification, spatial registration). \ac{L1C} scenes are available as granules (i.e. tiles). These granules each cover an area of approximately 100\acs{km} by 100\acs{km} and contain around 600\acs{MB} of data, including all spectral bands, metadata and some quality indicators automatically generated by \ac{ESA}.


### Data Used

All Sentinel-2 \ac{L1C} data available on the Copernicus Open Access Hub for these three granules are continuously included in the data cube, resulting in a dense time-series beginning June 28, 2015 until the most recent image. All of the data used were acquired using the download script as part of the automated workflow described in \autoref{sec:acquisition}.

At the time of writing, data is included up to June 22, 2018, which comes down to *###* Sentinel-2 granule-size scenes, collected at *###* different moments in time (i.e. different acquisition days)[^2]. These granules are captured by two Sentinel-2 relative orbits (78 and 121), resulting in temporally denser data where the orbits overlap (*see* Figure \autoref{fig:overview} for an estimation of the orbits). These three Sentinel-2 granules are provided by Copernicus in the same projection (\acs{UTM} zone 37N, \acs{EPSG}: 32637), which means that the data do not require re-projection for collective storage or analysis.

[^2]: All of the Sentinel-2 products already ingested into the data cube implementation, thus used in the showcased results, are documented in \autoref{lst:metadata}.


# Methods

The workflow implemented here focuses on automation and big data, encompassing downloading Sentinel-2 data, re-formatting them, preliminarily classifying them with \acs{SIAM}™ (i.e. generating multiple information layers), indexing Sentinel-2 images and information layers into an implementation of the \ac{ODC} and ingesting information layers (\autoref{fig:workflow}). This process runs automatically every day for each of the three study area granules. The result is daily incorporation of the most recently available data ready for analysis, including semantic queries based on the automated generic semantic enrichment. Queries are facilitated using Jupyter notebooks by accessing the information layers produced by \acs{SIAM}™ in the data cube via a Python \acs{API}.

![Automated workflow overview from download to queries and indicator extraction, which utilises the Python \acs{API}. Author's illustration. \lable{fig:workflow}](source/figures/Workflow_helvetica.png)


## Computing Environment and Tools

Before covering the workflow, it is important to share what hardware, software and computing environments were used for data acquisition, manipulation, processing, analysis and visualisation.


### Hardware

The hardware used for this implementation is a Red Hat Enterprise Linux 7 virtual machine, with 16 virtual \acp{CPU} at 2.5\acs{GHz} clocking, 31\acs{GB} \ac{RAM} and 3\acs{TB} of generic, all-use storage.


### SIAM™

This implementation incorporates multiple semantic semi-concept granularities generated by the Satellite Image Automatic Mapper™ (\acs{SIAM}™, release 88v7), thus enabling semantic queries [@baraldiSIAMReportBACRES2018]. Spectral-based image pre-classification, as implemented by \acs{SIAM}™, divides the feature space of a multi-spectral image into semantic semi-concepts using a knowledge-based approach, in contrast to data-driven approaches (e.g. supervised classification) [@baraldiAutomaticSpectralRuleBasedPreliminary2010; @baraldiSatelliteImageAutomatic2011; @baraldiSatelliteImageAutomatic2018]. Assuming images are calibrated to a minimum of \ac{ToA} reflectance, these semi-concepts are comparable and therefore transferable between multiple images and optical sensors without any additional user-defined parameterisation (i.e. fully automatic). This is the only software used in the workflow that is closed-source. Refer to \autoref{sec:semantic_enrichment} for a bit more information.


### Open-Source Software

This implementation had the overarching goal of using as much open-source software and tools as possible. This included working exclusively with Linux, Python, conda environments, git for versioning, the \ac{ODC}, PostgreSQL, Jupyter notebooks for interactive analysis, \ac{GDAL} for creating a mosaic of tiled results and \acs{QGIS} for any additional, basic calculations, visualisation outside the Jupyter notebooks and cartographic layouts.


#### Linux

The choice to work in Linux was a no-brainer, and Red Hat Enterprise Linux 7 was what was available through the SemEO project. Becoming more proficient in Linux was something that I had wanted to do for a long time, having dealt enough with difficulties using \ac{GDAL}, different Python environments on Windows, and perhaps much more relevant, long pathnames associated with Sentinel-2 products. The long pathnames of the first Sentinel-2 products (which have since been shortened) are a nightmare on Windows \acs{OS}. For these reasons, using Linux makes life easier and plays well together with most open-source software.


#### Python and conda

Two reproducible conda environments for Python are used in the workflow. conda is an open-source environment and package management system that was originally designed for working with Python, but has since been implemented to accommodate various programming languages on Windows, macOS and Linux [@anacondaincCondaCondaDocumentation2017]. It installs, runs and updates dependencies and packages for a defined version of a programming language based on specific commands or environment definitions. This theoretically makes computing environments using a specific language increasingly reproducible, and allows users to have multiple environments at their disposal, depending on the project or purpose.

/graffito{Never again hear: "Well, it works on *my* machine just fine..."}

Searching the Copernicus Open Access Hub and downloading data to processing them with \acs{SIAM}™ is automated using cron on Linux to manage daily tasks. These crontabs run Python scripts within a Python 2.7.x conda environment. The environment is equipped with *Scipy* used for resampling the required Sentinel-2 bands with a 20\acs{m} spatial resolution (i.e. bands 11 and 12) to 10\acs{m}. \acf{GDAL} is used for various tasks and the Python package *requests* is used for handling \acs{http} downloads. The environment file is available at \autoref{*include environments yaml from conda*}.

Indexing and ingesting datasets, Python \ac{API} access and resulting analysis within the Jupyter notebooks are conducted with a Python 3.5.x conda environment recommended for \ac{ODC} installations [@geoscienceaustraliaMinicondaRecommendedOpen2017]. This environment includes the *datacube*, *jupyter*, *matplotlib*, *Scipy*, *basemap* and *basemap-data-hires* packages for enabling access to data in the \ac{ODC} implementation via the Python \ac{API} and interactive analysis within Jupyter notebooks [@ceos-seoDataCubeNotebooks2017]. The environment file is available at \autoref{*include environments yaml from conda*}.


#### Git

While not of influence to the outcome of project development, the open-source versioning software, git, was used to document changes to the code base for the entirety of the project's conception. All code relevant to the automated workflow implementation (excluding \ac{ODC} and other software) is public and freely and openly available under http://github.com/augustinh22/AIQ in the "thesis" directory.


#### Open Data Cube

The \acf{ODC} is much more than software. It is an international initiative based on software initially developed by \ac{AGDC}, which is now managed by \ac{CEOS}. The objective is to increase the impact of \ac{EO}, build a community of users, and provide free and open software as a means to store, manage and analyse large volumes of \ac{EO} data by providing an integrated gridded data
analysis environment, including documentation [@ceosCEOSOpenData2017]. \ac{CEOS} is also aligned with overarching international agendas, including the \acp{SDG}, and has a mandate to improve the use of \ac{EO}-derived information.

This implementation uses the \ac{ODC} version 1.5.1, known as Purpler Unicorn (13 July 2017), with access to data provided by a Python \ac{API}. The \ac{ODC} was chosen because it functions within the data cube paradigm, has been proven to be robust and scalable, and allows for transferable approaches through its open-source license.


#### PostgreSQL

The backend of the \ac{ODC} implementation is PostgreSQL v9.2.21, **an open-source relational database management system**. This version is a bit out-of-date from the recommended version (i.e. 9.5+), but it has seemed to hold up fine. There are multiple backend solutions that could have been employed, but this one was chosen also for its open-source license.


#### Jupyter Notebooks




#### QGIS

Version 2.18 this open-source \acs{GIS} software was used to create cartographic representations of results generated through interactive analysis in the Jupyter notebooks. Again, this software was chosen due to its open-source license.


#### Open Science Framework

Although used very limitedly, this online


## Automated Workflow: Sentinel-2 Data Acquisition to ODC Ingestion

Various scripts were developed to automate this workflow. The majority of necessary scripts are located in the appendix (*see* Listings \ref{lst:download}, \ref{lst:conversion}, \ref{lst:batch}), \ref{lst:autodownload}, \ref{lst:prepSIAM}, \ref{lst:indexSIAM}, and \ref{lst:autoODC}), but are also freely, publicly and openly available at: <http://github.com/augustinh22/AIQ> **switch for OSF DOI?**


### Accessing and Acquiring Sentinel-2 data \label{sec:acquisition}

A \ac{CLI} was implemented in Python to allow searching and downloading data from the Copernicus Open Access Hub's \acs{API}, similar to the work of Olivier Hagolle [@hagolleAutomatedDownloadSentinel22018]. It is intended to be used on Windows, Mac or Linux \acs{OS}. The temporal restraints for queries can be determined based on start and end times for data acquisition or ingestion to the hub. Spatial restraints can be set by defining a point, polygon or granule name. The last of those possibilities is facilitated by an in-house \ac{API} at \acs{Z\_GIS} developed by Martin Sudmanns that returns the centre point of any existing Sentinel-2 granule by name[^3]. If this option is used, only the identified granule is downloaded from any matching results. This is especially important for targeted extraction of specific granules from older, multiple granule products in the archive from before December 6, 2016. Results are automatically unzipped in a designated target directory (in this case, granule based), and any products already located in the target directory are not downloaded again.

[^3]: In the current implementation of the Copernicus Open Access Hub's \acs{API}, using the centre point is the best way to limit results to a given granule rather than using the entire footprint extent of a granule. This is because each granule overlaps neighboring granules by at least 200m on each side. Granule specific Sentinel-2 data retrieval at the time of writing is not a feature offered by the Copernicus Open Access Hub.

\graffito{EO-Compass also uses a modified version of this script to harvest Sentinel-2 metadata.}

The structure of products and metadata has seen a few modifications since the first images offered to the public in 2015, which requires some more complex handling in the script. Most notably, Sentinel-2 products were served in packages of multiple granules prior to 6 December 2016, with sizes sometimes exceeding 6\acs{GB}. The actual physical file structure has, however, remained mostly the same (\autoref{fig:s2_structure}).

![The Sentinel-2 product physical format (Source: @europeanspaceagencySentinel2UserHandbook2015 accessed 26 January 2017) \label{fig:s2_structure}](source/figures/s2_structure.png)

For those large package products on the hub prior to December 6, 2016, the file structure is generated and each file related to a specific granule is iteratively extracted and downloaded. This contrasts to granule-specific products offered after 6 December 2016, which can be downloaded in the compressed format provided natively on the hub. It has since been announced that products provided prior to 6 December 2016 will be reprocessed to fit the current "Complete Single Tile" (i.e. single granule) format, but when this re-processing will be completed by the hub for the entire archive before 6 December 2016 is still unknown [@europeanspaceagencyPublication3rdBatch2018].


#### Sentinel-2 Downloader

During the course of this work, some individuals at \ac{Z\_GIS} expressed interest in a \ac{GUI} for using this download script. The decision was made to implement the script as a \acs{QGIS} plugin with an interface designed using Qt (*see* \autoref{fig:s2_downloader}). The download script used in this thesis was modified to search and download Sentinel-1 and -2 data from multiple hubs, allow manual manipulation of search results from the hub and enable individual granule extraction from older Sentinel-2 product file structures. At the time of writing, the current hubs include: Copernicus Open Access Hub; **list more**.

The intention is to keep improving the code base, as well as integrating Sentinel-3 search and downloads. The actual code is not provided here, but it is based on the code in \autoref{lst:download}. The code is, however, freely and openly available at: <https://github.com/augustinh22/SentinelDownloader>

![The query user-interface for the \acs{QGIS} plugin to search and download Sentinel-1 and -2 data from multiple hubs. Author's illustration. \label{fig:s2_downloader}](source/figures/sentinel_downloader.jpg)


### Formatting data for SIAM™

Following complete and successful download, the necessary bands from each newly acquired Sentinel-2 image are automatically re-formatted. \acs{SIAM}™ is sensor independent, but input data format requirements are based on Landsat for high-resolution data. Six bands, blue, green, red, near infrared and two medium infrared bands are used (i.e. 2, 3, 4, 8, 11, 12). Bands 11 and 12 are resampled from 20m pixels to 10m using SciPy. Sentinel-2's MSI does not collect a thermal band, so a constant is used to ignore thermal decision rules in \acs{SIAM}™. Based on the assumption that pixels with a value of 0 in any of the input bands contain no data and not a measured value of 0 (see discussion), a no-data mask is generated. Finally, the six Sentinel-2 bands of \ac{ToA} reflectance values are converted to an 8-bit range, stacked in ascending order and saved in the ENVI data format for \acs{SIAM}™ using \ac{GDAL}.

### Generating information layers with SIAM™

Automated generation of four semi-concept granularities (i.e. 18, 33, 48 and 96 semi-concepts) and four additional information layers has been implemented. The additional layers are: (1) binary vegetation mask based on vegetation-related semi-concepts; (2) pentanary haze mask, a discretised continuous sub192
symbolic variable; (3) ratio greenness index, i.e. (NIR / R) + (NIR / MIR1) – (Vis / MIR1) (Baraldi et al., 2010b; Baraldi, 2018); and (4) panchromatic brightness image, a linear combination of all multi-spectral input bands. Processing of each Sentinel-2 image takes approximately 5-6 minutes.

### Indexing images and information layers

A product description needs to be defined in the ODC implementation database to index data. Indexing links to externally stored data and is backed by PostgreSQL. Product descriptions identify metadata common to all datasets of that product (Geoscience Australia, CSIRO, & NCI, 2017b) and only need to be defined once.

Metadata necessary for indexing is automatically generated for each dataset. This has been implemented for Sentinel-2 and \acs{SIAM}™ generated information layers by modifying existing Python scripts provided by ODC. This metadata includes spatio-temporal data extents, data format, projection, bands/layers, file paths relative to the metadata, and more. A copy of the source Sentinel-2 dataset’s metadata is included the information layer metadata to document provenance. Once metadata has been generated, indexing automatically follows using a Python script and the data cube’s API.

The processing of indexing datasets requires that a product already be defined, which only needs to happen once. Then, metadata is automatically generated using a Python script, which includes the location and properties of the \ac{EO} data. While ingestion generates its own data storage as NetCDF files. In both cases, the logical view offered to the user is a multi-dimensional data cube

### Ingesting information layers

Once data has been indexed, it can be ingested, meaning automated tiling of an indexed product into NetCDF files for more efficient access, creating a gridded time-series data cube (Geoscience Australia, CSIRO, & NCI, 2017c). The data cube API automatically creates a new product description, re-projects the data if necessary, tiles them accordingly, creates the necessary metadata and indexes them, with automatic checks to avoid duplication.

In this implementation, automated ingestion of information layers in 100km2 tiles (10km by 10km by one time-step) occurs, keeping the original projection (i.e. UTM zone 37N, EPSG: 32637). At the time of writing, 58,477 tiles of ingested information layers have been created, a total of 144 GB.


## ODC Python API

Once data has been indexed and ingested, they can be accessed using a Python API (Geoscience Australia, CSIRO, & NCI, 2017a). This API retrieves data from a given indexed or ingested product for a defined spatio-temporal extent as a Dataset object from the xarray Python package. This Python object is a multi-dimensional, in memory, array with dimension names and is used for further analysis (e.g. in Jupyter notebooks).

## Jupyter Notebook for Indicator Calculation

- Include screenshots

## Indicator development

- reference water in Australia and apply/situate in framework referenced in section 2
- describe two indicators (water, vegetation ...)

Based on the work of @muellerWaterObservationsSpace2016 and @tulbureSurfaceWaterExtent2016 .


## Method of validation/agreement

- random samples and an external dataset
