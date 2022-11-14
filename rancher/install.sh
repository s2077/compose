#!/bin/bash

sudo docker run --privileged -d --restart=unless-stopped -p 8010:80 -p 8011:443 --name rancher rancher/rancher:stable