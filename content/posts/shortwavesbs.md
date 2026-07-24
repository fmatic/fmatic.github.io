+++
date = '2026-06-09T18:34:54+03:00'
draft = true
title = 'Shortwave.sbs'
tags = ["Shortwave Schedule", "shortwave.sbs", "dxi", "coding", "project"]
+++
Well, there is plenty of Shortwave schedule-sites, so why not build another one? Meet a [shortwave.sbs](https://shortwave.sbs)

## What is this?

shortwave.sbs is a modern dark-themed HF broadcast monitor built for shortwave listeners, DXers and radio enthusiasts.

It combines multiple shortwave schedule sources with live filtering, transmitter-site data, distance and bearing calculations, NOAA space weather, greyline awareness and propagation-oriented DX ranking. The built-in DX Assistant analyses current conditions and recommends both the most promising band and active stations to try right now.

## Features

- Live UTC clock
- On-air now filtering
- HF band activity overview
- Auto Band recommendation
Intelligent DX Assistant
DX Assistant with live band recommendations
Clickable recommended band with one-step filtering
Try These Now station recommendations
Propagation-aware target ranking with distance and bearing
Best DX Now with propagation-aware scoring
HF Conditions with regional fallback profiles
NOAA-based HF Weather widget
Kp, A-index, SFI and X-ray awareness
Greyline and day/night path awareness
Season-aware DX scoring
Clickable transmitter-site details
Distance and bearing to transmitter sites
Open transmitter site in map
Same-frequency active broadcast view
Country flags based on ITU country codes
Responsive dark UI for desktop and mobile
Data sources

EiBi shortwave schedule database
AOKI shortwave schedules from XLSX source
HFCC public data with lookup tables
NOAA SWPC space weather data
ITU HFBC public broadcast requirements, available as an optional reference source
HFCC lookup tables are used for transmitter sites, broadcaster names, administrations and site coordinates where available. NOAA SWPC data is used for Kp, A-index, solar flux, X-ray status and HF band condition estimates.

Current data engine

EiBi CSV importer
AOKI XLSX importer
HFCC importer with site, broadcaster and admin resolvers
EiBi transmitter-site resolver with alias support
ITU HFBC public broadcast requirements, available as an optional reference source
NOAA space weather updater via GitHub Actions
Unified JSON schedule output
Unified space-weather JSON output
Basic duplicate/source merge logic
Propagation-aware Best DX scoring
DX Assistant band scoring engine
Propagation-aware station recommendation engine
Schedule source release metadata and update verification
