---
title: "London Tube Line Status"
summary: iOS Shortcut for getting an alert of the status of the tube.
date: 2024-12-06
series: ["lifehacks"]
weight: 1
aliases: ["/ios-shortcuts-get-line-status"]
tags: ["iOS-Shortcuts", "iPhone", "API"]
author: ["Sara DM"]
cover:
  image: images/ios-shortcuts-tfl-line.jpg
  hiddenInList: false
ShowToc: false
ShareButtons: twitter, bluesky
---

# What
I created an iOS Shortcut that shows an alert with the current status of a tube line in London. It makes use of London's TFL API, so in order to set it up, you should register to get an `app_id` and an `app_key`.

# How to install
1. Register for free in tfl [website](https://api-portal.tfl.gov.uk/).
2. Once you sign in, go to Products > 500 Requests per min > add name for subscription and subscribe. This will be the `app_id`. 
3. Go to Profile. In Subscriptions you should see the details. Use "primary key" as your `app_key`. 
4. Download the shortcut from my GitHub [repo](https://github.com/Kaylen7/iOS-Shortcuts/blob/main/Get%20Tube%20Status.shortcut). 
5. The first time you open the shortcut, you'll be asked to provide the name of the tube line, the `app_id` and the `app_key`. 
6. Test to check if the request works correctly, you should see the current line status.

All set! 

Next step is probably setting up a trigger whenever you want to get notified about this, before commuting or as morning/evening routine notification.

# Some praise to TFL API
I must say I am impressed in how well documented and structured this API is. I was able to get straight to the point, no loops or wandering around, tests can be done from whithin the website itself, and they also have Postman links... I wish Barcelona's TMB was as good, but I guess incidencies are not reported through it, so it is not useful for this case scenario <span class="emoji">🤷‍♀️</span>. I tried to find if RENFE has an API as well and got to a weird [data API](https://data.renfe.com/api/1/util/snippet/api_info.html?resource_id=a2368cff-1562-4dde-8466-9635ea3a572a) with info about train stations. Yet updated train status is nowhere to be seen. 