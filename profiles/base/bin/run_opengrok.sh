#!/bin/bash
docker run -d -v ~/devfactory_work/svn/FirewallForCode/trunk/:/src -p 80:8080 steinwaywhw/opengrok
