+++
date = '2026-03-30T02:44:43+03:00'
draft = false
title = 'FM Arrow Tune: From simple tuning to real scanning (v0.1.0 → v0.3.0)'
tags = ["sdr", "radio", "fm-dx", "sdrsharp", "plugin"]
+++
## Overview

FM Arrow Tune started as a small quality-of-life improvement for SDR#.

The original goal was simple:  
make FM band browsing faster and more intuitive using keyboard arrow keys.

Very quickly, the idea evolved into something much more powerful — a lightweight scanning and DX tool.

---

## Why I built this

I often use SDR# remotely via Splashtop on an iPad.  
The virtual arrow keys made it obvious how convenient keyboard-based tuning could be.

Clicking frequencies or typing them manually felt slow.  
Arrow keys felt natural.

So I built it.

---

## v0.1.0 — The beginning

The first version was intentionally simple:

- Left / Right arrows tune frequency
- Fixed step size
- FM-focused usage

This alone already made listening much more fluid.

---

## v0.2.0 — Band awareness

Next came a major usability upgrade:

- Up / Down arrows for larger band jumps
- Configurable step size
- Configurable jump size
- FM band limits (87.5–108.0 MHz)
- Optional wrap-around tuning

This made it much easier to explore the band quickly.

---

## v0.3.0 — Scanning becomes real

This was the turning point.

### Hold-to-scan

Instead of tapping repeatedly:

- Hold arrow → continuous tuning
- Release → stop

This created a natural “manual scan” experience.

---

### Adjustable scan speed

Scan speed is now configurable:

- Fast scan for band sweeping
- Slower scan for precise listening

---

### Result

At this point, FM Arrow Tune is no longer just a shortcut plugin.

It behaves like a real scanning tool:
- fast
- tactile
- efficient

---

## What’s next

The next version will go even further.

### Planned for v0.4.0

- Auto scan mode (start/stop with hotkey)
- Scan logging to TXT
- Timestamped frequency logging
- Stop on signal (RSSI threshold)
- RDS-based detection (PI / station name)

The goal is to evolve into a lightweight FM-DX logging tool.

---

## Final thoughts

What started as a small idea turned into something I now use daily.

Sometimes the best tools come from solving your own small frustrations.

---

## Links

- GitHub: https://github.com/fmatic/FM-Arrow-Tune
