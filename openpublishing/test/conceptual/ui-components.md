---
description: na
keywords: na
pagetitle: Conceptual UI Components
search: na
ms.custom:
  - ATA
ms.date: na
ms.prod: identity-ata
ms.technology:
  - security
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: f9ab356c-4c1c-444c-b221-2451aaebc14b
ms.author: 5f6e9ed0-302d-496f-873c-7a2b94e50410
---
# Conceptual UI Components
This page is dedicated to test Conceptual UI Components rendering. It refers to the minky mockup design.

Below is the link:
http://weareminky.com/share/ms/docs/meta/conceptual-ui-components-preview.html

See the markdown for this file [in Github](https://github.com/Microsoft/Azure-RMSDocs-pr/blob/master/Azure-RMSDocs/scratch.md); see the markdown reference in [the EM Pilot style guide](https://worldready.cloudapp.net/Styleguide/Edit?id=2781&topicid=36931). 

## second level heading
### Third level heading
#### Fourth level heading
##### Fifth level heading
###### Sixth level heading

## Text styling

*Bold*  

**italics** 

~~strikethrough~~ 


# Links

[link to markdown file in same repo](./small.md)
[link to external website](https://azure.microsoft.com)
Bare URLS become clickable: http://www.github.com/


## Lists

- This
- is
- a
- bulleted
- list

1. This
2. is
3. a
4. numbered
5. list


1. Lists
1. embedded
  1. embedded
  2. numbered
  3. list
1. into
1. other
  - embedded
  - bulleted
  - list
1. list

## Checklists ??

Is this a real thing? 
- [x] This is GFM but does it work on docs.ms
- [x] list syntax required (any unordered or ordered list supported)
- [x] this is a complete item
- [ ] this is an incomplete item


## Horizontal rule
---

## Table

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

## Do you head a header row??

| Do you      | really need |
| to have a      | header row??      |



## Code

### Codeblock

    function fancyAlert(arg) {
      if(arg) {
        $.docs({div:'#foo'})
      }
    }

### In-line code

This is an example of `in-line code`.

## Blockquote

> The drought had lasted now for ten million years, and the reign of the terrible lizards had long since ended. Here on the Equator, in the continent which would one day be known as Africa, the battle for existence had reached a new climax of ferocity, and the victor was not yet in sight. In this barren and desiccated land, only the small or the swift or the fierce could flourish, or even hope to survive.

## Images

### Static Image
![this is the alt text](./image/ATA_config_icon.JPG)

### Linked Image

[![alt text for linked image](./image/ATA_Domain_Connectivity_User.JPG)](https://azure.microsoft.com) 

## Alerts

> [!NOTE]
> This is NOTE

> [!WARNING]
> This is WARNING

> [!TIP]
> This is TIP

> [!IMPORTANT]
> This is IMPORTANT

## Videos

### Youtube
<iframe width="420" height="315" src="https://www.youtube.com/embed/R6_eWWfNB54" frameborder="0" allowfullscreen></iframe>

### Azure Videos

<iframe src="http://channel9.msdn.com/Series/Azure-Active-Directory-Videos-Demos/Azure-Active-Directory-Connect-Express-Settings/player" width="960" height="540" allowFullScreen frameBorder="0"></iframe><br><br>

##docs.ms extentions
### Button
> [!div class="button"]
[button links](./index.md)

### Selectors
Use a Switch to let the user select one of two options, or even a permutation of options.

Below is single selector:
> [!div class="op_single_selector"]
- [ATA Deployment Guide](./small.md)
- [Install ATA](./large.md)

Below is multi selector:
> [!div class="op_multi_selector" title1="Platform" title2="Backend"]
- [(iOS | .NET)](./small.md)
- [(iOS | JavaScript)](./large.md)

### Step-by-step
For step-by-step tutorials, you may optionally include the step-by-step UI component at the bottom of the article.
> [!div class="step-by-step"]
[prev](small.md)
[next](large.md)
