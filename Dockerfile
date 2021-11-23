FROM bioconductor/bioconductor_docker:RELEASE_3_14

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install(ask=FALSE)"

RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install('pcaExplorer', dependencies=TRUE)"

RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install('ideal', dependencies=TRUE)"

RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install('GeneTonic', dependencies=TRUE)"

RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install('macrophage', dependencies=TRUE)"

## How to build:
## from the folder where the Dockerfile is stored:
# docker build -t federicomarini/pigt_currprotbioinfo:latest -t federicomarini/pigt_currprotbioinfo:RELEASE_3_14 .
## To update on the DockerHub - derived from https://github.com/Bioconductor/bioconductor_docker/blob/master/.scripts/weekly_build.sh
# docker login --username=$DOCKER_USERNAME --password=$DOCKER_PASSWORD
# docker push federicomarini/pigt_currprotbioinfo:latest
# docker push federicomarini/pigt_currprotbioinfo:RELEASE_3_14
## To be found then at https://hub.docker.com/repository/docker/federicomarini/pigt_currprotbioinfo
