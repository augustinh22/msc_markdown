# Introduction

- Motivation?

## Context/Background (1 page)

- big data and big earth data
- free and open-access EO data
- trends towards utilisation to support international initiatives (SDGs)
- indicators of humanitarian crisis or generation of spatially-explicit evidence of humanitarian crisis



Earth Observation (EO) satellites capture data covering the entirety of Earth’s surface using a multitude of sensors with differing spatial resolutions and re-visit frequencies. This data is often termed big Earth data. EO data offers a solution for large-scale, multi-temporal and persistent monitoring, especially of interest for areas that are otherwise difficult to reach (e.g. war zones). Various remote-sensing satellites with differing capabilities can offer data that can be turned into meaningful information for improving preparedness and response to migration. The sheer amount of data is rapidly increasing and demands a higher degree of automation for information extraction (e.g. automated-prior-knowledge based or machine learning classification procedures), especially when conducting analysis over large-scale areas or long, dense time-series.

Freely available, open-access EO data include sources from radar, multi-spectral instruments and other instruments. Some options include the Sentinel satellite fleet from the European Space Agency (ESA), the Landsat program, co-managed by the United States Geological Survey (USGS) and National Aeronautics and Space Administration (NASA) and the Joint Polar Satellite System (JPSS) from NASA and the National Oceanic and Atmospheric Administration (NOAA). The JPSS includes the Visible Infrared Imaging Radiometer Suite (VIIRS), meant to replace the Moderate Resolution Imaging Spectroradiometer (MODIS) and Advanced Very High Resolution Radiometer (AVHRR) sensors for tasks such as night-time light analysis, active fire detection and climate change monitoring. These data are accessible to the general public, often via online archives (e.g.Sentinels Scientific Data Hub, USGS Landsat archive).

High resolution optical imagery includes contributions from both the Sentinel and Landsat satellites. Sentinel’s multi-spectral satellites, 2A and 2B, run as part of the Copernicus programme (formerly known as GMES) led by the European Union (EU), together at full operational capacity have a revisit time of 5 days over equatorial areas and a relatively high spatial resolution (10-60m) with 13 spectral bands. Offering data already calibrated to top of atmosphere (TOA) reflectance, with a collective total of around one TB of data daily, the Sentinel-2 satellites are predominantly used to monitor water cover, vegetation, coastal areas, soils,natural disasters and other features of interest for land services. Landsat5/7/8 are other multi-spectral instruments with relatively lower spatial resolutions, less frequent re-visit times and without pre-processed TOA reflectance, that can be exploited in similar ways, especially where historical data are relevant for comparison.

Commercial satellite data has a clear focus on very high resolution (VHR) optical data, meaning generally a spatial resolution of less than 1m to about 4m.Examples include QuickBird from DigitalGlobe, IKONOS, WorldView, GeoEye, Kompsat, Formosat, Pleiades and SPOT.

Possibilities for remotely sensed Earth observation (EO) data analysis were drastically expanded with the launch of the Landsat programme in 1972, and again by offering free and open public access to the archive in 2008 (Wulder et al., 2012). The launching of the Sentinel fleet by the Copernicus programme starting in 2014 has further increased the spatial resolution and temporal frequency of free and open EO data for analysis with a promise of continued observation for many years to come (Drusch et al., 2012). We are currently witnessing a shift towards an alternative approach for storage and analysis using multi-dimensional data cubes for massive, gridded data (Baumann, 2017), bringing users to data, rather than data to users. Google Earth Engine is another approach that is also bringing users to data. This enables access to massive geo-spatio-temporal data ready for analysis. Even in the isolated case of Sentinel-2, automated workflows are necessary to handle approximately 3.4TB of data captured every day (ESA, 2017), not to mention fusion with other similar sensors (e.g. Landsat) or integration with different datasets (e.g. radar, digital elevation models, socio-economic data).

Due to the consistent global coverage of free and open EO data, independent of political borders, they are ideal sources of evidence for generating useful information products to support decision-makers. This is especially the case when combined or integrated with additional data sources, EO or otherwise. For example, night-time light EO data integrated with the Joint Research Centre’s Global Human Settlement Layer (GHSL) and disaggregated population data were used to assess the humanitarian impact of the Syrian conflict (Corbane et al., 2016).

Indicator extraction from EO data is often necessary because the spatial resolution and acquisition frequency of EO data do not allow direct measurements of many objects or events on Earth (i.e. mixed pixels or relatively slow events). In the case of optical EO data, objects cannot be measured directly at all (e.g. pixels with similar reflectance values can represent different objects, surfaces, etc.). Non-physical entities (e.g. political boundaries) also cannot be directly measured. EO-based indicators can complement indicators or reports from other in-situ sources. Possibilities for extraction of EO-based indicators are much more diverse with initial, generic semantic enrichment, e.g. automatic spectral categorisation (i.e. preliminary classification) into classes equal or inferior to land cover classes. Image understanding in the context of remote sensing is envisioned by the authors to include automated land cover classification, whereby pre-classification would be a first step (Baraldi & Boschetti, 2012). Increased inclusion of such semantics transforms EO images into meaningful information in an automated way and allows model queries through time for a plethora of target indicators within a data cube model.

Current setups of reproducible research for EO data cubes require significant time and financial investment and are limited to larger institutions, but this might change once appropriate technological development status is reached. The importance of reproducible, transferable, interoperable, automated and repeatable workflows to process, handle and analyse massive EO data is becoming more apparent in a now data-rich world. With so much big data, it makes sense to avoid application-specific data (pre-)processing, which contradicts many big data principles. At the time of writing, three national-level Open Data Cube (ODC) implementations are operational, seven are in-development and twenty-nine are under review. The Committee on Earth Observation Satellites (CEOS) has set a goal of twenty operational national-scale data cubes by 2022 (ODC, 2017). One notable example is a framework for live monitoring of the Earth’s surface (LiMES) proposed by Giuliani, Dao, et al., (2017) who are involved with the Swiss Data Cube (SDC) (Giuliani et al., 2017). The SDC is one of the operational national-level ODC implementations (Lewis et al., 2017). LiMES identified one of their main challenges in building a framework to be turning data into understandable information products.

The semantic EO data cube presented in this study suggests a fully automated framework towards storing not only data, but preliminary classification as building blocks for semantic analyses allowing information production. This contribution is an example of an automated, reproducible framework for handling and analysing massive EO data, and demonstrates the benefits of automated, knowledge-based semantic enrichment for environmental change detection and EO-based indicator extraction for differing thematic domains.

## General Objectives

- knowledge of existing indicators that utilise EO-data
- develop and apply a highly automated, scalable workflow
- familiarity with data cube technologies
- semi-automated indicator extraction

## Use-Case Selection

- Northern Syria
- Justification for choice (Syrian conflict, weather/climate, Sentinel-2 data projection + overlap of swaths)
- After-the-fact Turkish attack on/invasion of Afrin, Syria
- Mention previous study with Landsat data

## Research Questions

The following body of work aims towards answering the following:

What indicators exist in the realm of humanitarian-related monitoring or detection?

Are semi-concepts sufficient for semi-automated monitoring in a humanitarian domain, where time is of the essence and sample-based algorithms applicability to various climates/ geographic locations might be limited?
