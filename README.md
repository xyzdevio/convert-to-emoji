# convert-to-emoji

## Initial Notes

### Motivation:

I like writing things in the base markdown and slack/discord style where you can grab the item directly from the code instead of searching for them from a direct emoji maker.

Problem is, half the time those items dont directly copy or only show up as pure text on website publish even in .mdx files.

### Goal:

Create github action that converts any items that follow the format :descr: to an actual visual emoji version of the text.

This would be great to add to the action sequence that runs before a github pages deployment.

### Limitations:

Dont want to use an extensive database here, so this will be limited by how many emojis there are out there that are easily grab-able (not grabbing all of emojipedia for ex).<br/>
Starting solely with the github specific ones and then adding more as time goes on.

:warning: This means though, that I do need to add a warning or error on the action that if it runs and finds something that could count as an emoji, but doesnt have it on record, it still notifies the user instead of erroring silently.

## Steps (TOC)

## Initial Content

- Using *the* github [emoji cheat sheet](https://github.com/ikatyang/emoji-cheat-sheet) as default basis for what emojis to include
- grabbing image versions from [emojipedia](https://emojipedia.org/) for a quick copy
- actually, just found the [open resource](https://unicode.org/emoji/charts/full-emoji-list.html) for this --> maybe i can purely do this by queries like the emoji-cheat-sheet is doing
  - this [explanation page](https://cldr.unicode.org/#TOC-What-is-CLDR-) goes with it
- even more of a dumdum, [this api](https://docs.github.com/en/rest/emojis) exists for easy use 

:warning:
:grinning:

