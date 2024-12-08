---
title: "Setup for Writing Posts"
summary: "Some tools I use for writing markdown faster"
date: 2024-12-08
series: ["lifehacks"]
weight: 1
aliases: ["/post-automation"]
tags: ["hugo", "paperMod", "bash"]
author: ["Sara DM"]
cover:
  image: images/.jpg
  hiddenInList: true
ShowToc: false
ShareButtons: twitter, bluesky
---

I have written a couple of posts for my ios-shortcuts series and noticed there's actually tons of things that are quite repetitive in the process, so I decided to speed things up with a couple of bash scripts. 

{{< callout type="info" title="Previous considerations" >}}
First I tried to find how to enhance `hugo new posts/post-name.md`. While there's the possibility of modifying archetypes to add custom frontmatter, I miss flexibility for custom tags or series. One way of achieving this is having different archetipes for each section, but I'd rather create them on the go. 

There's also the possibility of adding `Params`, but again, if I am not mistaken they have to be globally configured in order to be used. Then you'd typically chose one or another. 
{{< /callout >}}

So I opted for the bash-scripting way. <span class="emoji">🤷‍♀️</span> 
Here's a recap of how to use these scripts.

If you plan on using them often, you can add them to your `.zshr` as aliases (I suggest `new` and `translate`, but up to you). If not, manual usage is `sh scripts/new_post.sh [flags]` and `sh scripts/translate.sh [flags]`. 

## New_post.sh
Quite literal, creates new post. Accepted flags are:
- `-f`: filename (required)
- `-d`: directory
- `-s`: series (separated by commas)
- `-t`: tags (separated by commas)
- `-T`: title
- `-S`: summary
- `-h`: shows script usage  

Aside from filename, all flags are optional and default to empty strings. Directory defaults to `./contents/posts`.
I am aware there's some refactoring that could be done in order to stick to DRY, but I will leave that for later. <span class="emoji">😅</span> 

## Translate.sh
Copies a post given its filename and adds the language extension. Accepted flags are:
- `-f`: filename (required).
- `-l`: language code. Defaults to `es`. 

As it performs a `find` command, it accepts regex for filename. However, given multiple matches, it will raise an error.

## VSCode enhancements
- `Markdown All in One` Extension for typical character styling shortcuts `cmd+i`: *italics*, `cmd+b`: **bold**, and much more.
- `VSCode User Snippets`. I use custom snippets for callouts and custom tags. For example I have `<span class="emoji">SELECTED_TEXT</span>` binded to `cmd+9`.

### Example Snippet
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
It is interesting to notice how `${2|option1,option2,option3|}` creates a dropdown of options within tap. This snippet executes as follows:
1. Pastes open-closing callout tags around selected text. 
2. Cursor is at title. Once you write it, `tab` shifts focus to `type` and shows dropdown with options: `info, warning, danger, success`.

### Example Key Binding
```
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