---
title: Test!
subtitle: Included just for fun :)
description: This is a post about Mermaid library.
date: "2021-03-22"
tags:
  - tag-x
  - tag-y
layout: layouts/post.njk
css_libraries:
  - /assets/styles/prism-base16-monokai.dark.css
  - /assets/styles/katex.min.css
---


```python
import matplotlib.pyplot as plt
import matplotlib as mpl
```


```python
plt.style.use('seaborn-v0_8-paper')
plt.rcParams["figure.figsize"] = (4,3)
mpl.rcParams['figure.dpi'] = 300
```




```python
plt.plot([1,2,3,4,5,6,7,10,20])
```




    [<matplotlib.lines.Line2D at 0x1176d19f0>]




    
{% imageMd "./src/notebooks/test_files/test_4_1.png", "", "", "img-container grid-column-center", "img-post", "", "" %}
    



```python

```
