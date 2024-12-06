---
title: "Estado de la línea de Metro en Londres"
summary: Atajo de iOS para recibir una alerta sobre el estado de la línea de metro en Londres.
date: 2024-12-05
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

# Qué
He desarrollado un atajo de iOS que muestra una alerta sobre el estado actual de una línea de metro en Londres. Usa la API del servicio TFL (_Transport For London_). Para usarla, deberás registrarte en este servicio y obtener una `app_id` y una `app_key`. 

# Cómo instalar
1. Registrate gratis en la [página de TFL](https://api-portal.tfl.gov.uk/).
2. Cuando accedas, ves a `Products > 500 Requests per min > add name for subscription`, añade el nombre que quieras y pulsa `subscribe`. El nombre que elijas será la `app_id`. 
3. Ves a `Profile`. En el apartado de `Subscriptions` deberías encontrar los detalles. Usa la "primary key" a modo de `app_key`. 
4. Descarga el atajo desde el [repo](https://github.com/Kaylen7/iOS-Shortcuts/blob/main/Get%20Tube%20Status.shortcut) de GitHub. 
5. Cuando lo abras por primera vez, deberás introducir el nombre de la línea de metro, la `app_id` y la `app_key`.
6. Si funciona correctamente, al usarlo deberías recibir la notificación del estado actual de la línea que hayas determinado.

¡Y ya está!

El paso siguiente probablemente sea especificar un elemento que desencadene cuando quieres recibir esa notificación, quizá antes de salir a trabajar o como parte de una rutina.

# Elogios a la API de TFL
Debo decir que estoy impresionada con lo bien documentada y estructurada que está. Es muy sencillo obtener la información directamente, sin rodeos, permite hacer tests de los _endpoints_ desde la propia página web e incluso tienen enlaces a Postman... Ojalá la API de TMB en Barcelona fuera así, pero me imagino que las incidencias no se reportan de la misma forma, por lo que no es útil para esto <span class="emoji">🤷‍♀️</span>. He buscado también si RENFE tiene API y he llegado a una [API de datos](https://data.renfe.com/api/1/util/snippet/api_info.html?resource_id=a2368cff-1562-4dde-8466-9635ea3a572a) con información sobre estaciones de tren en toda España... también hay [esta web](https://datos.gob.es/es/accessible-apidata) pero no acabo de entender dónde encontrar el dataset que me interesaría (el de los avisos por retraso de las líneas <span class="emoji">✌️</span>). Así que... pura admiración por el servicio que tienen en Londres.