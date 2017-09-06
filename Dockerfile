# start with the official R project base image
FROM r-base:latest

# copy this github repo into the Docker image and set as the working directory
COPY . /scripts
WORKDIR /scripts

# Install the libraries needed to run the app
RUN /usr/bin/R --vanilla -f install_libraries.R

# Execute the target script
CMD ["Rscript", "get_twitter_logo.R"]
