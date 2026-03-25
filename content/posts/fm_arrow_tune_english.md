+++
date = '2026-03-25T11:35:22+02:00'
draft = false
title = 'FM-Arrow-Tune'
tags = ["SDRSharp", "Plugin", "Plugins"]
+++

## A small quality-of-life plugin for SDR#

I have been practicing SDR# plugin development, and this little project became my first working release.

The idea came from a very practical real-world use case. I often listen to SDR# remotely from my iPad via Splashtop, and Splashtop provides virtual arrow keys on screen. That immediately made me think: *what if I could browse the FM band simply by tapping left and right?*

So I built exactly that.

## The idea

The plugin is called **FM Arrow Tune**.

Its purpose is simple: make FM band browsing more comfortable by using the keyboard arrow keys for tuning.

For my own use, this is especially handy when controlling SDR# remotely from an iPad. Instead of clicking tiny on-screen controls or manually entering frequencies, I can just tap the virtual left and right arrows and move smoothly through the band.

That turns out to be surprisingly pleasant in practice.

## Current features

The first public version already includes a nice set of options:

- Left / Right arrow tuning
- Adjustable step size
- Optional WFM-only mode
- Optional FM band clamp (87.5–108.0 MHz)
- Optional wrap-around tuning
- Optional Ctrl + Arrow requirement

So even though this started as a small experiment, it already feels like a proper and genuinely useful plugin.

## Why I made it

This was not really about creating something huge or complex. It was more about learning the SDR# plugin architecture and building a tool that solves a real annoyance in everyday listening.

That is often how the best little utilities are born.

In this case, I wanted:

- easier tuning while listening remotely
- a smoother “band browsing” feel
- a simple keyboard-driven workflow
- something that works especially well with Splashtop on iPad

And now that it works, I have to say: it feels exactly the way I hoped it would.

## Development notes

Getting the first version built was also a nice little journey through SDR# plugin development:

- setting up the SDR# plugin SDK
- figuring out the correct project structure
- dealing with .NET / assembly compatibility
- building and testing against the current SDR# environment

As usual, the idea itself was simple — the fun part was making everything play nicely together.

## What’s next

This first version focuses on Left / Right arrow tuning, but there is definitely room to expand it further.

Ideas for future versions:

- **Up / Down arrow band jumps**
  - for example 500 kHz or 1 MHz jumps

- **Hold-to-scan**
  - hold Right to scan upwards
  - hold Left to scan downwards
  - release to stop

Those two additions would make it even better for remote use on an iPad.

## First release

I decided to publish this as **v0.1.0**. That feels like the right version number for a first public release: working, useful, but still clearly the beginning of something that can grow further.

## Final thoughts

I really like projects like this.

A simple idea, a practical use case, a bit of experimentation, some debugging, and in the end a tool that genuinely improves the listening experience.

And honestly, there is something very satisfying about browsing the FM band just by tapping left and right on an iPad screen.

That alone made the whole thing worth building.
