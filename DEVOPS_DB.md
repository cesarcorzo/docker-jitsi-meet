---
id: devops-guide-docker
title: Self-Hosting Guide - Docker
sidebar_label: Docker
---

## Quick start for DeltaBridge

In order to quickly run Jitsi Meet on a machine running Docker and Docker Compose,
follow these steps:

* Install git
  * `sudo apt install git`
* Download and extract the [latest release] and go to **dev** branch:
  * `git clone https://github.com/cesarcorzo/docker-jitsi-meet && cd docker-jitsi-meet`
  * `git checkout dev`
* Execute environment setup.This script will install **docker**, **docker-compose** and setup jitsi environment variables.
  * `./setup.sh`
* Create required `CONFIG` directories
  * `mkdir -p /home/ubuntu/.jitsi-meet-cfg/{web/letsencrypt,transcripts,prosody/config,prosody/prosody-plugins-custom,jicofo,jvb,jigasi,jibri}`
* Run ``docker-compose -f docker-compose-db.yml -f jibri.yml up -d ``
* Access the web UI at [``https://localhost:8443``](https://localhost:8443) (or a different port, in case you edited the compose file).

Note that HTTP (not HTTPS) is also available (on port 8000, by default), but that's e.g. for a reverse proxy setup;
direct access via HTTP instead HTTPS leads to WebRTC errors such as _Failed to access your microphone/camera: Cannot use microphone/camera for an unknown reason. Cannot read property 'getUserMedia' of undefined_ or _navigator.mediaDevices is undefined_.
