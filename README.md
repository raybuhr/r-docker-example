# r-docker-example

small exampe for using Docker to execute a R script

## Why?

I wanted to have a public place to emulate building a Rscript into a Docker container to serve as an easily accessible example.

Docker makes it easy to deploy R code to _"production"_ environments. Essentially, everything the R code depends on is declared in the Dockerfile.
This way the system running the Docker container doesn't need to install any dependencies (libraries) that conflict with other programs running on the system. 
Everything is _containerized_. This also means there is no excuse for not using R to handle production work if you already have working code.

## How?

The repo has two R scripts, *get_twitter_logo.R* and *install_libraries.R*.

- `install_libraries.R` literally just installs the libraries being used in the R script that does the work
- `get_twitter_logo.R` is a trivial and arbitrary example using the Twitter REST API to retrieve the profile_image_url and profile_background_image_url of a given user

    - _Note:_ I use environment variables to store the Twitter API credentials. To do this, I used a `.Renviron` file stored in this project directory (repo, folder). I added `.Renviron` to the `.gitignore` file in this repo so that hooligans won't abuse my API account. You should probably also do that.


