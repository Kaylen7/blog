---
title: "Crea alarmas para eventos de iCalendar"
summary: Atajo de iOS para crear alarmas en función de los eventos de hoy de iCalendar.
date: 2024-12-04
series: ["lifehacks"]
weight: 2
aliases: ["/ios-shortcuts-calendar-alarms"]
tags: ["iOS-Shortcuts", "iPhone"]
author: ["Sara DM"]
ShowToc: false
ShareButtons: twitter, bluesky
---

Este atajo usa este [otro](/posts/ios-shortcuts-alarms/) para crear dos alarmas antes del evento. Si no te has descargado ese atajo, te recomiendo hacerlo para que el atajo que nos concierne ahora no te de errores.

## Qué
He creado un atajo de iOS para automatizar la creación de alarmas en función de los eventos de iCalendar para hoy.

Puedes descargarlo desde este [repo](https://github.com/Kaylen7/iOS-Shortcuts/blob/main/Get%20Alarms%20For%20Today.shortcut) de GitHub.

## Cómo funciona
Básicamente localiza los eventos que contienen un emoji determinado en el nombre (por defecto el atajo usa 📆, pero deberás especificar el que quieras cuando abras el atajo por primera vez). Después usa el atajo [`Crear alarmas`](https://github.com/Kaylen7/iOS-Shortcuts/blob/main/Create%20Alarms.shortcut) para cada evento del día. Con tal de poder especificar un tiempo de desplazamiento flexible, el atajo comprueba la convención siguiente en el nombre del evento: `:tiempo_en_minutos:`.

- **Lo siguiente funcionará**:  
`📆 Evento :25:` – Crea alarmas considerando un desplazamiento de 25 minutos. 
`📆 Evento` – Crea alarmas considerando el desplazamiento por defecto (lo especificas la primera vez que abres el atajo).
`📆 Evento:más info :25:` – Funcionará, aunque el nombre del evento será `Evento` 
`📆 Evento :5: :25:` – Aquí el desplazamiento será de 5 minutos (25 quedará omitido)

- **No funcionará**:  
`Nombre del evento` – No creará las alarmas, ya que falta el emoji que activa el atajo.

## Por qué
Por un lado, se trata de una continuación lógica tras el atajo de crear dos alarmas para un evento. Sin embargo, no lo usaría si las notificaciones de iCalendar funcionaran correctamente y no fuera tan sencillo obviarlas <span class="emoji">😅</span>.  

Hay algo más que haría distinto. He intentado crear un atajo más limpio obteniendo la información completa del evento, ya que en iCalendar puedes definir alertas e incluso un tiempo de desplazamiento. Por alguna razón, la aplicación de atajos no permite obtener nada más que el nombre del evento y un booleano sobre si tiene alarmas o no. No he encontrado cómo obtener más información que esto <span class="emoji">🤷‍♀️</span>. 

## ¿Y ahora qué? 
Primero, te recomiendo que añadas este atajo a una rutina de automatización.  
Después, creo que es interesante crear un atajo que limpie todas las alarmas al acabar el día... <span class="emoji">🙃</span>