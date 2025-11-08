FROM openjdk:8-jdk-slim

WORKDIR /server

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl unzip && \
    rm -rf /var/lib/apt/lists/*

# Copy a small bootstrap script to handle first-run setup
COPY ./bootstrap.sh /bootstrap.sh
RUN chmod +x /bootstrap.sh

EXPOSE 25565
ENV MEMORY=6G

# Run bootstrap on container start
CMD ["/bin/bash", "/bootstrap.sh"]
