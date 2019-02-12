### Data and replication information for "Trump-ing Foreign Affairs: Status Threat and Foreign Policy Preferences on the Right"
**By Rachel Blum and Chris Parker**
***Perspectives on Politics*, 2019**

### Overview
These analyses use two datasets: the 2016 American National Elections Study (publicly available), and the 2016 State Convention Delegates study (replication version available). Recoding, table, and regressions for the ANES, as well as tables and regressions for the SCDS were done in Stata. Recoding for the SCDS and all figures were done in R. If the user wishes to recreate the figures, they need only use the figure code files in R (the proportions and estimates used to create the figures are provided locally in those files). The files here produce all models, figures, and tables that are used in the paper as well as in the appendix.

### A. DATA SETS

1. **2016 [American National Elections Study]** (https://doi.org/10.3886/ICPSR36824.v2)
2. **2016 State Convention Delegates Study (SCDS)**
      - [Replication file](SCDS_Analysis/BlumParker_SCDS_Subset.dta)
      - [Full codebook](SCDS_Analysis/BlumParker_SCDS_Codebook.pdf)

### B. SOFTWARE

1. **Stata:** 
     - Recoding of ANES variables, 
     - All cross tabulations,
     - All regression models.
2. **R:**
     - Recoding of SCDS variables,
     - All figures.

### C. FILE INVENTORY

1. **For analysis of the ANES and creation of all ANES tables:**
     - For variable coding, descriptive statistics, and regressions: [Stata do-file](ANES_Analysis/BlumParker_ANES.do) and [Stata log file](ANES_Analysis/BlumParker_ANES_LOG.smcl) 
2. **For all ANES figures:** 
     - This [file](ANES_Analysis/BlumParker_ANES_Figures.R) contains code and necessary output from the ANES and Stata analyses. 
3. **For analysis of the 2016 SCDS and all SCDS tables:**
     - For description of variable coding to produce replication dataset: [R code file] (SCDS_Analysis/BlumParker_SCDS.R) and [R log file](SCDS_Analysis/BlumParker_SCDS_Log.txt) 
     - For descriptive statistics and regressions from replication dataset: [Stata do-file](SCDS_Analysis/BlumParker_SCDS.do) and [Stata log file](ANES_Analysis/BlumParker_SCDS_Log.smcl) 
4. **For all SCDS figures:**
     - This [file](SCDS_Analysis/BlumParker_SCDS_Figures.R) contains code and necessary output from the ANES and Stata analyses.  
