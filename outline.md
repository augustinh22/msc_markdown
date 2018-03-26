# Humanitarian crisis indicators utilizing free and open-access EO-data: _a literature review and applied use-case in Syria based on Sentinel-2 data (working title)_
Utilising free and open-access EO-data for generating spatially-explicit evidence of humanitarian crisis: applied use-case in Syria based on Sentinel-2 data



Estimated completion date (May 2018)

## Abstract
Areas exposed to humanitarian crisis (e.g. armed conflict, natural disaster, climate change) generally lack up-to-date, accessible data due to a variety of barriers (e.g. security, politics, biased providers). Free and open-access Earth observation (EO) data are being increasingly generated with global coverage at higher spatial and temporal resolutions than ever before. High spatial resolution (5-30m) imagery enables monitoring of large-scale areas beneficial for crisis monitoring -- indicator extraction is necessary because the spatial resolution does not allow direct measurements of most objects on Earth (i.e. mixed pixels). Improved situation assessment of areas experiencing humanitarian crisis may be achieved by developing suitable indicators of livelihood stability, migration pressures and more. Due to the global and relatively objective nature of EO-data, they are ideal candidates for use in crisis indicators, combined or integrated with additional non-EO-data sources.  For example, night-time light EO-data integrated with the Joint Research Center’s Global Human Settlement Layer (GHSL) was used to estimate the size and location of the affected population in Syria. Such crisis indicators are envisioned to provide evidence-based knowledge to support crisis monitoring and impact assessment, but very few have been developed, applied and validated to date.
This study provides a comprehensive literature review of existing and envisioned humanitarian crisis indicators utilizing EO-data with a focus on solutions concerned with livelihood security (e.g. changes in agricultural areas, droughts, floods, power shortages) and integrated or combined with at least one non-EO data source. Emphasis is given to crisis indicators that monitor larger-scale areas, apply semi-automated to fully-automated workflows and utilize Sentinel-1/2/3 data. The European Space Agency’s (ESA) Sentinel missions are relatively new and have higher spatial- and temporal-resolutions than other existing free and open-access sensors of comparable specifications. The aim is to provide an overview of the current state of development of EO-based humanitarian crisis indicators, and to distill knowledge about the contributions high resolution multi-spectral images (e.g. Sentinel-2) may offer.
The on-going humanitarian crisis in Syria, a country with low annual cloud cover percentages beneficial for surface analysis using multi-spectral data, serves as the location for applying one humanitarian crisis indicator: detected change or loss of irrigated agricultural land over time as a suggested indicator for instability. Challenges for analysis are posed not only by the identification of significant crisis indicators, requiring a combination of deductive and inductive methods, but also by the development of large-scale, automated (repeatable and reliable) methods for extracting indicators from relatively unwieldy big EO data. Analysis is applied along the entire Western and Northern borders of Syria, utilizing Sentinel-2 data, with a focus on the automation of information extraction and integration of derived information with at least one additional data source in a semi-automatic workflow.

__Keywords: big Earth data, remote sensing, crisis indicators, livelihood security__

## Proposed Outline [60-100 pages]

0. Before Text
- Cover Page
- Declaration/Plagiarism statement
- Abstract + keywords
- Table of Contents, List of Figures, List of Tables, Listings
- Abbreviations/Glossary/Acronyms

1. Introduction
- context/background
- definition of terms (e.g. indicator, livelihood)
- general objectives
- case-study area(s)
	- research questions
- structure of thesis (? even if common, probably unnecessary)

2. Theoretical Framework for Indicator Development and Literature Review
	- EO data and the need for indicators (data resolution, temporal vs. spatial…)
- how are integrated spatial indicators developed (framework: orientors, sub-indicators, indicators…)
- how can livelihood be addressed from an indicator perspective…
- some non-EO livelihood security indicators (existing or envisioned in literature)
- literature review of existing EO-based indicators
- brief overview
- existing indicators (e.g. nighttime data and GHSL for estimating affected people)
- focus on open data, especially Sentinel 1-3
- summary
- combination of results from literature review and further suggested, possible livelihood indicators using EO-data based on discussions/interviews

3. Exploration of one indicator (applied example)
	- background/context for selected indicator
	- study area(s)
	- data
- Sentinel-2 EO-data
- specifications (launch date, bands, resolution, etc.)
- data access (scripts, annex)
- reference to metadata: at least filenames, UUIDs, and access date (annex)
- additional data source(s) used incl. some metadata in annex
Irrigated Areas (GMIA or Irrmap)
Syria Refugee Sites (https://data.humdata.org/dataset/syria-refugee-sites)
Precipitation or drought data
… ?
- Methods
- overview of workflow, covering what was programmed by author
- focus on automation and big data
- development of specific indicator
- IQ (selection of images for analysis using dense
- data pre-processing (scripts, annex) – big EO data
	- scalable
- automatic knowledge based spectral categorization
- theory
- exemplarily shown with SIAM(TM)
- output incl. batch script for launch (scripts, annex)
- … (whatever next steps depending on additional data integration and change detection methods, perhaps using IQ)
- method of validation/agreement -- random samples and an external dataset

4. Results
- maps and charts with a few describing sentences each
- validation results using EO/non-EO sources (FAO food security services, statistics from Syria…)

5. Discussion
- interpretation of results
- discussion of methods (incl. challenges, successes, reconsiderations and shortcomings)

6. Outlook/further considerations/prospects – other indicators

7. Conclusion – absolute distillation of achievements

8. After Text
- Acknowledgements
- References (APA style)
- Appendix: list of images from hub used in data cube with limited metadata
- Appendix: Code
- License Information for Code (open source/creative commons)
