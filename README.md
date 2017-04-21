# UIAppearance_demo

```

While iOS uses all the non-transparent pixels of the back indicator image to draw the indicator, it does something entirely different with the transition mask image: it masks the indicator with the non-transparent pixels of the transition mask image so that when the text moves to the left, the indicator is only visible in the those areas.
In the original implementation, you provided an image that covered the entire surface of the back indicator so the text remained visible through the transition. But now you’re using the indicator image itself as the mask, but the text disappeared at the far right edge of the mask, not under the indicator proper.


```
