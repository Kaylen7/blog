---
title: "Set Up Two Alarms Before an Event"
summary: iOS Shortcut that creates two alarms before event, with adjustable default for getReady time span and required input for travelTime.
date: 2024-11-30
series: ["lifehacks"]
weight: 1
aliases: ["/ios-shortcuts-two-alarms"]
tags: ["iOS-Shortcuts", "iPhone"]
author: ["Sara DM"]
cover:
  image: images/ios-shortcuts-alarms.jpg
  hiddenInList: false
ShowToc: false
ShareButtons: twitter, bluesky
---

## What
I built an iOS Shortcut to help me manage time before an event. I usually needed two alarms: one for getting ready, the other for leaving. I automated this with a shortcut that lets me set a default span of time for getting ready and asks the amount of time it takes to get to the place.  

Download from this GitHub [repo](https://github.com/Kaylen7/iOS-Shortcuts/blob/main/Create%20Alarms.shortcut).

## Why
I tend to lose track of time when I'm in focus mode. I found that it takes a certain amount of time for me to shift my attention to a new activity, so I got used to setting up two alarms whenever I had plans. This shortcut helps ensure that I don't mess up when setting the alarms; thus releasing me from the concern of wondering if I set them correctly or I'll still be late because I mixed the numbers. 

## How  
The first time you install the shortcut you will be prompted to set a default span of time for getting ready. This will be the time that spans between the first alarm and the second.

Once you run the shortcut, you'll be asked to:
1. Input the name for the event (this will work as a label for the alarm),
2. set its time,
3. and the amount of time it takes to get there.

Now if you open iPhone's Clock App you should see two new alarms: 
- <span class='emoji'>👩‍💼</span> **Event - Get Ready**  
- <span class='emoji'>👩‍💼</span> **Event - Leave**  

All set!

I find this shortcut specially useful, so I have it in my `Widgets` menu.

{{< callout type="info" title="Atention" >}}
This shortcut is only meant for creating events for what is left of the day, starting from the current hour. It does not let you set alarms for events with a starting time lower than the current hour.
{{< /callout >}}

## Now what?
You might wonder if you can combine this with iCalendar to set alarms for today's events... I thought the same and built [another shortcut](/posts/ios-shortcuts-calendar-alarms/) for it.