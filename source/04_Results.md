\cleardoublepage
\pagestyle{scrheadings}
\cleardoublepage
\chapter{Results}\label{ch:results}

The main result of this work is a continuously up-to-date semantically enriched data cube implementation for north-western Syria. This cube may continue to be used for research of individual observations in time, monthly or seasonal analysis, up to the entire temporal extent of the growing data cube for the entire geospatial extent.

In order to demonstrate its potential utility, a few proof-of-concept demonstrations of automated information extraction about water and vegetation extent and dynamics over time are provided. Each of these queries is also accompanied by a few additional layers to better provide insight about the quality of the result, and to aid in their interpretation. Such aggregated results produced from big Earth data currently have few methods or metrics available to assess quality for meaningful interpretation. This kind of automated information extraction may be relevant to \ac{SDG} targets 2.4, 6.6 and 15.1  (*see* \autoref{sec:framing}), which is the main focus here, but also for indicators for \acs{DRR} or livelihood security (*see* **Discussion section**).

# Maps

- display and describe

- include all 4 maps (index of persistence, total clean, total valid, number of invalid)

\autoref{fig:water_old} demonstrates a similar method applied to the semantic data cube implemented here, but using water-like semi-concepts from SIAM™ instead of the Australian water detection algorithm (i.e. Water Observation from Space). Here, pixels masked as no-data as well as cloud-like and unclassified semi-concepts have been excluded from analysis such that only pixels deemed clear observations are included and considered valid. It shows the normalised percentage of water semi-concept pixels related to other valid semi-concepts (e.g. vegetation-like) from January 31, 2016 to January 31, 2018, which is from a total of 103 observations along the dimension of time.

![Normalised water detection based on water semi-concepts in Syria near the border of Turkey, excluding no-data, cloud like and unclassified pixels from January 31, 2016 until January 31, 2018 (103 time observations). Method similar to Mueller et al. (2016). \label{fig:water_old}](source/figures/water_edit.png)


# Checking plausibility

- (FAO food security services, statistics from Syria…)

https://ipad.fas.usda.gov/highlights/2018/05/syria/index.pdf (https://ipad.fas.usda.gov/) [@USDAFASInternational]

- Irrigated Areas (GMIA or Irrmap)
- Syria Refugee Sites (<https://data.humdata.org/dataset/syria-refugee-sites>)
- Precipitation or drought data
- mention acquisition/ingestion, etc. or reference below

- INFORM, Index of Risk Management database
- HDX, humanitarian data exchange <https://data.hdx.rwlabs.org>
- Relief web
- ACLED
- GDELT
