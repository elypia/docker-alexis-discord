# Fetch specified binary from Alexis repository.
FROM alpine:3.12.0 AS build

# The location to download and extract Alexis (Discord) from. (TODO: Discord link due to issue with GitLab access settings.)
ARG LOCATION="https://gitlab.com/Elypia/alexis/-/jobs/600242315/artifacts/download"

# Environment variables set to ensure consistency in names.
ENV ARCHIVE_NAME="alexis.zip"

# We'll move builds from here to the next image.
WORKDIR /home/dev/

# Download and Extract Alexis
RUN echo "Downloading and extracting Alexis locally" && \
    wget --output-document ${ARCHIVE_NAME} ${LOCATION} && \
    unzip ${ARCHIVE_NAME} && \
    echo "Delete zip archive of Alexis before continuing" && \
    rm ${ARCHIVE_NAME}

# Smallest appropriate image.
FROM openjdk:11.0.7-jre-slim

LABEL maintainer="seth@elypia.org"

RUN echo "Adding alexis system group and user" && \
    groupadd --system --gid 1000 alexis && \
    useradd --system --create-home --gid alexis --uid 1000 --shell /bin/bash alexis

USER alexis

WORKDIR /home/alexis/

# Copy over the application from the build image; it's just a single jar file.
COPY --from=build /home/dev/discord/build/libs/* /home/alexis/

ENV org.apache.deltaspike.ProjectStage=Production

# On startup, execute the jar.
ENTRYPOINT ["java", "-jar", "/home/alexis/alexis-discord.jar"]

# Check the README.md to find our how to configure the image.
