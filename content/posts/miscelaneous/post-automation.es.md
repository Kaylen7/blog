---
title: "Entorno para escribir publicaciones"
summary: "Algunas de las herramientas que uso para escribir markdown más rápido"
date: 2024-12-08
series: ["lifehacks"]
weight: 1
aliases: ["/post-automation"]
tags: ["hugo", "paperMod", "bash"]
author: ["Sara DM"]
cover:
  image: images/post-automation.jpg
  hiddenInList: false
ShowToc: false
ShareButtons: twitter, bluesky
---

Mientras escribía un par de publicaciones para mi serie de atajos de iOS me di cuenta de que hay un montón de cosas repetitivas en el proceso, así que he decidido acelerar un poco las cosas con un par de scripts en bash.

{{< callout type="info" title="Consideraciones previas" >}}
Primero intenté ver si podía modificar `hugo new posts/post-name.md`. Aunque es posible crear `frontmatter` personalizada a través de `archetypes`, no ofrece la flexibilidad de crear tags o series customizadas. Para ello hay que crear arquetipos para cada sección, pero no tengo ese tipo de organización y prefiero añadir esa información al crear el post.

También vi que hay la posibilidad de añadir `Params`, pero si no me equivoco, se configuran de forma global y entonces usas uno u otro. De nuevo, requiere de una planificación que no suelo tener. 
{{< /callout >}}

&nbsp;  
Por lo que tomé la vía de los scripts en bash. <span class="emoji">🤷‍♀️</span> 
A continuación un resumen de cómo usar estos scripts.

Si planeas usarlos a menudo, te recomiendo añadirlos como alias (`new` y `translate`) en tu `.zshr` (o el que uses). Si no, puedes usarlos manualmente con `sh scripts/new_post.sh [flags]` y `sh scripts/translate.sh [flags]`. 

## New_post.sh
Literalmente crea una publicación nueva. Acepta las opciones siguientes:
- `-f`: nombre de archivo (obligatoria)
- `-d`: directorio
- `-s`: series (separadas por comas)
- `-t`: etiquetas (separadas por comas)
- `-T`: título
- `-S`: resumen
- `-h`: muestra opciones de uso 

A excepción del nombre de archivo, las demás etiquetas son opcionales y por defecto son cadenas de texto vacías. Por defecto, el directorio es `./contents/posts`.

Soy consciente de que podría refactorizar parte de los scripts para tener un código menos repetitivo, pero de momento dejaré eso para otro día. <span class="emoji">😅</span> 

## Translate.sh
Dado un nombre de archivo, copia la publicación y añade la extensión de lenguaje al nombre. Acepta los siguientes parámetros:
- `-f`: nombre de archivo (requerido).
- `-l`: código de lenguaje. Por defecto es `es`. 

Dado que ejecuta el comando `find`, acepta regex para nombre de archivo. Sin embargo, si encuentra múltiples coincidencias, dará error y no se ejecutará la copia.

## Customización de VSCode
- `Markdown All in One`. Extensión para los atajos típicos para estilar texto `cmd+i`: *itálica*, `cmd+b`: **negrita**, entre otras cosas.
- `VSCode User Snippets`. Uso *snippets* customizados para añadir `callouts` y bloques HTML customizados. Por ejemplo, tengo un  `<span class="emoji">SELECTED_TEXT</span>` asignado al atajo `cmd+9`.

### Ejemplo de Snippet
```json
{
	"Callout": {
		"prefix": "callout",
		"body": [
			"\{\{< callout type=\"${2|info,warning,danger,success|}\" title=\"${1:}\" >\}\}",
			"${TM_SELECTED_TEXT}",
			"\{\{< /callout >\}\}"
		]
	}
}
```
Es destacable cómo `${2|option1,option2,option3|}` permite crear un selector de opciones dentro del tabulador. Este código se implementa de la forma siguiente:
1. Añade etiquetas de apertura y cierre antes y después del texto seleccionado. 
2. El cursor se encuentra en el parámetro `title`. Después de escribir, si pulsas `tab`, el foco cambia a `type` y muestra un selector con las opciones: `info, warning, danger, success`.

### Ejemplo de atajo de teclado (Key Binding)
```json
[
    {
        "key": "cmd+8",
        "command": "editor.action.insertSnippet",
        "when": "editorTextFocus && editorHasSelection",
        "args": {
            "name": "Callout"
        }
    }
]
```