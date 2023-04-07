---
title: Mermaid test!
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

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

### Mermaid chart

$$
  f(x) \le 1
$$

If you want to $f \in [0,1]$ you must ensure that $g^2 \ge 0$:

$$
\begin{aligned}
  f(x) &= \sum_{i=0}^n f_i(x) \\
       &= 10
\end{aligned}
$$

```mermaid
graph LR
    A[Square Rect] -- Link text --> B((Circle))
    A --> C(Round Rect)
    B --> D{Rhombus}
    C --> D
```

```mermaid
pie title NETFLIX
         "Time spent looking for movie" : 90
         "Time spent watching it" : 10
```
