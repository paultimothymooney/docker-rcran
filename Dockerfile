FROM rocker/tidyverse

RUN apt-get update && \
    && apt-get install -y imagemagick libudunits2-dev curl \
    tesseract-ocr -y \
    #libtesseract-dev -y \
    #tesseract-ocr-eng -y \
    
# Install Rust and Cargo. Some R packages requires Rust.
# See: b/113106905
RUN curl -sSf https://static.rust-lang.org/rustup.sh | sh

ADD package_installs.R /tmp/package_installs.R
RUN Rscript /tmp/package_installs.R && \
    bash -c "rm -Rf /tmp/Rtmp*"
