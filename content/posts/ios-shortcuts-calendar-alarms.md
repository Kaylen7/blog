---
title: "Set up alarms for iCalendar events"
summary: iOS Shortcut for creating alarms based on iCalendar events for today.
date: 2024-12-04
series: ["lifehacks"]
weight: 1
aliases: ["/ios-shortcuts-calendar-alarms"]
tags: ["iOS-Shortcuts", "iPhone"]
author: ["Sara DM"]
ShowToc: false
ShareButtons: twitter, bluesky
---

This shortcut implements [another one](/posts/ios-shortcuts-alarms/) for creating two alarms for an event. If you haven't read about it already, take a look a it as you will need it in order to use this one. 

## What
I created an iOS Shortcut for automating the creation of alarms based on iCalendar events for today.

Download from this GitHub [repo](https://github.com/Kaylen7/iOS-Shortcuts/blob/main/Get%20Alarms%20For%20Today.shortcut).

## How it works
It basically checks the events that have a certain emoji in the name (by default I use 📆 but you are asked to set it the first time you open the shortcut). Then it uses [`Create alarms`](https://github.com/Kaylen7/iOS-Shortcuts/blob/main/Create%20Alarms.shortcut) to create alarms for the day. In order to handle a flexible travel time, this checks whether the event's name follows the following convention: `:travel_time_in_minutes:`. 

- **Will work**:  
`📆 Event name :25:` – Creates the alarms considering 25 minutes of travel time.  
`📆 Event name` – Creates the alarms considering default travel time (set the first time you open the shortcut).  
`📆 Event name:something else :25:` – This works, though name will be `Event name`   
`📆 Event name :5: :25:` – Here travel time will be 5 and 25 will be omitted.  

- **Won't work**:  
`Event name` – It won't create alarms, as trigger emoji is missing.

## Why
This is a logical follow-up from creating a shortcut that sets two alarms for an event. However, I would not use it if iCalendar had notifications that actually worked and were not highly missable <span class="emoji">😅</span>.   

There's also something else that I would rather do. I tried to have a cleaner shortcut by getting the event's info, as you can actually define two alerts, and even travel time when creating an event in iCalendar. For some reason, shortcuts only allows importing the event's name, or a boolean whether it has alarms or not. It does not let you get any more info than that (or I haven't been able to find it <span class="emoji">🤷‍♀️</span>).

## Now what? 
First, I suggest you add this shortcut to an automation routine.  
Next, I think it's also interesting to define a new shortcut that helps clean out all the alarms once the day is over... <span class="emoji">🙃</span>