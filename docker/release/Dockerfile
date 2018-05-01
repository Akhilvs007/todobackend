FROM jmenga/todobackend-base:latest
MAINTAINER Akhil VS <akhil.vs7@gmail.com>

# Copy application artifacts
COPY target /wheelhouse

# Install application
RUN . /appenv/bin/activate && \
    pip install --no-index -f /wheelhouse todobackend && \
    rm -rf /wheelhouse
