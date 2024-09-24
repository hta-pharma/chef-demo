# Example repository for ramnog

This repository contains a minimum working example for the use of the ramnog suite for creating amnog-like statistical analysis.

## Using this repository
To use the ramnog suite it needs to be setup and installed. Because the package also needs some data, there is an additional step involved to download cdisc data from the cdisc pilot data.

## Step through the process
You can step through the setup process by checking out different git branches
This is the order you should go with:
1. prereq - the program prereq/get_data.R will fetch the required data for the example.
2. install - the program prereq/install.R will install the ramnog suite of packages.
3. setup - the program setup.R will setup a pipeline in chef (targets).
4. post-setup - shows the files as you will have them after running the setup script.
5. data-function - shows updates to the data function R/mk_adam_scaffold.R and package file R/packages.R
6. endpoint-function - shows updates to the endpoint definition function R/mk_endpoint_def.R
7. main - all the updates together so you can play around with a working example.
