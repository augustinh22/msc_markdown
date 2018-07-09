\cleardoublepage
\part{Applied Use-Case}

\cleardoublepage
\pagestyle{scrheadings}
\cleardoublepage
\chapter{Implementation}\label{ch:implementation}


This applied example implementation covers a highly automated workflow for transforming Sentinel-2 data into meaningful information. Some of its potential utility is framed in \autoref{sec:framing}, and preliminary ad-hoc proof-of-concept results for further discussion are provided in \autoref{ch:proof}. This implementation was documented in less detail in **cite GI_Forum Paper**.


# Use-Case Selection

An area located in what is currently known as north-western Syria was chosen as the use-case illustration and is covered by three adjacent Sentinel-2 granules with observations from June 2015 to July 2018. The data cube is, however, automatically updated once a day with the most recent Sentinel-2 data and derived information layers.


## Background \label{sec:ex_background}

The conflict in Syria has been going on since March-April 2011 [@SyriaCivilWar]. Tunisian and Egyptian uprisings in 2011, now referred to as the Arab Spring, inspired pro-democracy Syrian activists to organise protests. A harsh response to these protests by the Syrian government, led by Bashar al-Assad, resulted in hundreds of dead or imprisoned demonstrators. This violent response, paired with existing social unrest, motivated the establishment of the Free Syrian Army later in 2011, whose overall aim is to overthrow the Assad-led government. It was at this point that the conflict began shifting towards civil war.

Syria experienced a drought from around 2007 until at least 2010 [@SyriaCivilWar; @fountainResearchersLinkSyrian2018]. While by no means the cause of Syria's civil war, some claim that the drought contributed to social unrest, a loss of livelihood security and an increased number of internally displaced people, fueling the conflict. According to @cookSpatiotemporalDroughtVariability, there is a 98% likelihood that this drought was drier than any comparable period in the last 500 years, if not the last 900 years (89% likelihood). This drought event contributed to already existing water and agricultural insecurity, situated in a century-long trend towards drier, warmer conditions on average. It was a main factor in motivating some of the estimated 1.5 million Syrian people to relocate from rural areas to urban centres and peripheries [@kelleyClimateChangeFertile2015].

As of December 2015, an estimated 11 million Syrians have been displaced by the on-going civil war or events leading up to it, where 4.6 million are refugees and 6.6 million internally displaced [@corbaneMonitoringSyrianHumanitarian2016]. The \ac{UNHCR} estimates from May 2018 identify around 5.6 million registered Syrian refugees and still 6.6 million internally displaced persons [@SituationSyriaRegional; @refugeesSyriaEmergency].

\graffito{There are multiple application domains.}

The framing of the illustrated proof-of-concept results in the context of this thesis do not directly deal with the on-going conflict in Syria. They are intended to provide preliminary information in service of the \acp{SDG}. However, the study area was chosen on the assumption that surface water and particularly vegetation dynamics might be impacted by the conflict (e.g. damage to agricultural irrigation infrastructure, internal displacement of people) and be able to be made visible using such a tool for documentation purposes. This kind of change detection was demonstrated in preliminary analysis by @tiedeAutomaticPostclassificationLand2014 and research on vegetation dynamics and erosion by @abdoImpactsWarSyria2018. It must also acknowledged that \ac{EO}-derived information from such an implementation may be of use for developing indicators of humanitarian crisis, which deals with more immediate, time-sensitive situational awareness, rather than the monitoring of longer-term idealised goals.


## Spatio-Temporal Location

This proof-of-concept implementation focuses on an area located in north-western Syria, along the border to Turkey from June 2015 until July 2018, the entire duration of Sentinel-2 observations at the time of writing. Three adjacent Sentinel-2 granules (37SBA, 37SCA, 37SDA) cover an area of more than 30,000\acs{km}² (latitudes 36.01°-37.05°N; longitudes 35.67°-39.11°E), as depicted in \autoref{fig:overview}, and ultimately define the spatio-temporal extent of the study area. Based on maps referring to Syria before the start of the civil war, this area covers the entire northern stretch of the Aleppo Governorate, northwestern Raqqa and northern Idlib, in addition to parts of the following Turkish provinces bordering Syria: Hatay, Kilis, Gaziantep and Şanlıurfa.

![Overview of study area with Sentinel-2 relative orbits based on simplified acquisition swaths, showing an approximate orbit overlap in purple. \label{fig:overview}](source/figures/study_area_edit.png)

Data characteristics of the study area based on their collective metadata indicate suitability for optical time-series analyses, primarily due to the low average annual cloud-cover reflected in the Sentinel-2 archive for the area. According to the Köppen-Geiger classification, the climate is mostly warm Mediterranean (Csa) in the western part of the study area transitioning into warm and semi-arid (BSh) towards the east [@peelUpdatedWorldMap2007]. The annual average cloud-cover percentage, extracted from \ac{ESA}’s \ac{L1C} metadata, also decreases from west to east. The majority of scenes acquired from May to October have a cloud-cover percentage below 10%, while otherwise generally ranging between 20% and 40% from October to May. These summary metadata metrics were determined using the Sentinel-2 metadata analysis system developed at \acs{ZGIS}, called EO-Compass [**cite**].


# Data

## Sentinel-2

### Specifications \label{sec:s2_specs}

Copernicus is a European Earth observation programme, previously known as \acs{GMES}. It owns the fleet of Sentinel satellites, which is connected to other sensors called “contribution missions”, and operates downstream services. The Sentinel-2 satellites are equipped with a \acf{MSI} observing 13 spectral bands (443\acs{nm}-2190\acs{nm}). Data is captured with a swath width (i.e. field-of-view) of approximately 290\acs{km}. Spatial resolution ranges from 10-60\acs{m}: three visible bands and one near-infrared band (10\acs{m}); six red-edge/shortwave infrared bands (20\acs{m}); and three atmospheric correction bands (60\acs{m}). The spectral properties of the bands are somewhat similar to Landsat data, but lack thermal bands (\autoref{fig:spectral_bands}).

![Spectral comparison of Landsat 7 and 8 bands with Sentinel-2 (retrieved on 25 April 2018 from <https://landsat.gsfc.nasa.gov/sentinel-2a-launches-our-compliments-our-complements/>) \label{fig:spectral_bands}](source/figures/landsat_sentinel2.png)

Currently two Sentinel-2 satellites, known as Sentinel-2A and -2B, are continuously and systematically collecting observations globally. They were launched on 23 June 2015 and 7 March 2017, respectively. Sentinel-2C and -2D are already planned to extend the longevity of Sentinel-2 observations in the future. Considering observations from Sentinel-2A and -2B together, the nominal average revisit time at full operational capacity is 5 days at the equator, with more frequent data capture towards the poles. Data are processed and provided by \acs{ESA} as \acf{L1C}, which includes radiometric calibration to \ac{ToA} reflectance and geometric corrections (e.g. orthorectification, spatial registration). \ac{L1C} scenes are available as granules (i.e. tiles). These granules each cover an area of approximately 100\acs{km} by 100\acs{km} and contain around 600\acs{MB} of data, including all spectral bands, metadata and some quality indicators automatically generated by \ac{ESA}.


### Data Used

All Sentinel-2 \ac{L1C} data available on the Copernicus Open Access Hub for these three granules are continuously included in the data cube, resulting in a dense time-series beginning 28 June 2015 until the most recent scene. All of the data used were acquired using the download script as part of the automated workflow described in \autoref{sec:acquisition}. Including Sentinel-2 scenes, re-formatted Sentinel-2 data (which are redundant and could be deleted in the future after generating information layers) and the generated information layers, there is approximately 1.6\acs{TB} of data related to this implementation at the time of writing. The vast majority of this volume is comprised of the indexed and ingested data sources, but some data downloaded from the Copernicus Hub (e.g. \ac{ESA} quality information layers) are counted in the 1.6\acs{TB}, but not otherwise used in this implementation.

As of 22 June 2018, 591 Sentinel-2 granule-size scenes are incorporated in the data cube. This results in a range of approximately 127 to 258 observations at different moments in time throughout the study area for the temporal extent of all scenes [^3]. These granules are captured by two Sentinel-2 relative orbits (78 and 121), resulting in temporally denser data where the orbits overlap (*see* \autoref{fig:overview} for an estimation of the orbits). These three Sentinel-2 granules are provided by Copernicus in the same projection (\acs{UTM} zone 37N, \acs{EPSG}:32637), which means that the data do not require re-projection for collective storage or analysis.

[^3]: All of the Sentinel-2 products already indexed in the data cube implementation, whose ingested information layers are used in the showcased proof-of-concept results, are documented in \autoref{tab:s2products}. This table is perhaps considered unnecessary to include, but I think it is important to offer some feeling of how much data, or at least how many Sentinel-2 data products, are actually being handled here.


# Methods

The workflow implemented here focuses on automation and big data, encompassing downloading Sentinel-2 data, re-formatting them, preliminarily classifying them with \acs{SIAM}™ (i.e. generating multiple information layers), indexing Sentinel-2 scenes and information layers into an implementation of the \ac{ODC} and ingesting information layers (\autoref{fig:workflow}). This process runs automatically every day for each of the three study area granules. The result is daily incorporation of the most recently available Sentinel-2 data, ready for analysis, including semantic queries. Queries are facilitated using Jupyter notebooks by accessing the ingested information layers produced by \acs{SIAM}™ via a Python \acs{API} for \ac{ODC} implementations.

![Automated workflow overview from download to queries and indicator extraction, which utilises the Python \acs{API}. Author's illustration. \label{fig:workflow}](source/figures/Workflow_helvetica.png)


## Computing Environment and Tools

Before covering the workflow, it is important to disclose and document what hardware, software and computing environments were used for data acquisition, manipulation, processing, analysis and visualisation.


### Hardware

The hardware used for this implementation is a Red Hat Enterprise Linux 7 virtual machine (if you can call it hardware), with 16 virtual \acp{CPU} at 2.5\acs{GHz} clocking, 31\acs{GB} \ac{RAM} and 3\acs{TB} of generic, all-use storage.


### SIAM™

This implementation incorporates multiple semantic semi-concept granularities generated by the Satellite Image Automatic Mapper™ (\acs{SIAM}™, release 88v7) [@baraldiSatelliteImageAutomatic2018]. This generic semantic enrichment enables semantic queries based on multiple semantic granularities (i.e. number of semi-concepts). Spectral-based image pre-classification, as implemented by \acs{SIAM}™, divides the feature space of a multi-spectral image into semantic semi-concepts using a knowledge-based approach, in contrast to data-driven approaches (e.g. supervised classification) [@baraldiAutomaticSpectralRuleBasedPreliminary2010; @baraldiSatelliteImageAutomatic2011; @baraldiSatelliteImageAutomatic2018]. It could also be called descriptive colour naming, because the resulting semi-categories refer to the spectral information a pixel can offer.

Assuming scenes are calibrated to a minimum of \ac{ToA} reflectance, semi-concepts generated by \acs{SIAM}™ are comparable and transferable between multiple images and optical sensors without any additional user-defined parameterisation (i.e. fully automatic). This is the only software used in the workflow that is closed-source. Refer to \autoref{sec:semantic_enrichment} for a bit more theoretical information behind it.


### Open-Source Software

This implementation had the overarching goal of using as much open-source software and tools as possible. This included working exclusively with Linux, Python, conda and virtual environments, git for versioning, the \ac{ODC}, PostgreSQL, Jupyter notebooks for interactive analysis, \acs{GDAL} for creating a mosaic of tiled analysis output and \acs{QGIS} for any additional, basic calculations, visualisation outside the Jupyter notebooks and cartographic layouts.


#### Linux

The choice to work with Linux was a no-brainer, and a server with Red Hat Enterprise Linux 7 was what was available through the SemEO project. Becoming more proficient in Linux was something that I had wanted to do for a long time, having dealt enough with difficulties using \acs{GDAL}, different Python environments on Windows, and, perhaps much more relevant, long pathnames associated with Sentinel-2 products. The long pathnames of the first Sentinel-2 products (which have since been shortened) are a nightmare on Windows. For these reasons, using Linux makes life easier and plays well together with most open-source software.


#### Python, conda and virtualenv

Three reproducible environments for Python are used in the workflow. The first and third environments described here are managed by conda, an open-source environment and package management system that was originally designed for working with Python, but has since been implemented to accommodate various programming languages on Windows, macOS and Linux [@anacondaincCondaCondaDocumentation2017]. It installs, runs and updates dependencies and packages for a defined version of a programming language based on specific commands or environment definitions. This theoretically makes computing environments using a specific language increasingly reproducible, and allows users to have multiple configured environments at their disposal, depending on the project or purpose. The second environment is implemented using a Python package called *virtualenv* for creating isolated Python environments.

\graffito{Never again hear: "Well, it works on my machine just fine..."}

Searching the Copernicus Open Access Hub and downloading data to processing them with \acs{SIAM}™ occurs in a Python 2.7 conda environment. The environment is equipped with *Scipy* used for resampling the required Sentinel-2 bands with a 20\acs{m} spatial resolution (i.e. bands 11 and 12) to 10\acs{m}. \acf{GDAL} is used for various tasks and the Python package *requests* is used for handling \acs{http} downloads. The complete environment file including dependencies is available at \autoref{lst:aiq27env}.

Indexing and ingesting datasets is conducted using a Python 3.4.5 *virtualenv* virtual environment recommended for \ac{ODC} installations by  @ceosDataCubeInstallation2018. A conda environment could also be used [@geoscienceaustraliaMinicondaRecommendedOpen2017]. The list of the package requirements, according to the command ```pip freeze``` within the existing environment, is available at \autoref{lst:datacubeenv}.

While interactive analysis could occur within the same environment as indexing and ingestion, another was created with conda to avoid any dependency conflicts between the automated workflow and analysis. This environment includes the *datacube*, *jupyter*, *matplotlib*, *Scipy*, *xarray*, *basemap*, *basemap-data-hires* and more for enabling access to data in the \ac{ODC} implementation via the Python \ac{API} and interactive analysis within Jupyter notebooks [@ceos-seoDataCubeNotebooks2017]. The complete environment file including dependencies is available at \autoref{lst:cubeenv2env}.


#### Git

While not of influence to the outcome of project development, the open-source versioning software, *git*, was used to document changes to the code base for the entirety of the project's conception and development. All code relevant to the automated workflow implementation (excluding \ac{ODC} and other software) is public and freely and openly available under <http://github.com/augustinh22/AIQ> in the "thesis" directory.


#### Open Data Cube

This implementation uses the \ac{ODC} version 1.5.1, known as Purpler Unicorn (13 July 2017), with access to data provided by a Python \ac{API}. The \ac{ODC} was chosen because it functions within the data cube paradigm, has been proven to be robust and scalable, and allows for transferable approaches through its open-source license.

The \acf{ODC} is much more than software. It is an international initiative based on software initially developed by \ac{AGDC}, now managed by \ac{CEOS}. The objective is to increase the impact of \ac{EO}, build a community of users, and provide free and open software as a means to store, manage and analyse large volumes of \ac{EO} data by providing an integrated gridded data
analysis environment, including documentation [@ceosCEOSOpenData2017]. \ac{CEOS} is also aligned with overarching international agendas, including the \acp{SDG}, and has a mandate to improve the use of \ac{EO}-derived information.


#### PostgreSQL

The back-end of the \ac{ODC} implementation is PostgreSQL version 9.2.21, an open-source relational database. This version is a bit out-of-date from the version recommended by the \ac{ODC} installation documentation (i.e. 9.5+), but it has seemed to hold up fine. There are multiple back-end solutions that could have been employed, but this one was chosen also for its open-source license.


#### Jupyter notebooks

An open-source server-client Web-application, Jupyter notebooks allow interactive analysis, as well as a means to write, document and share code, visualisations, results, and more. The app is installed on the server where the data cube is located, allowing fairly uncomplicated access from anywhere via the Web. notebooks contain live code blocks that can be run sequentially, or not, depending on user needs. Output from each code block is printed below the block that generated it after execution, so output from analysis can be saved, if desired. Any code run in the Jupyter notebook occurs in the Python 3.4.2 data cube virtual environment. Markdown can also be used within the notebook to document and explain code blocks and results.


#### QGIS

Version 2.18 of the open-source \acs{GIS} software, \ac{QGIS} was used to create cartographic representations of proof-of-concept results generated through interactive analysis in the Jupyter notebooks. Again, this software was chosen due to its open-source license.


## Automated Workflow

Various scripts were developed to automate this workflow. The majority of the following tasks are automated on a daily basis using cron, a job scheduler on Linux, and bash scripts to run the Python scripts in their necessary environments with proper parameters. The majority of necessary scripts developed in the scope of this thesis are located in the appendix (*see* Listings \ref{lst:download}, \ref{lst:conversion}, \ref{lst:batch}, \ref{lst:autodownload}, \ref{lst:prepSIAM}, \ref{lst:indexSIAM}, and \ref{lst:autoODC}), but are also freely, publicly and openly available at: <http://github.com/augustinh22/AIQ>


### Accessing and Acquiring Sentinel-2 data \label{sec:acquisition}

A \ac{CLI} was implemented in Python to allow searching and downloading data from the Copernicus Open Access Hub's \acs{API}, similar to the work of Olivier Hagolle [@hagolleAutomatedDownloadSentinel22018]. It is intended to be used on Windows, Mac or Linux \acs{OS}. The temporal restraints for queries can be determined based on start and end times for data acquisition or ingestion to the hub. Spatial restraints can be set by defining a point, polygon or granule name. The last of those possibilities is facilitated by an in-house \ac{API} at \acs{ZGIS} developed by Martin Sudmanns that returns the centre point of any existing Sentinel-2 granule by name[^4]. If this option is used, only the identified granule is downloaded from any matching results. This is especially important for targeted extraction of specific granules from older, multiple granule products in the archive from before 6 December 2016. Downloaded scenes are automatically unzipped in a designated target directory (in this case, granule-based directories), and any products already located in the target directory are not downloaded again.

[^4]: In the current implementation of the Copernicus Open Access Hub's \acs{API}, using the centre point is the best way to limit results to a given granule rather than using the entire footprint extent of a granule. This is because each granule overlaps neighboring granules by at least 200\acs{m} on each side. Granule specific Sentinel-2 data retrieval at the time of writing is not a feature offered by the Copernicus Open Access Hub.

\graffito{EO-Compass also uses a modified version of this script to harvest Sentinel-2 metadata.}

The structure of products and metadata has seen a few modifications since the first scenes offered to the public in 2015, which requires some more complex handling in the script. Most notably, Sentinel-2 products were served in packages of multiple granules prior to 6 December 2016, with sizes sometimes exceeding 6\acs{GB}. The actual physical file structure has, however, remained mostly the same (*see* \autoref{fig:s2_structure}). In the case of older multiple-granule products, the product name might appear more than once in \autoref{tab:s2products}, but are saved in the appropriate granule-named directory in this implementation (i.e. a product could contain granules 37SBA and 37SCA, so is listed twice, but in each granule-specific directory, the product directory only contains the data extracted for that specific granule).

![The Sentinel-2 product physical format (Source: @europeanspaceagencySentinel2UserHandbook2015 accessed 26 January 2017) \label{fig:s2_structure}](source/figures/s2_structure.png)

For those large package products on the hub prior to 6 December 2016, the file structure is generated and each file related to a specific granule is iteratively extracted and downloaded. This contrasts to granule-specific products offered after 6 December 2016, which can be downloaded in the compressed format provided natively on the hub. It has since been announced that products provided prior to 6 December 2016 will be reprocessed to fit the current "Complete Single Tile" (i.e. single granule) format, but when this re-processing will be completed by the hub for the entire archive before 6 December 2016 is still unknown [@europeanspaceagencyPublication3rdBatch2018].

\graffito{The time to download each scene varies.}

The speed of downloads is highly dependent upon the Copernicus Open Access Hub and variables related to the Internet connection and University network. It can take anywhere from a few minutes to download one scene to upwards of 20 minutes. Based on operation during the month of June 2018, it took around 10 minutes on average per scene.


#### Sentinel-2 Downloader

During the course of this work, some individuals at \acs{ZGIS} expressed interest in a \ac{GUI} for using this download script. The decision was made to implement the script as a \acs{QGIS} plugin with an interface designed using Qt (*see* \autoref{fig:s2_downloader}). The download script used in this thesis was modified to search and download Sentinel-1 and -2 data from multiple hubs, allow manual manipulation of search results from the hub and enable individual granule extraction from older Sentinel-2 product file structures.

![The query user-interface for the \acs{QGIS} plugin to search and download Sentinel-1 and -2 data from multiple hubs. Author's illustration. \label{fig:s2_downloader}](source/figures/sentineldownloader_gui.png)

Any hub that uses a similar \ac{API} and metadata structure as the Copernicus hub can be integrated with relatively low time investment. At the time of writing, the current hubs include: Copernicus Open Access Hub (both \ac{API} access, limited to 100 results, and archive access that the Web interface is based on, limited to downloading 10 results at a time); the Sentinels National Mirror Austria (<https://data.sentinel.zamg.ac.at/>) run by \acs{ZAMG}; and the Hellenic National Sentinel Data Mirror (<https://sentinels.space.noa.gr/>) run by the National Observatory of Athens, Greece.

The intention is to keep improving the code base, adding more hubs, as well as integrating Sentinel-3 searches and downloads. The actual code is not provided here, but it is based on the code in \autoref{lst:download}. The code is, however, freely and openly available at: <https://github.com/augustinh22/SentinelDownloader>


### Formatting data for SIAM™ \label{sec:format_siam}

\graffito{Generate no-data mask, resample, convert to 8-bit and stack.}

Following complete and successful download, the necessary bands from each newly acquired Sentinel-2 scene are automatically re-formatted. \acs{SIAM}™ is sensor independent, but input data format requirements are based on Landsat for high-resolution data. Six bands (blue, green, red, near infrared and two medium infrared bands) are used (i.e. bands 2, 3, 4, 8, 11, 12). Scipy resamples bands 11 and 12 from 20\acs{m} pixels to 10\acs{m}. Sentinel-2's \acs{MSI} does not capture any thermal bands, so a constant is used to ignore thermal decision rules in \acs{SIAM}™. Based on the assumption that pixels with a value of 0 in any of the input bands contain no meaningful data and not a measured value of 0, a no-data mask is generated (*see* \autoref{sec:nodata_mask} for further discussion). Finally, using \acs{GDAL}, the six Sentinel-2 bands of \ac{ToA} reflectance values are converted to an 8-bit range, stacked in ascending order and saved in the \acs{ENVI} data format required as input for \acs{SIAM}™.

\graffito{It takes ~1 minute to re-format one scene.}

Re-formatting each Sentinel-2 scene on the current set-up takes roughly 1 minute. This process is distributed over all cores, so might be faster with different hardware, but evaluating and improving the efficiency and speed is beyond the scope of this thesis.


### SIAM™: generating information layers

A batch script is required to run \acs{SIAM}™ is automatically generated that contains commands to process all newly acquired, re-formatted scenes. Four semi-concept granularities (i.e. 18, 33, 48 and 96 semi-concepts) and four additional information layers are automatically generated. An older example of 61 semi-concepts with broad descriptions and pseudo-colour representation can be seen in \autoref{fig:siam_61} Those semi-concepts on the same line in \autoref{fig:siam_61} stem from the same parent spectral category within the \acs{SIAM}™ decision-tree.

![Semi-concept example with a granularity of 61, sorted in rows by parent category and each represented by a pseudo-colour suitable to the semi-symbolic associated semantics [@baraldiSatelliteImageAutomatic2018] \label{fig:siam_61}](source/figures/siam61.png)

The additional information layers included in the applied example include a:

  (1) binary vegetation mask based on vegetation-related semi-concepts;
  (2) pentanary haze mask, a discretised continuous symbolic variable;
  (3) ratio greenness index, i.e. (\acs{NIR} / red) + (\acs{NIR} / \acs{MIR}1) – (red / \acs{MIR}1) [@baraldiAutomaticSpectralRuleBasedPreliminary2010; @baraldiSatelliteImageAutomatic2018];
  (4) panchromatic brightness image, a linear combination of all multi-spectral input bands.

\graffito{It takes around 5 minutes to process one scene.}

Processing of each Sentinel-2 scene takes roughly 4-5 minutes on the current set-up. \acs{SIAM}™ in its current implementation runs on only one \ac{CPU}, which makes it great to have multiple instances running in parallel. The initial processing of 450 Sentinel-2 scenes in December 2017 was completed within one evening by having 10 different instances run simultaneously. Finding other ways to improve the performance of this software is outside the scope of this thesis.


### ODC: indexing scenes and information layers

Before getting into the specifics of indexing, the complete workflow for working with the \ac{ODC} software can be seen in \autoref{fig:ODC_workflow}. It offers a nice overview of all possible steps necessary to create an instance of a data cube within the \ac{ODC} software.

![Workflow for working with the \acs{ODC}. (Source: <https://datacube-core.readthedocs.io/en/latest/ops/overview.html> accessed on 22 June 2018) \label{fig:ODC_workflow}](source/figures/ODC_workflow.png)

In order to index data, a product description first needs to be defined. Indexing establishes links to externally stored data in a format defined in the product description and is backed by PostgreSQL. Product descriptions identify metadata common to all datasets of that product [@geoscienceaustraliaIndexingDataOpen2017] and only need to be defined once. Both Sentinel-2 data and \acs{SIAM}™ information layers have been defined as products by modifying existing scripts provided by the \ac{ODC} initiative. The product definition for information layers can be seen in \autoref{lst:siamIL}.

Metadata for each Sentinel-2 scene and also for the information layers is necessary for indexing, and is automatically generated for each dataset. This has been implemented for Sentinel-2 and \acs{SIAM}™ generated information layers by modifying existing Python scripts provided by the \ac{ODC} initiative (*see* \autoref{lst:prepSIAM}). This metadata includes spatio-temporal data extents, data format, projection, bands/layers, file paths relative to the metadata, and more. A copy of the source Sentinel-2 dataset’s metadata is included in the information layer metadata to document provenance. Once metadata has been generated, indexing automatically follows using a Python script and the data cube’s \ac{API} (*see* \autoref{lst:indexSIAM}).

\graffito{Metadata generation takes a handful of seconds per scene.}

Based on the initial ingestion of around 450 scenes in January 2018, it took on average 0.66 seconds to generate metadata for each scene, and around 1.5 seconds to index a scene.


### ODC: ingesting information layers

Data that has been indexed can also be ingested, resulting in automated tiling of an indexed product into netCDF files for more efficient access, creating a gridded time-series data cube [@geoscienceaustraliaIngestingDataOpen2017][^5]. The user needs to select a successfully indexed product (e.g. indexed \acs{SIAM}™ information layers), define the ingestion configuration and the \ac{ODC} software takes care of the rest. It automatically creates a new product description, re-projects the data if necessary, tiles them according to the configuration, creates the necessary metadata and indexes them, with automatic checks to avoid duplication. This ingestion command simply needs to be run whenever new data is added to an indexed product that ought to be ingested.

[^5]: It is important to note that the logical view offered to the user is a multi-dimensional data cube regardless of whether or not a product has been indexed or ingested.

In this implementation, automated ingestion of information layers in 100\acs{km}² tiles (10\acs{km} by 10\acs{km} by one time-step) occurs, keeping the original projection (i.e. \acs{UTM} zone 37N, \acs{EPSG}:32637). As of 22 June 2018, 72,672 tiles of ingested information layers had been created based on 591 Sentinel-2 scenes, a total volume of approximately 180\acs{GB} of ingested data. An evaluation of a more efficient tiling scheme is a much larger issue, and is outside the scope of this thesis.

\graffito{It takes around 1 minute to ingest one scene.}

Ingestion takes more computing power and time than indexing, because a bunch of netCDF tiles need to be generated. Based on the ingestion of 450 scenes in January 2018, this process takes around 1 minute per scene.


## Ad-hoc Queries

Querying the data cube occurs using a Python \ac{API}, which I have chosen to access using a Jupyter notebook for interactive generation and manipulation of data cube output.


### ODC: Python API

Once data has been indexed and ingested, they can be accessed using a Python \ac{API} [@geoscienceaustraliaDataAccessAPI2017]. This \ac{API} retrieves data from a given indexed or ingested product for a defined spatio-temporal extent and returns it to the user as a *Dataset* object from the *xarray* Python package. This Python object is a multi-dimensional (generally) in-memory array with dimension names, and is used for further analysis (e.g. in Jupyter notebooks). Indexed data sources can also be accessed using this same Python \ac{API} and with the same commands, but will almost definitely take longer if not save as netCDF files optimised for access (i.e. ingested).

Any queries that might exceed memory ought to be run using the Gridworkflow class of the \ac{API} to access and process data in smaller chunks [@geoscienceaustraliaDatacubeApiGridWorkflow2017]. This may not be desirable or even possible for certain types of queries or processes.


### Jupyter notebook: ad-hoc queries

The Jupyter notebook used to query the cube and produce output is largely based on code blocks that exist in other \ac{ODC} Jupyter notebook examples, freely and openly available from @ceos-seoDataCubeNotebooks2017. See \autoref{fig:jupyter_screen} for a rough idea of what a notebook looks like.

![Screenshot of one of the Jupyter notebooks used, including some of the functions primarily developed by @ceos-seoDataCubeNotebooks2017. This shows the spatio-temporal extent of the data cube in the metadata report, as well as the spatial extent in the small map. Author's illustration. \label{fig:jupyter_screen}](source/figures/jupyter_screenshot.tiff)

Within the notebook, it takes around 90 seconds to connect to the ingested \acs{SIAM}™ information layer product. Following that initial, one-time connection, it all depends on what the user would like to do with the data and information within the data cube in terms of how long processing may take.
