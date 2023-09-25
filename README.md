# GgSANDnet

[![DOI](https://zenodo.org/badge/448891878.svg)](https://zenodo.org/badge/latestdoi/448891878)

GgSANDnet: A neural network tool for prediction of shear stiffness (G) shear strain (g) relationship for sands

J A Charles, University of Southampton, j.a.charles@southampton.ac.uk, https://orcid.org/0000-0002-2256-3846

This app uses a neural network to generate a shear stiffness degradation curve (representing how soil reduces in stiffness as a function of strain) with an arbitrary number and combination of input parameters. Traditional empirical methods required set inputs with the engineer being unable to utilise these methods if the required parameters are not available. This app allows the user to select and input between zero and eight of the following parameters:

Mean Effective Stress (p)
Mean Effective Stress/Reference Atmospheric Stress (p/pa)
Overconsolidation Ratio (OCR)
Void Ratio (e)
Relative Density (Dr)
Average Grain Size (D50)
Uniformity Coefficient (Cu)
Initial Elastic Shear Modulus (G0)

Users are able to load a training dataset containing the above parameters, along with stiffness and strain data. Pre-processing functionality allows users to filter this data by upper and lower bounds for each parameter. A suitable dataset has been provided in this repository. Alternatively, users can provide and load their own data.

After the dataset is loaded and filtered and the available parameters have been selected, a neural network will be trained and an output curve of a specified resolution will be generated. The output curve can be copied to the clipboard for pasting into e.g., Excel, FEA software etc.

This app requires MATLAB and the MATLAB Deep Learning Toolbox.

The following files are included:
Shear Stiffness Curve Generator.mlappinstall - This file is a MATLAB app installer. It can be double clicked to install the app within MATLAB. The installed app will appear in the Apps tab in the ribbon menu. This stand-alone binary installer contains all relevant code and data to use the app.
src/GgSANDnet.m - This file contains the MATLAB application source code. This file can be run to open the application. Source code can be edited by the user.
StiffnessNNAppData.mat - This file contains a training dataset. This dataset is available as a stand-alone citable object at https://doi.org/10.5258/SOTON/D2101. Alternatively, users can provide and load their own data.

This work forms part of the activities of the Centre of Excellence for Intelligent & Resilient Ocean Engineering (https://www.southampton.ac.uk/iroe).
