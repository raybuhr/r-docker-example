# start with the official R project base image
FROM r-base:latest

# copy this github repo into the Docker image and set as the working directory
COPY . /usr/local/src/myscripts
WORKDIR /usr/local/src/myscripts

# Install the C/C++ libraries needed to run the script
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev

# Install the R libraries needed to run the scripts
RUN /usr/bin/R --vanilla -f install_libraries.R

# Execute the target script
CMD ["Rscript", "get_twitter_logo.R"]
