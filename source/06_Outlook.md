\cleardoublepage
\part{Looking Forward}

\cleardoublepage
\pagestyle{scrheadings}
\cleardoublepage
\chapter{Outlook}\label{ch:outlook}

- Outlook/further considerations/prospects – other indicators

- computing power is expensive, both energy efficiency of data centres [@whiteheadAssessingEnvironmentalImpact2014]

- optimising data used for anaylsis, e.g. selecting only relevant Sentinel-2 images and not the whole stack [@kempeneersOptimizingSentinel2Image2017]

# Data

- trend of free and open-access data
- set-backs due to proprietary algorithms in "open" data
- ARD
- better spatial resolutions and more frequent observations

- incorporation of additional cloud masks, such as Fmask [@zhuObjectbasedCloudCloud2012], as long as they work well with Sentinel-2 data, which lacks thermal bands.

- incorporation of other sensors, such as Landsat

It would be fantastic to have automated workflows that provide a generic data cube containing all existing and up-to-date data ready for the analysis of defined indicators, but not limited to that purpose.


*The years have also seen the birth of constellation with tens of micro EO satellites able to capture images of the Earth at an unprecedented pace. One image per day and maybe more is no more a chimera like it was in the early 2000 years. Constellation like Planet and Terra Bella/SkyBox (now merged Planetto Acquire Terra Bella from Google, Sign Multi-Year Data Contract, <https://www.planet.com/pulse/planet-to-acquire-terra-bella-from-google/>)offers HR and VHR data commonly with a business model based on subscription which is exactly focused on monitoring purposes. As shown before in (Adam Van Etter, 2016), there are several efforts in order to exploit data coming from traditional VHR missions like DigitalGlobe ones and new space missions like Planet in order to extract automatically objects.*

- intercalibration of Landsat and Sentinel-2 data for longer-term dynamics

- Cubesats @mccabeFutureEarthObservation2017

- Level-2 Scene classification maps

# Reproducible EO-analysis

transferability

repeatability

- spurious correlation in big earth data analysis -- archive characteristics, etc.

# Data Cubes

# Semantics

# Indicators

- big Earth data and SDGs

-- using semi-concepts in other ways
Many new applications exist or are being envisioned for EO data cubes. These applications range from creating custom mosaics or composites (i.e. most recent cloud free over a user defined time span, seasonal composites), to various time-series analyses. Much research has been invested in looking at the dynamics of water. Surface water is a feature that can be relatively well discerned from other types of land cover, whether using radar or optical data sources.

# Privacy and monitoring

- at least something about spatial resolution, temporal frequency and public vs. private sector
- what is privacy in terms of regular global EO data collection?
- maybe reference other kinds of big spatial data (e.g. Strava)


## Livelihood-related Crisis Indicators \label{sec:livelihood}

Further exploration into indicators for crisis, whether natural disasters or man-made conflicts, is an expanding field of research, including the development of automated methods for pro-longed monitoring of areas. Indicators based on high resolution data have been envisioned for detecting or monitoring burnt villages; informal urban growth; the development or growth of refugee or \ac{IDP} camps (Wang et al. 2015) and their impact on the surrounding environment; changes in activity (e.g. new infrastructures such as roads or air fields); illicit crop establishment and growth (e.g. opium cultivation in Afghanistan); environment degradation; flood assessment or visible changes to water bodies; changes or loss of agricultural areas; deforestation or reforestation; and visible climate change or extreme weather event artefacts.


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


#### Taken from elsewhere...

Lower spatial, but higher temporal and spectral resolution and the larger areas covered require a higher degree of automation in information extraction using automated-prior-knowledge based classification procedures ready for Big Earth Data as well as a shift from "direct" information extraction to indicator approaches

Highly automated large-scale indicator extraction
Combination of prior-knowledge based parameter free classification procedures in combination with automatic change detection methods – aiming for fully automated workflows ready for big data.

With regards to Earth Observation, the “free, full and open data” policy promoted by Copernicus and GEOSS, has enabled the emergence of the “Big Earth Observation Data” era, whereby large volumes of data received each day from different sensors on-board satellites (especially Sentinel and Landsat constellations) can be exploited towards the delivery of timely information in support of decision making and operations for users requiring fast responses. The challenge in the case of this unprecedented opportunity is no longer related to accessing the data but rather to the effective and efficient extraction of the wealth of available information it offers.
- supporting situational awareness for emergency responders and other actors on the ground;
- analysing indirect impacts of global trends such as demographic changes, environmental degradation, climate change, and land issues related to conflicts;
- monitoring the state and vulnerability of natural strategic assets and critical infrastructures as a given crisis develops;

In such a way EO is now providing stacks of observations, providing persistent monitoring over a region (persistent meant as continuing in time with suitable sampling to detect variability patterns); such datasets represent a big challenge in terms of analysis, demanding for the application of automated analytic technologies to derive meaningful information (Big Space Data).

Extracting information from time series is difficult due to the volume, velocity and variety of EO images.

Different sensors, different acquisition times or dates and the variety of characteristics of natural phenomena adds additional complexity.

The development of new methods, which are going beyond traditional change detection, are on its way: Usually change detection is conducted as a pairwise comparison of EO images (Singh 1989, Petitjean et al. (2012), Guyet and Nicolas (2016)). In contrast, long EO image time series analyses – needed for constant monitoring purposes - aim at classifying and analysing the trajectory of radiation at a location on the Earth (Petitjean et al. 2012). Both have in common that they require significant change of detectable radiance values between images that are due to real and actual changes on the Earth’s surface (Singh 1989). In addition, algorithms for big EO data analysis need near full automation to be applicable and usable on the large amount of data sets. Today techniques, methods, and tools, for automated data analysis are often insufficient for the automated analysis and information extraction from big EO data sources, but interesting approaches to tackle processing and new data storage solutions are proposed.

Anyway, the paradigm of object-based image analysis (OBIA) extends the traditional per-pixel based image classification approaches that rely only on the spectral information per single pixel. OBIA enables the incorporation of geometry and expert knowledge on top of traditional spectral values and this allow to improve for example classification by using existing knowledge available for example as OSINT.

One main point is the aspect that current high-resolution sensors “significantly increase the within-class spectral variability and, therefore, decrease the potential accuracy of a purely pixel-based approach to classification” (Blaschke et al., 2014, RD44). This point is even more valid for the task of analyzing large amounts of remotely sensed data incorporating information from a variety of other sources into the analysis which is the case of the study of migration where EO is not the only source of information. This issues can be mitigated by considering time-series as the starting point. In fact, time-series analysis and especially the detection of changes can be very useful as a source of information to be used in spatial analysis models used to detects possible hot spots from EO data especially from SAR time series and VHR time series.

Also HR multi-spectral imagery, particular indexes such as NDVI can be monitored over long time-series (using historical data) in various ways in order to assess food security at scales which can be useful to analyze local or small scale migration phenomena. This information can be added to common large scale reports provided normally by organisations like FAO (e.g. http://www.fao.org/hunger/en/).

Change detection maps of an area of interest can be used to trigger further, more in-depth analysis. A first screening of potential anomalous changes is needed to focus more expensive and time-consuming actions, e.g. analysis with restricted-access data and in-situ monitoring. Based on optical data series, change detection in the scene can be still semi-automatically performed. In this case, robust approaches are needed for the modelling of the disturbance affecting the radiances/reflectances between different acquisition times due to calibration, residual solar contributions, surfaces not fully Lambertian, and geolocation or coregistration errors. Many of these disturbance can be overpassed by considering the new Sentinel-2 mission which guarantees the acquisition over a scene with similar illumination conditions and geometrical line lie of sight.

improve situational awareness as well as regular, temporal monitoring and identification of changes.
Data with lower spatial resolutions can be exploited by moving away from "direct" information extraction towards indicator-based approaches.
