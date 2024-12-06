---
title: "Clean Up Calendar Alarms"
summary: iOS Shortcut for removing alarms created by Calendar Alarms Shortcut.
date: 2024-12-05
series: ["lifehacks"]
weight: 3
aliases: ["/ios-shortcuts-delete-alarms"]
tags: ["iOS-Shortcuts", "iPhone"]
author: ["Sara DM"]
ShowToc: false
ShareButtons: twitter, bluesky
---

It can be useful to use this shortcut combined with this [other one](/posts/ios-shortcuts-calendar-alarms/), in two automation workflows that would go like: first thing in the morning, create shortcuts of the day. Last thing in the day, remove them.

## What
With this shortcut you can bulk remove alarms based on a given emoji in their name.

Download from this GitHub [repo](https://github.com/Kaylen7/iOS-Shortcuts/blob/main/Clean%20Alarms%20Up.shortcut).

## How it works
It finds all alarms that have a matching emoji and removes them.

## Now what? 
We complain a bit. It would be ideal if this shortcut could work without supervision, but Apple considers it dangerous enough to prevent a non-supervised execution. I think I've tried everything to allow this shortcut to run unsupervised and in the end, there's always a notification to execute the removal <span class="emoji">🤷‍♀️</span>.  

So... well, it still deletes all the alarms but I would not consider this the best lifehack.