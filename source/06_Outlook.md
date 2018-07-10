\cleardoublepage
\part{Looking Forward}

\cleardoublepage
\pagestyle{scrheadings}
\cleardoublepage
\chapter{Outlook}\label{ch:outlook}

In the course of working on this thesis, many more questions were generated than could possibly be considered, explored or answered. If nothing else, the largest gift of having worked on this topic, beyond improving scripting skills, was waking a curiosity and interest about the distribution, variation, variability and uncertainty in multi-temporal \ac{EO} analysis and archives that cover relatively large spatial extents. In the era of big Earth data, it is increasingly important to have meaningful, comprehensive and standardised methods to characterise uneven distribution, uncertainty and variability and variation in data quality and spatio-temporal coverage for different \ac{EO} data sources and archives. Certain types of analysis and algorithms are not transferable to different geographic areas, sensors, moments in time, seasons, etc. This curiosity will likely shape any future work that I do, even if it is not the main focus.


# Data and Analysis

The trend towards more free and open data has been steadily getting stronger. Methods exist for intercalibrating Sentinel-2 and Landsat data [@liIntercalibrationDMSPOLS2017], which may also expand possibilities for analysis over longer temporal extents and assessing relatively slower processes and trajectories. The challenges for using two different data sources with similar but not identical sensors will produce different levels of uncertainty, and different distributions of acquisitions through time that analysis is based on. These differences are only masked by proprietary algorithms that obscure what kinds of pre-processing have been conducted, and how that may differ through space and time based on the availability of auxiliary data or changes to processing baselines over time.

It will be interesting to see if a standardised baseline definition of \ac{ARD} is developed in the months or years to come. The concept of \ac{ARD} (*see* \autoref{sec:ARD}) is relevant in the context of this thesis, since a data cube is provided allowing access to data with user-defined extents and generic semantic enrichment suitable for multiple kinds of analysis using semantic queries. Depending on how \ac{ARD} is defined, the created \ac{ODC} implementation could be considered as analysis-ready. Semi-concepts provide an automated semi-semantic layer that under current circumstances, could be considered as moving towards semantically enriched \ac{ARD}.

We are likely to see finer spatial resolutions and more frequent observations, even if the data is not free and open (e.g. cubesats [@mccabeFutureEarthObservation2017]), which will open completely new possibilities. This influx of even more frequent, high- to very-high-resolution data will not solve most of the problems faced by \ac{EO} researchers, though. That challenge is still largely framed in turning data into meaningful information in an automated way so that this data deluge can be utilised rather than just stored somewhere.

Object-based image analysis may be one set of methods to turn higher-resolution images into meaningful information when paired with semantics. As seen in the output generated in {ch:proof}, recognisable structures are very clearly visible, but cannot be utilised in a machine-readable way in the current implementation. Incorporating some form of iterative, reproducible segmentation to output, or coding characteristics of the neighbourhood around a pixel into an array as an additional information layer, would allow for contextual, spatial information to be utilised (e.g. neighborhood, shape, size, texture). This would could be a step further in the direction of automated detection of specific land cover classes, where shape and context are important for making the distinction between some natural and human-made features. For example, methods could be developed to automatically detect and discern a certain definition of forest-like objects (as seen in (b) and (c) in \autoref{fig:3yr_veg_water_norm_close1}) from what are clearly agricultural fields in \autoref{fig:3yr_veg_norm_close1}).

Incorporation of additional cloud and cloud-shadow algorithms (e.g. Fmask [@zhuObjectbasedCloudCloud2012]) could be considered to include in an implementation like the one presented in this thesis. However, if Sentinel-2 is the main data source, a lack of thermal bands will continue to make this task a challenging one.


# Energy Consumption

There has been very little consideration concerning the computing power required for storage, handling and analysis of big Earth data, and where the energy comes to support such work. Some algorithms are considerably more computationally expensive, and the energy efficiency of different data centres is something that also is not taken into account [@whiteheadAssessingEnvironmentalImpact2014]. It is important to keep in mind that even if analysis is automated, happening in the cloud, on servers located somewhere else, that it is still consuming energy on infrastructure taking up physical space somewhere in the world. Clouds are very much of this world. If the hope is to generate information to support initiatives such as the \acp{SDG}, looking more closely into the sustainability of various methods makes even more sense, perhaps even as a sort of metric to compare processes and algorithms that produce similar output.

Another possibility is to not get lost in an ocean of data, but rather to optimise data used for a given analysis by selecting only relevant Sentinel-2 images and not the whole stack [@kempeneersOptimizingSentinel2Image2017] -- perhaps some information is lost, but perhaps the trade-off for reduced computation time and resources is worth it, especially if the methods for choosing data can be documented and reproduced.


# Reproducible EO-analysis

Some concepts of reproducibility were mentioned in \autoref{sec:reproducibility}, but how they specifically apply to \ac{EO}, especially in the era of big Earth data, is an area of continued research. Hopefully we will see in increase in reproducible computing environments used to access and process data. This will hopefully include not just language-spcecific virutal environments, but reproducible, containerised environments including all dependencies, such as Docker containers.

Not everyone that works with \ac{EO} data has the chops to configure reproducible computing environments, or work exclusively with open-source software, which sometimes requires users to be a bit more tech-savy by not hiding all functionality behind some sort of \ac{GUI}. However, everyone can produce better documentation. Initiatives such as Zenodo and \ac{OSF} are providing free and open online frameworks and tools to better document the entire research process, including conception, collaboration, coding, documentation, communication of results and publications with long(er)-term storage with persistent links. I have never been one to keep a journal, but getting into the habit of documenting what you do thoroughly and consistently in a public forum is a good habit for anyone to develop, especially in the service of improving the reproducibility of the methods and results you produce.


# Data Cubes

I am convinced that data cubes are going to increase in use in years to come. Bringing new people to using them in data storage, access and analysis will lead to innovation in methods and more. Currently data cubes are defined as massive multi-dimensional gridded arrays. What could happen if we moved beyond the restricting confines of pixels or regular grids? What could objects look like in a data cube implementation?


# Privacy and monitoring

What does privacy look like in the context of regular, constant, global \ac{EO} data collection?

How has the legal and policy world been dealing with issues surrounding optical \ac{EO} data with increasing spatial resolution and temporal frequency?

Is there a code of ethics or conduct that exists for the use of free and open \ac{EO} data and the information derived from it? (Probably not, but would one make sense?)


# Livelihood-related Crisis Indicators \label{sec:livelihood}

The broad framing of the proof-of-concept examples was situated in the context of the \acp{SDG}. However, the scope of the \acp{SDG} may officially only reach until 2030, but the larger drive is longer-term. Due to the relatively high-frequency of acquisitions in comparison to what was available in the past, many new applications exist or are being envisioned for \ac{EO} data cubes. One of these is related to situational awareness and providing more immediate information for livelihood-related crisis indicators, whether related to natural disasters or man-made conflicts. \ac{EO} data is not only useful for monitoring longer-term international goals, but also for generating spatially-explicit evidence to better assessing the impact of events producing more rapid change, such as flooding, deforestation, wildfires, damage to irrigation infrastructure in the dry season, etc.

A struggle with this line of research is that "crisis" is a very subjective, yet sometimes very tangible concept or state of being. The concept of "crisis" is related to what is being affected, who or what it impacts and who or what the actors are. People can speak of an "immigration crisis", but what does that mean? And if it means closing borders and keep those people who have left their homes to wait at the border of another country in a potentially longer-term state of crisis, I am not sure it matters what it means.

Focusing on livelihood frames the very ambiguous concept of crisis in, perhaps, more tangible terms. The concept of "crisis" has a longer history connect to emergency management, but these are usually state-sponsored services with links to the military industrial complex. Free and open \ac{EO} data have offered a potential source of information that was previously limited to state and military actors.

Free and open \ac{EO} data are a reliable and objective global data source that can also serve humanitarian organisations and initiatives in moments of emergency or crisis, however defined. A handful of research with the purpose of developing what are known as *crisis indicators* exists, utilising \ac{EO}-based information. Connecting detectible changes in land cover or land use as being caused or related to a defined crisis requires a lot of inference, and additional data sources and knowledge for validation, which may not be available at the time of analysis due to limitations and restrictions to data collection, access, etc. associated with the identified crisis. In this sense, an implementation like the one presented in this thesis might be useful, but could also generate information that is misleading in moments where reliable information is absolutely necessary. Further research is necessary to assess what kinds of indicators and information are most useful to humanitarian organisations, including the level of reliability is acceptable and that can be offered.


# Further Research Questions

*What are some ways or methods that output from such a data cube implementation produced over large areas using dense \ac{EO} time-series can be validated, or better tested for agreement?*

*What are some existing measures of spatio-temporal confidence for \ac{EO} analysis over dense time-series with big geospatial extents?*

*What are existing methods that take into account the spatio-temporal complexity and variability in \ac{EO} analysis, but more importantly, interpretation, based on the Vs of big data?*[^7]

[^7]: For example, some methods do exist for looking at spatio-temporal accuracy (<https://www.sciencedirect.com/science/article/pii/S0303243415000975#fig0015>), but they still require producing a map for each time-step, which, in the case of big \acs{EO} could mean hundreds, if not thousands of scenes -- a task that ought not be done manually.

*Is aggregated time-series output from different years or seasons comparable?*

*How could comparability be established, quantified, characterised or explored?*

*What spatio-temporal methods exist that could offer a way to test the statistical significance of changes or differences based on an aggregated time-series of scenes, like those generated for Afrin?*

*Is big data too big for traditional statistical measures to have meaning?*

*What semi-concepts are particularly semantically ambiguous even if they look alike?*

*What influence does this have on different semantic queries based on semi-concepts?*

*What information, rule-sets, or knowledge would be necessary to remove at least some of this semantic ambiguity?*
