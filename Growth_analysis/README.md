
#Hvo_hstA_growth.Rmd
Visualisation and analysis of growth data for the parent strain (also known as WT, Hv28, or pyrE) and the mutant strain (also known as KO, Hv253, or hstA) collected from a Bioscreen plate-reader, in rich media (YPC-18)  under ideal conditions.
Visualisation of the raw growth curves (semi-log) for all replicates, as well as analysis using grofit R package,to find area under the curve  (taking log of OD).
Input data: TableS1-growth.xlsx (Table S1 of the paper, also uploaded here)

Library dependencies:
reshape2_1.4.4
readxl_1.3.1
openxlsx_4.2.4 
grofit_1.1.1-1
ggsignif_0.6.3
forcats_0.5.1
ggplot2_3.3.5

Generates Fig 1 and S1A of the paper

#Hvo_hstA_growth_salt-Final.Rmd
Visualisation and analysis of growth data for the parent strain (also known as WT, Hv28, or pyrE) and the mutant strain (also known as KO, Hv253, or hstA) collected from a Bioscreen plate-reader, in rich media (YPC-18)  under increased (YPC-H, 4M NaCl) or reduced (YPC-L, 1.5M NaCl) salt conditions.
Same analysis and visualisation as above. Generates Fig S1B,C of the paper. Input data: Selectedbscr_data.xlsx

#Hvo_hstA_growth_peroxide-Final.Rmd
Visualisation and analysis of growth data for the parent strain (also known as WT, Hv28, or pyrE) and the mutant strain (also known as KO, Hv253, or hstA) collected from a Bioscreen plate-reader, in rich media (YPC-18)  with oxidative stress condition (0.5mM H2O2).
Same analysis and visualisation as above. Generates Fig S1D of the paper. Input data: Peroxide_hstA_J21_growth.xlsx

#Hvo_hstA_growth_HvCa-Final.Rmd
Visualisation and analysis of growth data for the parent strain (also known as WT, Hv28, or pyrE) and the mutant strain (also known as KO, Hv253, or hstA) collected from a Bioscreen plate-reader, in gluconeogenic (HvCa) media.
Same analysis and visualisation as above. Generated Fig S1E of the paper. Input data: HvCa_hstA_J21_growth.xlsx

Mg_flasks_lineplots.RmdVisualisation of growth data for the parent strain (also known as WT, Hv28, or pyrE) and the mutant strain (also known as KO, Hv253, or hstA) collected from a manual observations of OD600 data for cells grown in flasks, in rich media (YPC-18)  with increased (YPC-MgH, 0.48M Mg) or reduced (YPC-MgL, 0.18M Mg) magnesium conditions.
No grofit/other analysis. Generated Fig S1F of the paper. Input data: Mgflask_Rinput.xlsx

